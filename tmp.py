import os
import sys
field = sys.argv[1]
keyw = sys.argv[2]
bibfile = sys.argv[3]
outputfile = sys.argv[4]

command = "bib2bib -ob \"%s\" -c '%s : \"%s\"\' %s" % (outputfile,field, keyw,bibfile)
os.system(command)
