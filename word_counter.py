import os
'''
Google search: average words in a book

Most adult books are about 90,000 words, and no longer than 100,000 words (unless you're JK Rowling). Teen books are about 55,000 words. How many words are there to a page? It depends on the font you are using, of course, but in general, 250-300 words per page.

Frequently Asked Questions - Getting Published - Meg Cabot

A 100-page book would be, then, about 25,000 words; a 150-page book would be roughly 37,500 words. For the larger, 6 x 9 trim size, would be about 300 words per page. These books are generally heftier in general, so for a 150-page book you can target 45,000 words and 60,000 words for a 200-page book.20 févr. 2018

Word Count: How Many Words Should Your Book Be? — Jodi ...
www.jodibrandoneditorial.com › blog › word-count-how...

'''

def process():
  for abspath, folders, files in os.walk('.'):
    if abspath.find('.git') > -1:
      continue
    print (abspath)
    for filename in files:
      file_abspath = os.path.join(abspath, filename)
      try:
        fp = open(file_abspath, 'r', encoding='utf8')
        text = fp.read()
      except UnicodeDecodeError:
        continue
      words = text.split(' ')
      n_words = len(words)
      print (n_words, 'words in filename', filename)


if __name__ == "__main__":
  process()
