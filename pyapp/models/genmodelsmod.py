#!/usr/bin/python3
'''
https://stackoverflow.com/questions/10059345/sqlalchemy-unique-across-multiple-columns

# version1: table definition
mytable = Table('mytable', meta,
    # ...
    Column('customer_id', Integer, ForeignKey('customers.customer_id')),
    Column('location_code', Unicode(10)),

    UniqueConstraint('customer_id', 'location_code', name='uix_1')
    )
# or the index, which will ensure uniqueness as well
Index('myindex', mytable.c.customer_id, mytable.c.location_code, unique=True)


# version2: declarative
class Location(Base):
    __tablename__ = 'locations'
    id = Column(Integer, primary_key = True)
    customer_id = Column(Integer, ForeignKey('customers.customer_id'), nullable=False)
    location_code = Column(Unicode(10), nullable=False)
    __table_args__ = (UniqueConstraint('customer_id', 'location_code', name='_customer_location_uc'),
                     )
'''
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



class DocRefSA(Base):
  '''
  ALTER TABLE `chapters` ADD UNIQUE `bookid_n_chaptern_uniq`(`chapter_n`, `book_id`);
  '''

  __tablename__ = 'docrefs'

  id = Column(Integer, primary_key=True)
  tokid = Column(String(8), unique=True)
  authors = Column(String(150), nullable=True)
  origins = Column(String(150), nullable=True)
  program = Column(String(150), nullable=True)
  refdate = Column(Date, nullable=True)
  year = Column(Integer, nullable=True)
  trecho_min = Column(Integer, nullable=True)
  total_min = Column(Integer, nullable=True)
  title = Column(String(255))
  url = Column(String(255), nullable=True)
  obs = Column(Text, nullable=True)

  created_at = Column(TIMESTAMP, server_default=func.now()) #, nullable=False, server_default=text('0'))
  updated_at = Column(TIMESTAMP, nullable=True)

  def __repr__(self):
    title = self.title if len(self.title) < 50 else self.title[:50]
    # authors = self.title if len(self.authors) < 50 else self.authors[:50]
    return '<Ref(id=%s, title="%s")>' % (str(self.id), title) # authors,

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
