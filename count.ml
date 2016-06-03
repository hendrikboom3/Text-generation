open Printf
open Sys

let html = true
;;
let unittest = Array.length Sys.argv > 1 && String.compare (Sys.argv.(1)) ("--unittest") == 0
;;
let rec number i = (
  if i >= 1000
  then (number(i / 1000); printf "%s" " ");
  if i >= 1000
  then printf "%s" "thousand ";
  let j = i mod 1000 in
  if i >= 1000 && j < 100 && j > 0
  then printf "and ";
  if j >= 100
  then ( number(j / 100);  printf " hundred "
  );
  let k = j mod 100 in
  ( if k >= 20
    then ( printf "%s" [|""; "ten"; "twenty"; "thirty"; "forty"; "fifty"; "sixty"; "seventy"; "eighty"; "ninety"|].(k / 10);
	   printf "%s" [|""; "-one"; "-two"; "-three"; "-four"; "-five"; "-six"; "-seven"; "-eight"; "-nine"|].(k mod 10);
    )
    else if i >= 100
    then if k = 0
      then ()
      else (
	if i >= 1000 && j < 100 then () else printf "and ";
	printf "%s" [|"zero" ;"one"; "two"; "three"; "four"; "five"; "six"; "seven"; "eight"; "nine"; "ten"; "eleven"; "twelve"; "thirteen"; "fourteen"; "fifteen"; "sixteen"; "seventeen"; "eighteen"; "nineteen"|].(k)
      )
    else ( printf "%s" [|"zero" ;"one"; "two"; "three"; "four"; "five"; "six"; "seven"; "eight"; "nine"; "ten"; "eleven"; "twelve"; "thirteen"; "fourteen"; "fifteen"; "sixteen"; "seventeen"; "eighteen"; "nineteen"|].(k)
    )
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
