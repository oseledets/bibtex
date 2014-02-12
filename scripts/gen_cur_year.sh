bib2bib -ob cur_year.bib -c 'author : "Oseledets" and year = 2012 and not note : "accepted" and not exists newversion' our.bib
bib2bib -ob cur_conf.bib -c 'year = 2012 and (author : "Oseledets" or author : "Оселедец") and not (event : "Seminar" or event : "Семинар") ' talks.bib
bib2bib -ob cur_sem.bib -c 'year = 2012 and (author : "Oseledets" or author : "Оселедец") and (event : "Seminar" or event : "Семинар") ' talks.bib
