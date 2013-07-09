#!/bin/bash

export TMPDIR=.

#bib2bib -ob my_paper_d.bib -c 'author : "Dolgov" and type : "article"' -s 'year' -r bibtex/our.bib
bib2bib -ob talks_sav.bib -c 'author : "Savostyanov" and not type : "local"' -s 'year' -r ~/Report/bibtex/talks.bib
#bib2bib -ob my_talks_l_d.bib -c 'author : "Savostyanov" and type : "local"' -s 'year' -r ~/Report/bibtex/talks.bib
#bib2bib -ob cur_conf_d.bib -c 'year = 2012 and (author : "Dolgov" or author : "Долгов") and not (event : "Seminar" or event : "Семинар") ' talks.bib
#bib2bib -ob my_conf_d.bib -c '(author : "Dolgov" or author : "Долгов")' -s 'year' -r bibtex/talks.bib
#bib2bib -ob cur_sem_d.bib -c 'year = 2012 and (author : "Dolgov" or author : "Долгов") and (event : "Seminar" or event : "Семинар") ' talks.bib

bibtex2html -nolinks -r -nobibsource talks_sav.bib
