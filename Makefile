# LocalMake is used for additional stanzas of local significance only.
# The '-' in front of the include command tells gnu make
#   not to worry if the file is not found.
# That LocalMake file should not be checked into a revision control system
# because it is of strictly local significance.

-include LocalMake

0README.html: 0README.md
	omd 0README.md >0README.html
publish: 0README.html
	cp 0README.html ~/farhome/hendrik/www/www/nanogenmo/

