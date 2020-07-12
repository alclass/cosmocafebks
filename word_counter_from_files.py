#!/usr/bin/env python3
import os, pathlib
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
    n_words = calc_words(text)
    missing_yet = proj_words_per_chapter - n_words
    missing_yet_str = str(missing_yet).zfill(4)
    print(str(n_words).zfill(4), missing_yet_str, md)

def process():
  read_all_chapters()

if __name__ == "__main__":
  process()
