import os
import sys
keyw = sys.argv[1]
bibfile = sys.argv[2]
outputfile = sys.argv[3]
command = "bib2bib -ob \"%s\" -c 'area : \"%s\"\' %s" % (outputfile,keyw,bibfile)
os.system(command)
