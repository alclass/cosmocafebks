#!/usr/bin/env python3
import glob, os, pathlib, json, datetime
'''
Google search: average words in a book

Most adult books are about 90,000 words, and no longer than 100,000 words (unless you're JK Rowling). 
Teen books are about 55,000 words. How many words are there to a page? 
It depends on the font you are using, of course, but in general, 250-300 words per page.

Frequently Asked Questions - Getting Published - Meg Cabot
A 100-page book would be, then, about 25,000 words; 
a 150-page book would be roughly 37,500 words. 
For the larger, 6 x 9 trim size, would be about 300 words per page.
These books are generally heftier in general, 
so for a 150-page book you can target 45,000 words and 60,000 words for a 200-page book.20 févr. 2018

Word Count: How Many Words Should Your Book Be? — Jodi ...
www.jodibrandoneditorial.com › blog › word-count-how...
'''
import appdata as wrdcnt
from pyapp.models.GoalMod import Goal
import make_protochapter_files as makeproto
import pyapp.models.genmodelsmod as gmodels
from pyapp.models import sa_conn

def run_goal():
  goal = Goal(wrdcnt.pdict)
  goal.calc_book_total_per_date()
  goal.report()
  print('N_PAGES', goal.N_PAGES)

def calc_words(text):
  words = text.split(' ')
  n_words = len(words)
  return n_words

total_words = 0
def count_chapter(chapter):
  global total_words
  filepath = chapter.get_filepath_from_folderpath(makeproto.books_abspath)
  text = open(filepath).read()
  n_words = calc_words(text)
  return n_words

chapterwordsdict = {}
total_words = 0; jsonstr = ''
def process():
  global total_words, jsonstr
  chapters = makeproto.fetch_all_chapters()
  for chapter in chapters:
    count_chapter(chapter)
    n_words = count_chapter(chapter)
    chapterwordsdict[chapter.chapter_n] = n_words
    total_words += n_words
    print (n_words, 'words in filename', chapter.filename)
    print('total_words', total_words)
  jsonstr = json.dumps(chapterwordsdict)
  print (jsonstr)

slug = 'um-alerta-as-geracoes-futuras-sobre-o-go'
def updatedb():
  print ('In updatedb()')
  session = sa_conn.Session()
  book = session.query(gmodels.BookSA).filter(gmodels.BookSA.slug==slug).first()
  if book is None:
    print (slug, 'not found')
    return
  measure = gmodels.DatedMeasureSA()
  measure.n_words = total_words
  today = datetime.date.today()
  measure.measuredate = today
  measure.json_chapters_words = jsonstr
  measure_on_db = session.query(gmodels.DatedMeasureSA).\
    filter(gmodels.DatedMeasureSA.measuredate==today). \
    filter(gmodels.DatedMeasureSA.book_id == book.id). \
    first()
  if not measure_on_db:
    print('Inserting', measure)
    book.measuresondates.append(measure)
    session.commit()
  else:
    if measure_on_db.n_words != measure.n_words:
      measure_on_db.n_words = measure.n_words
      print('Updating', measure)
      session.commit()
    else:
      print('Not updating (equal n_words)', measure)
  session.close()

if __name__ == "__main__":
  process()
  updatedb()
