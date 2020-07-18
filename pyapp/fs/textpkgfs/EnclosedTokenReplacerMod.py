#!/usr/bin/env python3
import os, pathlib, re
from pyapp.models.sa_conn import Session
from pyapp.models.genmodelsmod import DocRefSA
import pyapp.fs.textpkgfs.refsfunctions as reffs
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

text1_before_interpol = '''
**A  tese é adiantada por *((ref-bugcor11))*
Outra tese é adiantada por *((ref-bugcor11))* **'''

DEFAULT_ENCTOK_PATTERN_STR = r'(\(\(ref\-\w{8}\)\))' # eg ((ref-bugcor11))
class EnclosedTokenReplacer:

  def __init__(self, text, injectdict, enctok_patternstr=None):
    self.text = text
    self.seq = 1
    self.serial = 0
    self.injectdict = injectdict
    self.ocorrencedict = {}
    self.annex = ''
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
    return reffs.find_first_ref_in_text_or_None(self.text, self.enctok_comp_regexp)

  def get_inject_tokid_replacement_n_add_to_annex(self, tokid, freq_order):
    session = Session()
    docref = session.query(DocRefSA).filter(DocRefSA.tokid == tokid).first()
    if docref is None:
      session.close()
      return None
    ref_annex = docref.gen_ref_annex()
    self.annex += ref_annex
    anchorname = tokid + str(freq_order)
    injectphrase = '<a name="%(anchorname)s" href="#%(tokid)s">' %({'anchorname':anchorname, 'tokid': tokid})
    inref = docref.get_refsurname_or_other()
    inref += '[' + str(self.add_n_get_serial()) + ']'
    injectphrase += '^(' + inref + '^)</a>'
    session.close()
    return injectphrase

  def add_n_get_serial(self):
    self.serial += 1
    return self.serial

  def find_inject_phrase_by_enctoken(self, enctoken):
    tokid = reffs.convert_enctoken_to_tokid(enctoken)
    if tokid in self.injectdict.keys():
      if tokid in self.ocorrencedict:
        freq = self.ocorrencedict[tokid]
        freq += 1
        self.ocorrencedict[tokid] = freq
      else:
        freq = 1
        self.ocorrencedict[tokid] = freq
      return self.get_inject_tokid_replacement_n_add_to_annex(tokid, freq)
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
