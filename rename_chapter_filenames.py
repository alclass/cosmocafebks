#!/usr/bin/env python3
import os, pathlib
from pyapp.models import sa_conn
import pyapp.models.genmodelsmod as gmodels
from pyapp.models.genmodelsmod import BookSA
from prettytable import PrettyTable

'''

'''
slug = 'um-alerta-as-geracoes-futuras-sobre-o-go'
def read_chapters_from_db():
  session = sa_conn.Session()
  pt = PrettyTable()
  pt.field_names = ['Chap N', 'slug', 'Title']
  book = session.query(BookSA).filter(BookSA.slug==slug).first()
  if not book:
    print('slug', slug, 'is not in db.')
    return
  for chapter in book.chapters:
    # print (chapter.chapter_n, '||', chapter.title, '||', chapter.slug)
    pt.add_row([chapter.chapter_n, chapter.title, chapter.slug])
  print(pt)


def process():
  read_chapters_from_db()

if __name__ == "__main__":
  process()
