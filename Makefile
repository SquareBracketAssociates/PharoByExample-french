# Pharo par l'exemple 2009-09-06

# export TEXINPUTS:=.:local
export TEXINPUTS:=./local//:../local//:

EG1 = Preface QuickTour FirstApp Syntax Messages \
	Model Environment SUnit BasicClasses Collections Streams Morphic \
	Metaclasses Seaside Reflection

EG2 = Seaside

PDFLATEX = pdflatex -file-line-error

PDFVIEW = open # for mac user

BOOK1=PBE1
BOOK2=PBE2
OMNIBUS=PBE-Omnibus

# --------------------------------------------------------------------------------
all : omnibus
	${PDFVIEW} ${OMNIBUS}.pdf

# NB: be sure to use texlive and to set the TEXINPUTS variable accordingly
# See README.txt

OMNIBUS : clean #examples examples2 ## - restore examples
	time ${PDFLATEX} ${OMNIBUS}
	time ${PDFLATEX} ${OMNIBUS} |tee warnings.txt
	# Filter out blank lines and bogus warnings
	perl -pi \
		-e '$$/ = "";' \
		-e 's/[\n\r]+/\n/g;' \
		-e 's/LaTeX Warning: Label `\w*:defaultlabel'\'' multiply defined.[\n\r]*//g;' \
		-e 's/Package wrapfig Warning: wrapfigure used inside a conflicting environment[\n\r]*//g;' \
		warnings.txt

BOOK1 : clean examples
	time ${PDFLATEX} ${BOOK1}
	time ${PDFLATEX} ${BOOK1} |tee warnings.txt
	# Filter out blank lines and bogus warnings
	perl -pi \
		-e '$$/ = "";' \
		-e 's/[\n\r]+/\n/g;' \
		-e 's/LaTeX Warning: Label `\w*:defaultlabel'\'' multiply defined.[\n\r]*//g;' \
		-e 's/Package wrapfig Warning: wrapfigure used inside a conflicting environment[\n\r]*//g;' \
		warnings.txt

BOOK2 : clean examples2
	time ${PDFLATEX} ${BOOK2}
	time ${PDFLATEX} ${BOOK2} | tee warnings.txt
	# Filter out blank lines and bogus warnings
	perl -pi \
		-e '$$/ = "";' \
		-e 's/[\n\r]+/\n/g;' \
		-e 's/LaTeX Warning: Label `\w*:defaultlabel'\'' multiply defined.[\n\r]*//g;' \
		-e 's/Package wrapfig Warning: wrapfigure used inside a conflicting environment[\n\r]*//g;' \
		warnings.txt

# --------------------------------------------------------------------------------

# We need a makefile rule to generated the index as well ...
index1 :
	makeindex ${BOOK}

pbe1 : BOOK1 index1
	time ${PDFLATEX} ${BOOK1}

# We need a makefile rule to generate the index as well ...
index2 :
	makeindex ${BOOK2}

pbe2 : BOOK2 index2
	time ${PDFLATEX} ${BOOK2}


# We need a makefile rule to generate the index as well ...
index :
	makeindex ${OMNIBUS}

omnibus : OMNIBUS index
	time ${PDFLATEX} ${OMNIBUS}

examples :
	./examples.rb ${EG1} > ../pbe1-examples.txt

examples2 :
	./examples.rb ${EG2} > ../pbe2-examples.txt

fun :
	time ./examples.rb $C > $@1.txt
	# Requires Gnu Smalltalk 2.95c with scripting support:
	time ./examples.st $C > $@2.txt
	-diff $@1.txt $@2.txt

# --------------------------------------------------------------------------------
# MAINTENANCE

graffleDirs :
	find . -name \*.graffle -type d

todo :
	fgrep '%:=' *.tex */*.tex

history :
	sh history.sh > history.txt

missinghistory :
	find . -name \*.tex | \
   xargs fgrep -L HISTORY

# Adapt this rule to find anything (such as duplicate labels)
find :
	find . -name \*.tex | \
	xargs egrep '\\ignoredollar'

# look for bad usages of see index (with ! in second arg)
badsee :
	find . -name \*.tex | \
	xargs egrep '\\seeindex\{.*}{.*!.*}'

badindex :
	find . -name \*.tex | \
	xargs egrep '\\index\{.*}{'

# Check for duplicate labels
checkLabels :
	find . -name \*.tex | \
	xargs perl -p -e 's/\%.*//;' | \
	fgrep '\label' | \
	perl -p -e 's/.*\\label{([^}]*)}.*/$$1/;' | \
	sort | uniq -d

# Count deprecated stuff:
deprecated :
	# @ echo "OLDscript:"
	# @find . -name \*.tex | xargs fgrep '{OLDscript}' | sed 's/:.*//' | sort | uniq -c
	@ echo "doublebox:"
	@find . -name \*.tex | xargs fgrep 'doublebox' | sed 's/:.*//' | sort | uniq -c

munge :
	find . -name \*.tex | \
	xargs perl -pi \
	-e 's/{Chapter summary}/{Chapter Summary}/g;'

keys :
	find . -name \*.tex -or -name \*.txt | \
	xargs svn propset svn:keywords "Date Author Id Log"

# Fix the mime types of all pdf files
ps :
	find . -name \*.pdf | \
	xargs svn ps svn:mime-type application/octet-stream

# --------------------------------------------------------------------------------
clean :
	-rm -f *.aux *.log *.out *.glo *.toc *.ilg *.blg *.idx
	-rm -f */*.aux */*.log */*.out
	-rm -f .DS_Store */.DS_Store
	-rm -f common*.url common*.pdf SBE.url #?
	-rm -f test.*

bare : clean
	mv figures/squeak-logo.pdf figures/squeak-logo.pdfSAVE
	-rm -f ${BOOK2}.pdf */*.pdf
	mv figures/squeak-logo.pdfSAVE figures/squeak-logo.pdf

# --------------------------------------------------------------------------------
