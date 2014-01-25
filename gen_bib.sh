#!/bin/bash
bib2bib -s year -ob "cur_preprints.bib" -c '$type : "techreport" and not exists newversion' our.bib 
bib2bib -s year -ob "published.bib" -c '$type : "article" or $type : "incollection"' our.bib
bibtex2html -r -s "plain" -t "All papers" our.bib
rm our.html
#bibtex2html -s "plain" published.bib
#bibtex2html -s "plain" cur_preprints.bib
#echo "<h1>Published papers</h1>" > published_tail.html
#cat published.html | tail -n +16 >> published_tail.html
#cat cur_preprints.html | grep -v "</body>" | grep -v "</html>" | sed 's/<title>cur_preprints<\/title>/<h1>Recent Preprints<\/h1>/g' > cur_preprints_head.html
#cat cur_preprints_head.html published_tail.html > all_our.html
bibtex2html -r -s "plain_test" --no-header --no-footer -t "Published papers in refereed journals" published.bib
python link_authors.py published.html author 
s1="published_bib/our_bib"
sed "s/$s1/g" "published.html" > 5.html
mv 5.html published.html
bibtex2html -r -s "plain_test" --no-header --no-footer -t "Recent preprints" cur_preprints.bib
python link_authors.py cur_preprints.html author 
s1="cur_preprints_bib/our_bib"
sed "s/$s1/g" "cur_preprints.html" > 5.html
mv 5.html cur_preprints.html
cat pub_header.html cur_preprints.html published.html pub_footer.html > final.html
rm cur_preprints.html cur_preprints.bib cur_preprints_bib.html
rm published.html published.bib published_bib.html
#Fix it here`
s1="<a href =final.html>All publications<\/a>"
sed "s/$s1/All publications/g" final.html > 5.html
mv 5.html final.html
#cat pub_header.html pub_footer.html > final.html

#Generate publications by year

declare -i LASTYEAR=2009
declare -i CURRENTYEAR=2014
PUBSOLD=pubs_old
bib2bib -s year -ob "$PUBSOLD.bib" -c "year < $LASTYEAR" our.bib
bibtex2html -r -s "plain_test" --no-header --no-footer -t "Papers before $LASTYEAR" -o "TMP$PUBSOLD"  "$PUBSOLD.bib" 
python link_authors.py "TMP$PUBSOLD.html" author 
s1="TMP"$PUBSOLD"_bib/our_bib"
sed "s/$s1/g" "TMP$PUBSOLD.html" > 5.html
cat pub_header.html 5.html pub_footer.html > "$PUBSOLD.html"
rm "TMP$PUBSOLD.html"
s1="<a href =\""$PUBSOLD.html"\">old<\/a>"
sed "s/$s1/old/g" $PUBSOLD.html > "TMP$PUBSOLD.html"
mv "TMP"$PUBSOLD".html" "$PUBSOLD.html"
rm "TMP"$PUBSOLD"_bib.html"


for ((year = $LASTYEAR ; year <= $CURRENTYEAR ; year++ )); 
do 
    PUBS="pubs_$year"
    bib2bib -s author -ob "pubs_$year.bib" -c "year = $year" our.bib
    bibtex2html -s "plain_test" --no-header --no-footer -t "Papers in $year" -o "TMP$PUBS"  "$PUBS.bib" 
    python link_authors.py "TMP$PUBS.html" author 
    #Fix bibtex references
    s1="TMP"$PUBS"_bib/our_bib"
    sed "s/$s1/g" "TMP$PUBS.html" > 5.html
    cat pub_header.html 5.html pub_footer.html > "$PUBS.html"
    rm "TMP$PUBS.html"
    rm "5.html"
    rm "TMP"$PUBS"_bib.html"
    s1="<a href =\""$PUBS.html"\">"$year"<\/a>"
    sed "s/$s1/$year/g" $PUBS.html > "TMP$PUBS.html"
    mv "TMP$PUBS.html" "$PUBS.html"
    
done

#Generate publications by topic
topics=('Tensors' 'Toeplitz' 'Matrices' 'Misc')
for tp in "${topics[@]}"
do 
#    #NAME="pubs_${tp,,}"
    NAME=$(echo $tp | tr "[:upper:]" "[:lower:]")
#    #bib2bib -s year -ob "pubs_$NAME.bib" -c "'area : \""$NAME"\"'" our.bib
    python tmp.py area $NAME our.bib "pubs_$NAME.bib"  
    bibtex2html -r -s "plain_test" --no-header --no-footer -t "Papers on $NAME" -o "TMP$NAME"  "pubs_$NAME.bib" 
    python link_authors.py "TMP$NAME.html" author 
    s1="TMP"$NAME"_bib/our_bib"
    sed "s/$s1/g" "TMP$NAME.html" > 5.html
    
    cat pub_header.html 5.html pub_footer.html > "pubs_$NAME.html"
    rm "TMP$NAME.html"
    rm 5.html
    rm "TMP"$NAME"_bib.html"
    s1="<a href =\"pubs_$NAME.html\">"$tp"<\/a>"
    sed "s/$s1/$tp/g" "pubs_$NAME".html > "TMP$NAME.html"
    mv "TMP$NAME.html" "pubs_$NAME.html"
done 


#Generate publications by author
topics=('Tyrtyshnikov' 'Stavtsev' 'Oseledets' 'Savostyanov' 'Dolgov' 'Goreinov' 'Kazeev' 'Zamarashkin' 'Lebedeva' 'Mikhalev')
for tp in "${topics[@]}"
do 
#    #NAME="pubs_${tp,,}"
#    NAME=$(echo $tp | tr "[:upper:]" "[:lower:]")
    NAME=$tp
#    #bib2bib -s year -ob "pubs_$NAME.bib" -c "'area : \""$NAME"\"'" our.bib
    python tmp.py author $NAME our.bib "pubs_$NAME.bib"  
    bibtex2html -r -s "plain_test" --no-header --no-footer -t "Papers by $NAME" -o "TMP$NAME"  "pubs_$NAME.bib" 
    python link_authors.py "TMP$NAME.html" author 
    s1="TMP"$NAME"_bib/our_bib"
    sed "s/$s1/g" "TMP$NAME.html" > 5.html
    
    cat pub_header.html 5.html pub_footer.html > "pubs_$NAME.html"
    rm "TMP$NAME.html"
    rm 5.html
    rm "TMP"$NAME"_bib.html"
    s1="<a href =\"pubs_$NAME.html\">"$tp"<\/a>"
    sed "s/$s1/$tp/g" "pubs_$NAME".html > "TMP$NAME.html"
    mv "TMP$NAME.html" "pubs_$NAME.html"
done 

