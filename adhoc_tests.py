#!/usr/bin/env python3
"""

"""
from pyapp.models import sa_conn as con
from pyapp.models.modelsmod import BookSA
from pyapp.models.modelsmod import ChapterSA
# from prettytable import PrettyTable


def adhoc_test1():
  session = con.Session()
  chapter = session.\
      query(ChapterSA).\
      filter(ChapterSA.chapter_n == 3). \
      filter(ChapterSA.book_id == 1). \
      first()
  # print(chapter)
  bk = chapter.book
  for chap in bk.chapters:
    print(chap)
  bk2 = session.query(BookSA).filter(True).first()
  for chap in bk2.chapters:
    print(chap)
  print('Before close session', '-'*30)
  print(bk)
  print('chapters count', bk2.chapters.count())
  session.close()
  print('After close session', '-'*30)
  print('chapters count', bk2.chapters.count())
  print(bk)
  print(chapter)
  print(chapter.book)


def process():
  adhoc_test1()


if __name__ == "__main__":
  process()
