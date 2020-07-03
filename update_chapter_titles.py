#!/usr/bin/env python3
import glob, os, pathlib, json
'''

'''
from pyapp.models import sa_conn
import pyapp.models.genmodelsmod as gmodels
from collections import namedtuple

from slugify import slugify

number_n_title_maker = namedtuple('NumberNTitle', 'n_chapter title slug')

def get_titles_n_order_numbers():
  from appdata.ztitles import pstr
  lines = pstr.split('\n')
  lines = list(map(lambda x: x.strip(), lines))
  lines = list(filter(lambda x: not x == '', lines))
  return lines

def fetch_if_exists(nchapter, session, book_id=1):
  chapter_if_exists = session.query(gmodels.ChapterSA).\
    filter(gmodels.ChapterSA.chapter_n == nchapter).\
    filter(gmodels.ChapterSA.book_id == book_id).\
    first()
  return chapter_if_exists

def insert_chapter(nchapter, title, slug, session):
  chapter = gmodels.ChapterSA()
  chapter.chapter_n = nchapter
  chapter.title = title
  chapter.slug = slug
  chapter.book_id = 1
  session.add(chapter)
  session.commit()
  return True

def update_chapter(chapter, title, slug, session):
  bool_result = False
  if chapter.title != title:
    chapter.title = title
    bool_result = True
  if chapter.slug != slug:
    chapter.slug = slug
    bool_result = True
  if chapter.book_id != 1:
    chapter.book_id = 1
    bool_result = True
  if bool_result:
    session.commit()
  return bool_result

def updatedb(triples):
  session = sa_conn.Session()
  for number_n_title_n_slug in triples:
    nchapter = number_n_title_n_slug.n_chapter
    title = number_n_title_n_slug.title
    slug  = number_n_title_n_slug.slug
    chapter = fetch_if_exists(nchapter, session)
    if chapter is None:
      bool_result = insert_chapter(nchapter, title, slug, session)
    else:
      bool_result = update_chapter(chapter, title, slug, session)
    print ('ins or upt boolean result', bool_result)
  session.close()

def make_slug(phrase):
  slug = slugify(phrase)
  slug = slug if len(slug) < 41 else slug[:40]
  slug = slug.lstrip('-').rstrip('-')
  return slug

def process():
  '''
  s= 'Um Alerta às Gerações Futuras sobre o Golpe de 2018 no Brasil'
  print (make_slug(s))
  return
  '''
  titles = get_titles_n_order_numbers()
  triples = []
  for i, title in enumerate(titles):
    n_chapter = i + 1
    slug = make_slug(title)
    number_n_title_n_slug = number_n_title_maker(n_chapter=n_chapter, title=title, slug=slug)
    triples.append(number_n_title_n_slug)
  updatedb(triples)

if __name__ == "__main__":
  process()
