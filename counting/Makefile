# LocalMake is used for additional stanzas of local significance only.
# The '-' in front of the include command tells gnu make
#   not to worry if the file is not found.
# That LocalMake file should not be checked into a revision control system
# because it is of strictly local significance.

-include LocalMake

count.html: count.ml
	ocaml count.ml >count.html
unittest: count.ml
	ocaml count.ml --unittest >unittest
ord.html: ord.ml
	ocaml ord.ml --mathml >ord.html
ord.pdf: ord.ml
	ocaml ord.ml >ord.tex
	pdflatex ord.tex
