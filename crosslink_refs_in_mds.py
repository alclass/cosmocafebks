#!/usr/bin/env python3
'''

'''
import os, pathlib, re
from pyapp.models.modelsmod import DocRefSA
from pyapp.models.sa_conn import Session

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
  # session = Session()
  ref = session.query(DocRefSA).filter(DocRefSA.tokid==refstr).first()
  return ref

def mount_reftext(docref, text, begpos, endpos):
  pass

# ((ref-jeseli11))
ex1 = ' bla ((ref-jeseli11)) bla '
regexp_str = r'\(\(ref\-(\w{8})\)\)' # inscritos
re_compiled = re.compile(regexp_str)
def join_tokids_with_refs(text, session):
  ref_match_iter = re_compiled.finditer(text)
  replace_pairs = []
  for ref_match_o in ref_match_iter:
    tokid = ref_match_o.groups(1)[0]
    token_to_replace = '((ref-' + tokid + '))'
    docref = session.query(DocRefSA).filter(DocRefSA.tokid==tokid).first()
    if docref is None:
      continue
    replace_pair =  (token_to_replace, docref)
    replace_pairs.append(replace_pair)
  return replace_pairs

def generate_references_section(replace_pairs):
  pass

def generate_preprocessed_md(md, text, replace_pairs):
  filename = md + '.log'
  for replace_pair in replace_pairs:
    token_to_replace, docref = replace_pair
    text = text.replace(token_to_replace, docref.gen_reftoken_replace())
  ref_section = generate_references_section(replace_pairs)
  text += ref_section
  fp = open(filename, 'w', encoding='utf8')
  fp.write(text)
  fp.close()

def print_results(refsstr, md):
  return
  session = Session()
  for refstr in refsstr:
    ref = find_docref_in_db(refstr, session)
    print (md, refstr, ref)
  session.close()

root_abspath = pathlib.Path(__file__).parent
def read_all_chapters(chapter_startswith):
  session = Session()
  slug = 'um-alerta-as-geracoes-futuras-sobre-o-go'
  book_abspath = os.path.join(root_abspath, slug)
  filenames = os.listdir(book_abspath)
  filenames = list(filter(lambda f:f.endswith('.md'), filenames))
  mds = list(filter(lambda f: startswith_number_underline(f), filenames))
  mds = sorted(mds)
  nOfChapters = len(mds)
  proj_words_per_chapter = 90000//nOfChapters
  for md in mds:
    if not md.startswith(chapter_startswith):
      continue
    md_abspath = os.path.join(book_abspath, md)
    text = open(md_abspath, encoding='utf8').read()
    replace_pairs = join_tokids_with_refs(text, session)
    generate_preprocessed_md(md, replace_pairs)
    break

def process():
  chapter_startswith = '17'
  read_all_chapters(chapter_startswith)

if __name__ == "__main__":
  process()
