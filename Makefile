MD=$(shell find . -name '*.markdown')
ROOT=$(shell pwd)
TEMPLATE=$(addsuffix /template.latex, $(ROOT))
PDF=$(MD:.markdown=.pdf)
TEX=$(MD:.markdown=.tex)

all: $(PDF)
debug: $(TEX)

mtheme: vendor/mtheme/source/*
	cd vendor/mtheme; $(MAKE) sty install;

%.pdf: %.markdown template.latex Makefile mtheme
	$(eval OLDROOT=$(shell pwd))
	$(eval DIR=$(shell dirname $<))
	$(eval MY_MD=$(shell basename $<))
	$(eval MY_PDF=$(shell basename $@))
	cd $(DIR); pandoc $(MY_MD) -t beamer --latex-engine xelatex -o $(MY_PDF) --template=$(TEMPLATE) -f markdown+lists_without_preceding_blankline-implicit_figures -V mthemeDir="$(OLDROOT)/vendor/mtheme"

# Useful for debugging
%.tex: %.markdown template.latex Makefile
	$(eval DIR=$(shell dirname $<))
	$(eval MY_MD=$(shell basename $<))
	$(eval MY_TEX=$(shell basename $@))
	cd $(DIR); pandoc $(MY_MD) -t beamer --latex-engine xelatex -o $(MY_TEX) --template=$(TEMPLATE) -f markdown+lists_without_preceding_blankline -V mthemeDir="$(OLDROOT)/vendor/mtheme"

clean:
	- rm $(PDF)
	- rm $(TEX)
	- cd vendor/mtheme; $(MAKE) clean
