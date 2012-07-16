bib2bib -s year -ob "cur_preprints.bib" -c '$type : "techreport" and not exists newversion' our.bib 
bib2bib -s year -ob "published.bib" -c '$type : "article" or $type : "incollection"' our.bib
#bibtex2html -s "plain" published.bib
#bibtex2html -s "plain" cur_preprints.bib
#echo "<h1>Published papers</h1>" > published_tail.html
#cat published.html | tail -n +16 >> published_tail.html
#cat cur_preprints.html | grep -v "</body>" | grep -v "</html>" | sed 's/<title>cur_preprints<\/title>/<h1>Recent Preprints<\/h1>/g' > cur_preprints_head.html
#cat cur_preprints_head.html published_tail.html > all_our.html
bibtex2html -r -s "plain" --no-header --no-footer -t "Published papers in refereed journals" published.bib
bibtex2html -r -s "plain" --no-header --no-footer -t "Recent preprints" cur_preprints.bib
cat template-header.html cur_preprints.html published.html template-footer.html > final.html

