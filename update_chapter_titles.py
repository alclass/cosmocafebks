#!/usr/bin/env python3
'''
  update_chapter_titles.py
'''
from pyapp.models import sa_conn
import pyapp.models.genmodelsmod as gmodels
from pyapp.models.genmodelsmod import ChapterSA
from collections import namedtuple
from prettytable import PrettyTable
import os, pathlib
from slugify import slugify
from pyapp.fs.numberpkg import numberfunctions as nfs

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

def startswith_a_number_w_optional_letter(fn):
  startchunk = fn.split('_')[0]
  retval = nfs.consume_left_side_int_number_w_optional_having_comma_or_point(startchunk)
  if retval is None:
    return False
  return True

def get_title_n_nchapter_from_first_line(entry, books_abspath):
  entry_abspath = os.path.join(books_abspath, entry)
  lines = open(entry_abspath).readlines()
  if len(lines) < 1:
    return None, None
  firstline = lines[0]
  firstline = firstline.strip(' ')
  firstline = firstline.lstrip('# \t')
  title = None; nchapter = None
  pp = firstline.split(' ')
  try:
    word = pp[0] # the first element is guaranteed
    nchapter = nfs.consume_left_side_int_number_w_optional_having_comma_or_point(word) # int(pp[0])
  except ValueError: # TO-DO: improve this piece, no ValueError is raised from consume()
    pass
  title = ' '.join(pp[1:])
  title = title.strip(' \r\n')
  return title, nchapter

def rename_filename_if_needed(filename, books_abspath, numbertocheck, slugtocheck):
  '''
    Renames wrongly numbered file
    Renames filename if needed, ie, if filename is different than reconstructed name from numbertocheck and slugtocheck
  :param filename:
  :param books_abspath:
  :param numbertocheck:
  :param slugtocheck:
  :return: boolean (True if renamed, False if not renamed)
  '''
  newnumberstr = str(numbertocheck).zfill(2)
  reconstructed_name =  newnumberstr + '_' + slugtocheck + '.md'
  if filename == reconstructed_name:
    return False
  filename_abspath = os.path.join(books_abspath, filename)
  newentrynameabspath = os.path.join(books_abspath, reconstructed_name)
  if os.path.isfile(filename_abspath) and not os.path.isfile(newentrynameabspath):
    print ('renaming', filename, 'to', reconstructed_name)
    os.rename(filename_abspath, newentrynameabspath)
    return True
  return False

def correct_nchapter_in_first_line(entry, books_abspath, newnumber):
  newnumber = int(newnumber)
  entry_abspath = os.path.join(books_abspath, entry)
  lines = open(entry_abspath).readlines()
  if len(lines) < 1:
    return False
  firstline = lines[0]
  firstline = firstline.strip(' ')
  firstline = firstline.lstrip('# \t')
  title = None; nchapter = None
  pp = firstline.split(' ')
  title = ' '.join(pp[1:])
  firstline = '# ' + str(newnumber) + ' ' + title
  line = firstline
  newlines = [line]
  if len(lines) > 1:
    newlines +=  lines[1:]
  fp = open(entry_abspath, 'w', encoding='utf8')
  text = ''.join(newlines)
  fp.write(text)
  fp.close()
  return True

def delete_chapter_above_n(seq, book_id=1):
  session = sa_conn.Session()
  chapters = session.query(ChapterSA).\
    filter(ChapterSA.chapter_n > seq).\
    filter(ChapterSA.book_id == book_id).\
    all()
  doCommit = False
  for chapter in chapters:
    print ('Deleting former chapter', chapter)
    session.delete(chapter)
    doCommit = True
  if doCommit:
    session.commit()
  session.close()

def write_to_db(nchapter, title, book_id=1):
  session = sa_conn.Session()
  chapter = session.query(ChapterSA).\
    filter(ChapterSA.chapter_n==nchapter).\
    filter(ChapterSA.book_id==book_id).\
    first()
  doCommit = False
  if chapter is None:
    chapter = ChapterSA()
    chapter.book_id = book_id
    session.add(chapter)
    doCommit = True
  if chapter.title != title:
    chapter.title = title
    doCommit = True
  if chapter.chapter_n != nchapter:
    chapter.chapter_n = nchapter
    doCommit = True
  slug = slugify(title)
  if chapter.slug != slug:
    chapter.slug = slug
    doCommit = True
  if doCommit:
    print ('Committing', chapter)
    session.commit()
  session.close()
  return doCommit

scripts_abspath = pathlib.Path(__file__)
apps_root_abspath = scripts_abspath.parent
books_slug = 'um-alerta-as-geracoes-futuras-sobre-o-go' # book's slug is also folder name
books_abspath = os.path.join(apps_root_abspath, books_slug)
def read_mdfiles_in_order():
  entries = os.listdir(books_abspath)
  entries = list(filter(lambda fn : fn.endswith('.md'), entries))
  entries = list(filter(lambda fn : startswith_a_number_w_optional_letter(fn), entries))
  entries = sorted(entries)
  seq = 0; titles_n_nchapters = []
  for entry in entries:
    seq += 1
    title, nchapter = get_title_n_nchapter_from_first_line(entry, books_abspath)
    if nchapter != seq:
      retbool = correct_nchapter_in_first_line(entry, books_abspath, seq)
      print('new', seq, 'old', nchapter, 'Chapter number correction', retbool)
    title_n_nchapter_pair = (title, seq) # nchapter
    titles_n_nchapters.append(title_n_nchapter_pair)
    slug = slugify(title)
    retbool = rename_filename_if_needed(entry, books_abspath, seq, slug)
    line = str(retbool) + ' rename_filename_if_needed(%s, %d, %s)' % (entry, seq, slug)
    print (line)

  pt = PrettyTable()
  pt.field_names = ['seq', 'Chap N', 'slug', 'Title']
  for i, title_n_nchapter_pair in enumerate(titles_n_nchapters):
    seq = i+1
    title, nchapter = title_n_nchapter_pair
    slug = slugify(title)
    pt.add_row([seq, nchapter, slug, title])
    retbool = write_to_db(nchapter, title)
    line = str(retbool) + ' write_to_db(%d, %s)' % (nchapter, title)
    print (line)
  print(pt)
  delete_chapter_above_n(seq)

def oldprocess():
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

def process():
  read_mdfiles_in_order()

if __name__ == "__main__":
  process()
