pandoc -S --toc --epub-embed-font='fonts/*.ttf' -o book.epub metadata.txt *.md
pandoc -o book.epub *.md
