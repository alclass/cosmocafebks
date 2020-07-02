#!/usr/bin/env python3
import glob, os, pathlib, json
'''
Google search: average words in a book

Most adult books are about 90,000 words, and no longer than 100,000 words (unless you're JK Rowling). Teen books are about 55,000 words. How many words are there to a page? It depends on the font you are using, of course, but in general, 250-300 words per page.

Frequently Asked Questions - Getting Published - Meg Cabot

A 100-page book would be, then, about 25,000 words; a 150-page book would be roughly 37,500 words. For the larger, 6 x 9 trim size, would be about 300 words per page. These books are generally heftier in general, so for a 150-page book you can target 45,000 words and 60,000 words for a 200-page book.20 févr. 2018

Word Count: How Many Words Should Your Book Be? — Jodi ...
www.jodibrandoneditorial.com › blog › word-count-how...

    if abspath.find('.git') > -1:
      continue
    print (abspath)
    for filename in files:
      file_abspath = os.path.join(abspath, filename)

'''
import bk03_antibozo_vol1.zwordcounts as wrdcnt
from pyapp.models.GoalMod import Goal

def run_goal():
  goal = Goal(wrdcnt.pdict)
  goal.calc_book_total_per_date()
  goal.report()
  print('N_PAGES', goal.N_PAGES)

def starts_with_number(pstr):
  try:
    pp = pstr.split(' ')
    _ = int(pp[0])
    return True
  except ValueError:
    pass
  return False

from pyapp.models.sa_conn import Session
import pyapp.models.genmodelsmod as samodels
def process():
  session = Session()
  booksa = session.query(samodels.BookSA).filter(samodels.BookSA.slug.startswith('uma-historia-do-pior')).first()
  print (booksa)
  session.close()
  print (booksa)

  thisdir = pathlib.Path(__file__).parent
  bookabspath = os.path.join(thisdir, 'bk03_antibozo_vol1')
  # mds = glob.glob('0*.md'); total_words = 0
  entries = os.listdir(bookabspath)
  mds = list(filter(lambda x : x.endswith('.md'), entries))
  mds = list(filter(lambda x : starts_with_number(x), mds))
  mds = sorted(mds)
  total_words = 0; chapterwordsdict = {}
  print(mds)
  for md in mds: # abspath, folders, files in os.walk('.'):
    try:
      abspath = os.path.join(bookabspath, md)
      fp = open(abspath, 'r', encoding='utf8')
      text = fp.read()
    except UnicodeDecodeError:
      continue
    words = text.split(' ')
    n_of_chapter = int(md.split(' ')[0])
    n_words = len(words)
    chapterwordsdict[n_of_chapter] = n_words
    total_words += n_words
    print (n_words, 'words in filename', md)
  print('total_words', total_words)
  # print (chapterwordsdict)
  jsondict = json.dumps(chapterwordsdict)
  print (jsondict)

if __name__ == "__main__":
  process()
