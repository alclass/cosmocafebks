#!/usr/bin/env python3
import glob, os, pathlib, json
'''

'''
from pyapp.models import sa_conn
import pyapp.models.modelsmod as gmodels
# from collections import namedtuple

def fetch_all_chapters(): # session
  session = sa_conn.Session()
  chapters = session.query(gmodels.ChapterSA). \
    filter(gmodels.ChapterSA.book_id == 1). \
    order_by(gmodels.ChapterSA.chapter_n). \
    all()
  session.close()
  return chapters

appsroot_abspath = pathlib.Path(__file__).parent
foldername = 'um-alerta-as-geracoes-futuras-sobre-o-go'
books_abspath = os.path.join(appsroot_abspath, foldername)

def make_file(chapter):
  nchapter = chapter.chapter_n
  title = chapter.title
  text = '''# Capítulo {}
## {}
'''.format(nchapter, title)
  print(text)
  slug = chapter.slug

  filepath = chapter.get_absfilepath(books_abspath)
  # return
  if not os.path.isfile(filepath):
    print ('Writing', filepath)
    fp = open(filepath, 'w', encoding='utf8')
    fp.write(text)
    fp.close()

def process():
  chapters = fetch_all_chapters()
  for chapter in chapters:
    make_file(chapter)

if __name__ == "__main__":
  process()
