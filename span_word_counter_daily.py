#!/usr/bin/env python3
import glob, os, pathlib, json, datetime
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

def calc_days_yet(n_words_ini, n_words_fim):
  TOTAL_WORDS_IN_A_BOOK = 90000
  done_on_a_day = abs(n_words_ini - n_words_fim)
  days_yet = (TOTAL_WORDS_IN_A_BOOK - n_words_fim) / done_on_a_day
  print('TOTAL_WORDS_IN_A_BOOK', TOTAL_WORDS_IN_A_BOOK)
  print('done_on_a_day', done_on_a_day)
  print ('days_yet', days_yet)

chapterwordsdict = {}
total_words = 0; jsonstr = ''

slug = 'um-alerta-as-geracoes-futuras-sobre-o-go'
def process():
  print ('In updatedb()')
  session = sa_conn.Session()
  book = session.query(gmodels.BookSA).filter(gmodels.BookSA.slug==slug).first()
  if book is None:
    print (slug, 'not found')
    return
  prod_per_day = []
  for measure in book.measuresondates:
    print (measure.measuredate)
    print(measure.n_words)
    prod_per_day.append(measure.n_words)
    print (measure.json_chapters_words)
  calc_days_yet(prod_per_day[-2], prod_per_day[-1])
  session.close()

if __name__ == "__main__":
  process()
