#!/usr/bin/env python3
import os, pathlib, re
'''

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

from pyapp.models.sa_conn import Session
from pyapp.models.genmodelsmod import DocRefSA

def find_docref_in_db(refstr, session):
  ref = session.query(DocRefSA).filter(DocRefSA.tokid==refstr).first()
  return ref

# ((ref-jeseli11))
ex1 = ' bla ((ref-jeseli11)) bla '
regexp_str = r'\(\(ref\-(\w{8})\)\)' # inscritos
re_compiled = re.compile(regexp_str)
def find_refs_via_regexp(text):
  refs = []
  for item in re_compiled.finditer(text):
    ref = item.groups(1) # + ' ' + str(match.group(2))
    refs.append(ref)
  return refs

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



def process():
  read_all_chapters()

if __name__ == "__main__":
  process()
