
class Goal:

  WORDS_GOAL = 90000
  WORDS_PER_PAGE = 300
  N_PAGES = WORDS_GOAL / WORDS_PER_PAGE

  def __init__(self, chapter_words_date_dict):
    self.chapter_words_date_dict = chapter_words_date_dict
    self.book_total_per_date_dict = None
    self._avg_pages_per_day = None

  def calc_book_total_per_date(self):
    self.book_total_per_date_dict = {}
    for pdate in self.chapter_words_date_dict:
      chapter_words_dict = self.chapter_words_date_dict[pdate]
      book_total = 0
      for chapter_n in chapter_words_dict:
        book_total += chapter_words_dict[chapter_n]
      self.book_total_per_date_dict[pdate] = book_total

  @property
  def avg_pages_per_day(self):
    if self._avg_pages_per_day is not None:
      return self._avg_pages_per_day
    self._avg_pages_per_day = 0; n_words = 0
    for pdate in self.book_total_per_date_dict:
      n_words += self.book_total_per_date_dict[pdate]
    self._avg_pages_per_day = n_words / len(self.book_total_per_date_dict)
    return self._avg_pages_per_day

  def n_days_to_complete(self):
    goal_in_pages = self.N_PAGES
    n_days = goal_in_pages / self.avg_pages_per_day
    return n_days

  def report(self):
    for pdate in self.book_total_per_date_dict:
      n_words = self.book_total_per_date_dict[pdate]
      n_pages = n_words / self.WORDS_PER_PAGE
      print(pdate, 'n_words', n_words, 'n_pages', n_pages)
      print('avg_pages_per_day', self.avg_pages_per_day)
      print('n_days_to_complete', self.n_days_to_complete())
