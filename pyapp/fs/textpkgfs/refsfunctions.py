#!/usr/bin/env python3
import os, pathlib, re
from pyapp.models.sa_conn import Session
from pyapp.models.genmodelsmod import DocRefSA
import config
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

def convert_enctoken_to_tokid(enctoken):
  if enctoken.startswith('((ref-') and enctoken.endswith('))'):
    return enctoken[ len('((ref-') : - len('))') ]
  return None

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

def convert_enclosedtokid_to_tokid(enclosedtokid):
  return enclosedtokid[len('((ref-'): -len('))')]

missing_dbtokids_on_book_dict = {}; uniq_dbtokids_on_book_dict = {}
def print_results(refsstr, md):
  global missing_refs_on_book, total_dbrefs_on_book
  session = Session()
  missing_refs_on_chapter = 0
  for tuplerefstr in refsstr:
    encrefstr = tuplerefstr[0]
    tokid = convert_enclosedtokid_to_tokid(encrefstr)
    uniq_dbtokids_on_book_dict [tokid] = 1
    ref = find_docref_in_db(tokid, session)
    if ref is None:
      missing_refs_on_chapter += 1
      missing_dbtokids_on_book_dict[tokid] = 1
    print (md, tokid, ref)
  total_dbrefs_on_chapter = len(refsstr)
  print (md[0:3], 'missing_counter', missing_refs_on_chapter, 'total', total_dbrefs_on_chapter)
  session.close()

def startswith_number_underline(word):
  '''
    True if word starts with a number followed by an underline (eg "03_filename.ext")
    False otherwise
  :param word: string
  :return: a boolean
  '''
  try:
    int(word.split('_')[0])
    return True
  except ValueError:
    pass
  return False

def get_books_abspath(slug):
  approot_abspath = config.get_approot_abspath()
  return os.path.join(approot_abspath, slug)

root_abspath = pathlib.Path(__file__).parent
def read_all_chapters():
  slug = 'um-alerta-as-geracoes-futuras-sobre-o-go'
  book_abspath = get_books_abspath(slug)
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
  print ('total unique tokids on book', len(uniq_dbtokids_on_book_dict), 'missing_dbtokids_on_book_dict', len(missing_dbtokids_on_book_dict))

def process():
  read_all_chapters()

if __name__ == "__main__":
  process()
