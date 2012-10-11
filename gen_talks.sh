bib2bib -ob kias2.bib -c 'note : "Plenary speaker" or note : "Пленарный доклад"' talks.bib
bib2bib -ob kias.bib -c 'note : "Plenary speaker" or note : "Invited speaker" or note : "Пленарный доклад" or note : "Приглашенный доклад"' talks.bib
bibtex2html -nolinks -r -nobibsource kias.bib
sed "s/Plenary speaker/Пленарный доклад/g" kias.html > 5.html
mv 5.html kias.html
sed "s/Invited speaker/Приглашенный доклад/g" kias.html > 5.html
mv 5.html kias.html

