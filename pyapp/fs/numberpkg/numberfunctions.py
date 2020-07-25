#!/usr/bin/env python3
'''

'''
import string

def consume_left_side_int_number_w_optional_having_comma_or_point(word):
  if word is None:
    return None
  if type(word) == int: # or type(word) == float:
    return word
  numberstr = ''
  for c in word:
    if c in string.digits:
      numberstr += c
    elif c in [',','.']:
      continue
    else:
      break
  if numberstr == '':
    return None
  intnumber = int(numberstr)
  return intnumber

def process():
  word = '23ab grgh'
  returned_int = consume_left_side_int_number_w_optional_having_comma_or_point(word)
  print(word, 'returns', returned_int)

if __name__ == "__main__":
  process()
