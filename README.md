# OSC Weekly Meeting Slides

This is a quick and easy to use/modify repo that can be accessed by anyone giving the weekly run down for the Open Source Club at Ohio State. 

![language Markdown](https://img.shields.io/badge/language-markdown-blue.svg "Language Markdown")
[![Open Source Love](https://badges.frapsoft.com/os/v2/open-source.svg?v=102)](https://github.com/ellerbrock/open-source-badge/)
![License CC0 1.0 Universal](https://img.shields.io/badge/License-CC0%201.0%20Universal-green.svg "License CC0 1.0 Universal")
[![Build Status](https://travis-ci.org/OSUOSC/osc-weekly-rundown.svg?branch=master)](https://travis-ci.org/OSUOSC/osc-weekly-rundown)

# Dependencies
* [pandoc](http://pandoc.org/)
* [latex](https://www.latex-project.org/)

If you get this error: `! LaTeX Error: Filer 'etoolbox.sty' not found. ! LaTeX Error: Filer 'etoolbox.sty' not found.`
* `texlive-latexextra` - Arch Linux.
* `texlive-latex-extra` - Ubuntu

Note: Install using your system's prefered package manager.

# To Run
* Fetch the beamer theme: `$ git submodule init && git submodule update`
* Run the make file: `$ Makefile`
* Open the HTML file containing the week's current meeting in a browser.

# Future Plans (some options)
* Modify the make file to have an output directory.
* Make a better solution to deal with PDFs.

Questions or comments, please feel free to make an issue. The repo maintainers are [Nefari0uss](https://github.com/Nefari0uss) and [LibreWulf](https://github.com/oslerw). 
