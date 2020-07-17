#!/usr/bin/env python3
'''

'''
import os, pathlib, re
import unittest
from pyapp.models.genmodelsmod import DocRefSA
import pyapp.models.refgenmod as refgm

text1_before_interpol = '''
A  tese é adiantada por ((ref-bugcor11))

Outra tese é adiantada por ((ref-bugcor11))

'''

expected1_after_interpol = '''
A  tese é adiantada por <a name="bugcor111" href="#bugcor11">Bugalho ^(1)^</a>

Outra tese é adiantada por <a name="bugcor112" href="#bugcor11">Bugalho ^(2)^</a>

## Referências

<a name="bugcor11" >1.</a> Henry Bugalho; 10/7/2019. <a href="https://youtu.be/k7LIKN4rinc">Os Bolsomínions</a>. YouTube. <a href="#bugcor111"> ↩ </a> | <a href="#bugcor112"> ↩ </a>.
'''

class TestCase(unittest.TestCase):

  def test_refgen(self):
    docref = DocRefSA()
    docref.tokid = 'bugcor11'
    docref.authors = 'Henry Bugalho'
    docref.url_with_prot = 'https://youtu.be/k7LIKN4rinc'
    docref.title = 'Os Bolsomínions'
    docref.origins = 'YouTube'
    result1_after_interpol = refgm.ref_generator(text1_before_interpol, [docref])
    self.assertEqual(expected1_after_interpol, result1_after_interpol)

def process():
  pass

if __name__ == "__main__":
  process()
