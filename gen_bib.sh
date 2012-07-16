bib2bib -ob "cur_preprints.bib" -c '$type : "techreport" and not exists newversion' our.bib 
bib2bib -ob "published.bib" -c '$type : "article" or $type : "incollection"' our.bib
bibtex2html -s "plain" published.bib
bibtex2html -s "plain" cur_preprints.bib
