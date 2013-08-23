#bib2bib -ob kias2.bib -c 'note : "Plenary speaker" or note : "Пленарный доклад"' talks.bib
#bib2bib -ob kias.bib -c 'note : "Plenary speaker" or note : "Invited speaker" or note : "Пленарный доклад" or note : "Приглашенный доклад"' talks.bib
#bibtex2html -nolinks -r -nobibsource kias.bib

export TMPDIR=.
bib2bib -ob -s year pub_dolgov.bib -c 'author : "Dolgov" and $type : "article"' our.bib
bibtex2html -nolinks -r -nobibsource pub_dolgov.bib
