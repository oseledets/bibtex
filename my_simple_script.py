import yapbib.biblist as biblist
b=biblist.BibList()
b.import_bibtex('our.bib')

#Create a reduced database
items=b.search(findstr='Oseledets',fields=['author'])

