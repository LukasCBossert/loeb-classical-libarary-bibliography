#!/bin/bash

file="loeb-classical-library-bibliography"
file_out="${file}-out"

ancient="ancient-authors-and-works.bib"

# awk -F "|" 'NR>1{printf "@book{%s,author={%s},title={%s},isbn={%s},subtitle={%s},origlanguage={%s},series={Loeb Classical Library},number={%s},pagetotal={%s},date={%s}}\n", $3,$5,$6,$3,$7,$8,$1,$15,$18 }' ${file}.csv >> ${file-out}.bib

biber                                           \
	--tool                                        \
	--quiet                                       \
	--output-field-order=author,title,journaltitle,date,year \
	--outfile "${file-out}.bib"                              \
	--configfile="loeb-bibtex.conf"          \
	"${file-out}.bib"
	rm "${file-out}.bib.blg"


biber                                           \
	--tool                                        \
	--quiet                                       \
	--output-resolve \
	--output-field-order=author,title,journaltitle,date,year \
	--outfile "${ancient}"                              \
	--configfile="loeb-bibtex.conf"          \
	"${ancient}"
	rm "${ancient}.blg"

