#!/bin/bash
#Generate a BibTeX bibliography from an array of ISBNs


file="loeb-classical-library-bibliography"
file_out=${file}-out.bib

# awk -F "|" 'NR>1{printf "@book{%s,author={%s},title={%s},isbn={%s},subtitle={%s},origlanguage={%s},series={Loeb Classical Library},number={%s},pagetotal={%s},date={%s}}\n", $3,$5,$6,$3,$7,$8,$1,$15,$18 }' ${file}.csv >> ${file-out}

biber                                           \
	--tool                                        \
	--quiet                                       \
	--output-field-order=author,title,journaltitle,date,year \
	--outfile "${file-out}"                              \
	--configfile="loeb-bibtex.conf"          \
	"${file-out}"
	rm "${file-out}".blg

