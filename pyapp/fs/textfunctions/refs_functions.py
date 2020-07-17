#!/usr/bin/env python3
import os, pathlib, re
from pyapp.models.sa_conn import Session
from pyapp.models.genmodelsmod import DocRefSA
'''
The main class in this module is EnclosedTokenReplacer.
It's a toolchain kind of class where a text with placeholders (called enclosed tokens)
  will be replaced by reference cross-links, ie, an <a> (anchor tag) will link to a name/href and backlink to it again.
In terms of application, it will be used to link references in a text and
  from the references link back to their source anchor-link.
  
Generally, this class can be used as a placeholder replacer where the placeholder is a regular expression enclosing a word (or token).
  The enclosing characters are defined by prefix '((ref-' and a sufix '))' so that the enclosing-string is '((ref-<token>))'.
Though this implementation is not the general one aboved cited,
  a reimplementation might perform the general case and an inherited class might implement the case above shown.
'''
def calc_words(text):
  words = text.split(' ')
  n_words = len(words)
  return n_words

def startswith_number_underline(f):
  try:
    pp = f.split('_')
    _ = int(pp[0])
    return True
  except ValueError:
    pass
  return False

def find_docref_in_db(refstr, session):
  ref = session.query(DocRefSA).filter(DocRefSA.tokid==refstr).first()
  return ref

# ((ref-jeseli11))
ex1 = ' bla ((ref-jeseli11)) bla '
regexp_str = r'(\(\(ref\-\w{8}\)\))' # inscritos
default_re_compiled = re.compile(regexp_str)
def find_refs_via_regexp(text, p_re_compiled = None):
  if p_re_compiled is None:
    p_re_compiled = default_re_compiled
  refs = []
  for item in p_re_compiled.finditer(text):
    ref = item.groups(1) # + ' ' + str(match.group(2))
    refs.append(ref)
  return refs

def find_first_ref_in_text_or_None(text, p_re_compiled = None):
  if p_re_compiled is None:
    p_re_compiled = default_re_compiled
  match_o =  p_re_compiled.search(text)
  if match_o:
    inipos, endpos = match_o.span()
    enctokid = match_o.group(1)
    return (inipos, endpos, enctokid)
  return None

def print_results(refsstr, md):
  session = Session()
  for refstr in refsstr:
    ref = find_docref_in_db(refstr, session)
    print (md, refstr, ref)
  session.close()

root_abspath = pathlib.Path(__file__).parent
def read_all_chapters():
  slug = 'um-alerta-as-geracoes-futuras-sobre-o-go'
  book_abspath = os.path.join(root_abspath, slug)
  filenames = os.listdir(book_abspath)
  filenames = list(filter(lambda f:f.endswith('.md'), filenames))
  mds = list(filter(lambda f: startswith_number_underline(f), filenames))
  mds = sorted(mds)
  nOfChapters = len(mds)
  proj_words_per_chapter = 90000//nOfChapters
  for md in mds:
    md_abspath = os.path.join(book_abspath, md)
    text = open(md_abspath, encoding='utf8').read()
    refsstr = find_refs_via_regexp(text)
    print_results(refsstr, md)

def convert_enctoken_to_tokid(enctoken):
  if enctoken.startswith('((ref-') and enctoken.endswith('))'):
    return enctoken[ len('((ref-') : - len('))') ]
  return None

text1_before_interpol = '''
**A  tese é adiantada por *((ref-bugcor11))*
Outra tese é adiantada por *((ref-bugcor11))* **'''

DEFAULT_ENCTOK_PATTERN_STR = r'(\(\(ref\-\w{8}\)\))' # eg ((ref-bugcor11))
class EnclosedTokenReplacer:

  def __init__(self, text, injectdict, enctok_patternstr=None):
    self.text = text
    self.seq = 1
    self.injectdict = injectdict
    self.ocorrencedict = {}
    self.enctok_comp_regexp = None
    self.compile_regexp(enctok_patternstr)

  def compile_regexp(self, enctok_patternstr=None):
    if enctok_patternstr is None:
      enctok_patternstr = DEFAULT_ENCTOK_PATTERN_STR
    self.enctok_comp_regexp = re.compile(enctok_patternstr)

  def find_first_ref_in_text_or_None(self):
    '''
    :return:
    triple (inipos, endpos, enclosed_token) or None
    '''
    return find_first_ref_in_text_or_None(self.text, self.enctok_comp_regexp)

  def find_inject_phrase_by_enctoken(self, enctoken):
    tokid = convert_enctoken_to_tokid(enctoken)
    if tokid in self.injectdict.keys():
      if tokid in self.ocorrencedict:
        freq = self.ocorrencedict[tokid]
        freq += 1
        self.ocorrencedict[tokid] = freq
        return tokid + str(freq)
      else:
        self.ocorrencedict[tokid] = 1
        return tokid + '1'
    return None

  def replace_text_with_triple_ini_fim_n_word(self, inipos, endpos, enctoken):

    injectphrase = self.find_inject_phrase_by_enctoken(enctoken)
    if injectphrase is None:
      return False
    self.text = self.text[ : inipos] + injectphrase + self.text[endpos : ]
    return True

  def find_enctokid_n_replace(self):
    triple_or_None = self.find_first_ref_in_text_or_None()
    if triple_or_None is None:
      return False
    inipos = triple_or_None[0]
    endpos = triple_or_None[1]
    enctoken = triple_or_None[2]
    return self.replace_text_with_triple_ini_fim_n_word(inipos, endpos, enctoken)

  def roll_replacements(self):
    found = self.find_enctokid_n_replace()
    print(self.seq, self.text, 'continue ', found)
    while found:
      self.seq += 1
      found = self.find_enctokid_n_replace()
      print (self.seq, self.text, 'continue ', found)

def process():
  # read_all_chapters()
  text = text1_before_interpol
  injectdict = {'bugcor11':'Bugalho'}
  replacer = EnclosedTokenReplacer(text, injectdict)
  replacer.roll_replacements()
  print('replacer.text', replacer.text)

if __name__ == "__main__":
  process()
