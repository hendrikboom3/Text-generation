# LocalMake is used for additional stanzas of local significance only.
# The '-' in front of the include command tells gnu make
#   not to worry if the file is not found.
# That LocalMake file should not be checked into a revision control system
# because it is of strictly local significance.

-include LocalMake

README.html: README.md
	omd README.md >README.html
count.html:
	ocaml count.ml >count.html
unittest:
	ocaml count.ml --unittest >unittest
