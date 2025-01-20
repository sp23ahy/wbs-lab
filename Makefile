## jhnoll@gmail.com
ROOT:=$(shell $(HOME)/bin/findup .sgrc)
SOURCE_DIR=.
include $(ROOT)/tools/Makefile.in
BIB=../../readings/references.bib

# This is used by tools/Makefile.in to create 'all:' target.
INSTALL_OBJECTS=README.txt instructions.txt instructions.pdf instructions.html

all: $(INSTALL_OBJECTS)

README.txt: ${TOOLS.dir}/templates/lab-README.md
	$(PP) -Dcomponent=${*} $(META_DATA) $< | $(PANDOC) --standalone -t plain -o $@

README.md: ${TOOLS.dir}/templates/lab-README.md
	$(PP) $< > $@


%.pdf: %.dot
	dot -Tpdf $< > $@

%.pdf: %.tex
	pdflatex $<

instructions.pdf: initial_cw_wbs.pdf refined_cw_wbs.pdf

include $(ROOT)/tools/Make.rules
clean:
	rm -f $(INSTALL_OBJECTS)

