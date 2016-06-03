open Printf
open Sys

let html = true
;;
let unittest = Array.length Sys.argv > 1 && String.compare (Sys.argv.(1)) ("--unittest") == 0
;;
let tinynumber i = (* precondition: i < 100 *)
  (
    if i >= 20
    then ( printf "%s" [|""; "ten"; "twenty"; "thirty"; "forty"; "fifty"; "sixty"; "seventy"; "eighty"; "ninety"|].(i / 10);
	   printf "%s" [|""; "-one"; "-two"; "-three"; "-four"; "-five"; "-six"; "-seven"; "-eight"; "-nine"|].(i mod 10);
    )
    else printf "%s" [|"zero" ;"one"; "two"; "three"; "four"; "five"; "six"; "seven"; "eight"; "nine"; "ten"; "eleven"; "twelve"; "thirteen"; "fourteen"; "fifteen"; "sixteen"; "seventeen"; "eighteen"; "nineteen"|].(i)
)
;;
let smallnumber big i = (* precodition: i < 1000 *)
  (
    if i >= 100
    then ( tinynumber(i / 100);  printf " hundred";
      if i mod 100 > 0 then printf " "
    );
    let k = i mod 100 in
    (
      if big || i >= 100
      then (
	if k = 0
	then ()
	else( printf "and ";
	      tinynumber k
	)
      )
      else tinynumber k
    )
  )
;;
let rec scaled s i =
  (* if i > 0, print i * 1000 ^ s.
     if i = 0, do nothing.
  *)
  (
    if i = 0 then ()
    else if i >= 1000
    then scaled (s + 1) (i / 1000);
    let j = i mod 1000 in
    if j > 0
    then (printf " "; smallnumber (s = 0 && i > 1000) j);
    if s > 0 && j > 0
    then printf "%s"
      [|" thousand"; " million"; " billion";
	" trillion"; " quadrillion"; "quintillion";
	" sextillion"; "heptillion"; " octillion";
	" nonillion"; " decillion"; " undecillion";
	" duodecillion"; " tredecillion"; " quattuordecillion";
	" quindecillion"; " sexdecillion"; " septendecillion";
	" octodecillion"; " novemdecillion"; " vigintillion"
      |].(s-1)
  (* These are taken from the short scale in the Wilipedia entry https://en.wikipedia.org/wiki/Names_of_large_numbers and go far beyond is neede for 31 and 64-bit machines. They have been tested on a 32 bit machine up to a billion. *)
  )

;;
let rec number i =
  (* unchecked precondition: i must be less than a million vigintillions. *)
  (
    if i >= 1000
    then scaled 0 i
    else (
      let j = i mod 1000 in
      if j > 0 then smallnumber (i > 1000) j
    )
  )
;;
let test i = (printf "\n%d " i; number i);
;;
let testh h =
  ( test (h + 0);
    test (h + 1);
    test (h + 9);
    test (h + 10);
    test (h + 11);
    test (h + 19);
    test (h + 20);
    test (h + 21);
    test (h + 29);
    test (h + 30);
    test (h + 99);
  )
;;
let testt t =(
  testh (t + 0);
  testh (t + 100);
  testh (t + 200);
  testh (t + 900))
;;
let testm() =(
  testt 0;
  testt 1000;
  testt 9000;
  testt 10000;
  testt 14000;
  testt 15000;
  test 1000000;
  test 1002000;
  test 1000000000;
  test 1000003000;
  test 1002003000;
  test (1024 * 1024 * 1024 - 1);
)
;;
if unittest then testm()
else ( 
  printf "%s" "The mathematician started counting:";
  if html then printf "\n<p>";
  printf "\n\n\"";
  for i = 1 to 14999
  do if i <> 45
    then (number i;
	  if i <> 14999 then printf ", "
    )
  done;
  printf "%s" ".\"\n";
  if html then printf "\n<p>\n";
  printf "\n\"Hmmm,\"  he said.  \"That didn\'t come out right.\""
)
;;
