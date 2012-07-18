import os
import sys
import re
html = sys.argv[1]
list_authors = sys.argv[2]
f1 = open(html,'r+')
f2 = open(list_authors,'r')
#Now we look for the pattern _f1_
#read the author list
authors = f2.read().split('\n')
htm = f1.read()

#Generate a pattern out of the list of object
#authors_mod = ['_gg%s_ff_[\S]*_gg_' % au for au in authors]
authors_mod = ['_ss_%s_ss_.+?_gg_' % au for au in authors]
pat = '|'.join(authors_mod)
def rep_fun(x):
    #It takes _f1_%s_f2_ and replaces by _f1_ -> <a href="Name.html" 
    y = x.group(0)
    z = re.split('_ss_|_gg_',y,re.MULTILINE | re.DOTALL)
    #z = y.split('_gg_')
    surn = z[1]
    full_name = z[2]
    return "<a href=pubs_%s.html>%s</a>" % (surn,full_name)
    #name = y[4:len(y)-4]
    #return "<a href="%s.html" 
#import ipdb; ipdb.set_trace()
res = re.sub(pat,rep_fun,htm,flags = re.MULTILINE | re.DOTALL)
res = re.sub('_gg_|_ss_.+?_ss_','',res,flags =re.MULTILINE | re.DOTALL)
f1.truncate(0)
f1.write(res)
f1.close()
f2.close()
