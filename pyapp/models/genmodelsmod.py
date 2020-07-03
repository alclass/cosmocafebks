#!/usr/bin/python3
import datetime, os # for adhoc test
from sqlalchemy.ext.declarative import declarative_base
Base = declarative_base()
from sqlalchemy import Column, Boolean, Integer, String, Date, TIMESTAMP, ForeignKey, Text # DateTime,
from sqlalchemy.types import BINARY
from sqlalchemy.orm import relationship, backref
from sqlalchemy.sql import func
from sqlalchemy.sql.expression import asc, desc

class BookSA(Base):

  __tablename__ = 'books'

  id = Column(Integer, primary_key=True)
  title = Column(String)
  subtitle = Column(String, nullable=True)
  slug = Column(String(40), unique=True)
  # category_id = Column(Integer, ForeignKey('categories.id'), nullable=True)
  obs = Column(Text, nullable=True)

  chapters = relationship('ChapterSA', backref='book', lazy='dynamic')
  measuresondates = relationship('DatedMeasureSA', backref='book', lazy='dynamic')

  created_at = Column(TIMESTAMP, server_default=func.now()) #, nullable=False, server_default=text('0'))
  updated_at = Column(TIMESTAMP, nullable=True)

  def __repr__(self):
    title = self.title if len(self.title) < 50 else self.title[:50]
    return '<Book(id=%s, title="%s")>' % (str(self.id), title)

class DatedMeasureSA(Base):
  '''
  ALTER TABLE `datedmeasures` ADD UNIQUE `bookid_n_measuredate_uniq`(`measuredate`, `book_id`);
  '''

  __tablename__ = 'datedmeasures'

  id = Column(Integer, primary_key=True)
  measuredate = Column(Date)
  n_words = Column(Integer, default=1)
  json_chapters_words = Column(String, nullable=True)
  book_id = Column(Integer, ForeignKey('books.id'))

  created_at = Column(TIMESTAMP, server_default=func.now()) #, nullable=False, server_default=text('0'))
  updated_at = Column(TIMESTAMP, nullable=True)

  def __repr__(self):
    return '<DatedMeasure(id=%s, measuredate=%s n_words=%d)>' % (str(self.id), str(self.measuredate), self.n_words)

class ChapterSA(Base):
  '''
  ALTER TABLE `chapters` ADD UNIQUE `bookid_n_chaptern_uniq`(`chapter_n`, `book_id`);
  '''

  __tablename__ = 'chapters'

  id = Column(Integer, primary_key=True)
  title = Column(String)
  slug = Column(String(40))
  chapter_n = Column(Integer, default=1)
  is_completed = Column(Boolean, default=False)
  obs = Column(Text, nullable=True)
  book_id = Column(Integer, ForeignKey('books.id'))

  created_at = Column(TIMESTAMP, server_default=func.now()) #, nullable=False, server_default=text('0'))
  updated_at = Column(TIMESTAMP, nullable=True)

  @property
  def filename(self):
    return '%s_%s.md' % (str(self.chapter_n).zfill(2), self.slug)

  def get_filepath_from_folderpath(self, books_abspath):
    filepath = os.path.join(books_abspath, self.filename)
    return filepath

  def __repr__(self):
    title = self.title if len(self.title) < 50 else self.title[:50]
    return '<Chapter(id=%s, title="%s")>' % (str(self.id), title)

def adhoc_test():
  book = BookSA()
  book.title = 'Title Test'
  print (book)
  measure =  DatedMeasureSA()
  measure.measuredate = datetime.date.today()
  measure.n_words = 2500
  book.measuresondates.append(measure)
  print(measure)
  chapter =  ChapterSA()
  chapter.title = 'Chapter Test'
  book.chapters.append(chapter)
  print(chapter)

def process():
  adhoc_test()

if __name__ == '__main__':
  process()
