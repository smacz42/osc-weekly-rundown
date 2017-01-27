MD=$(shell find . -name '*.markdown')
LAST=$(shell find . -name '*.markdown' | sort | sed -e '$$!d')
ROOT=$(shell pwd)
TEMPLATE=$(addsuffix /template.latex, $(ROOT))
PDF=$(MD:.markdown=.pdf)
TEX=$(MD:.markdown=.tex)

latest: $(LAST:.markdown=.pdf)
debuglatest: $(LAST:.markdown=.tex)
all: $(PDF)
debug: $(TEX)

mtheme: vendor/mtheme/source/*
	cd vendor/mtheme; $(MAKE) sty install;

%.pdf: %.markdown template.latex Makefile mtheme
	$(eval OLDROOT=$(shell pwd))
	$(eval DIR=$(shell dirname $<))
	$(eval MY_MD=$(shell basename $<))
	$(eval MY_PDF=$(shell basename $@))
	cd $(DIR); pandoc $(MY_MD) -t beamer --latex-engine xelatex -o $(MY_PDF) --template=$(TEMPLATE) -f markdown+lists_without_preceding_blankline-implicit_figures
# Useful for debugging
%.tex: %.markdown template.latex Makefile
	$(eval DIR=$(shell dirname $<))
	$(eval MY_MD=$(shell basename $<))
	$(eval MY_TEX=$(shell basename $@))
	cd $(DIR); pandoc $(MY_MD) -t beamer --latex-engine xelatex -o $(MY_TEX) --template=$(TEMPLATE) -f markdown+lists_without_preceding_blankline

clean:
	- rm -f $(PDF)
	- rm -f $(TEX)
	- cd vendor/mtheme; $(MAKE) clean
