import os

targetdir = '/media/friend/SAMSUNG/Ytvideos BRA Politics/z Other ytchannels/001_BRA_pol_newspapers/2020/2020-07/2020-07-03'

def get_zlinks():
  filename = '2020-07-03 [UOL] z-links.url'
  zlinks_filepath = os.path.join(targetdir, filename)
  lines = open(zlinks_filepath).readlines()
  lines = list(filter(lambda x: x.endswith('\n'), lines))
  fnames = []

  for i, line in enumerate(lines):
    pagename = line.split('/')[-1]
    pagename = pagename.strip(' \r\n')
    if pagename == '':
      continue
    fnames.append(pagename)
    print (i+1, pagename)
  return fnames

def items_not_in_list(items, comparelist):
  return list(filter(lambda x : x not in comparelist, items))

def get_names_ondir():
  entries = os.listdir(targetdir)
  entries = list(filter(lambda x : x.endswith('.htm'), entries))
  entries = list(map(lambda x : x.split(' ')[-1], entries))
  for i, entry in enumerate(entries):
    #entry = entry.split(' ')[-1]
    print(i+1, entry)
  return entries

def process():
  names_in_links = get_zlinks()
  names_in_dir   = get_names_ondir()
  missing_in_links = items_not_in_list(names_in_links, names_in_dir)
  print('missing_in_links')
  for i, ml in enumerate(missing_in_links):
    print(i+1, ml)
  missing_in_dir = items_not_in_list(names_in_dir, names_in_links)
  print('missing_in_dir')
  for i, ml in enumerate(missing_in_dir):
    print(i+1, ml)


process()
