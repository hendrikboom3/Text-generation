(* I think this works, and generates aabout 60K words worth of html of ordinal counting.  wc tells me so.  However, it also couds paragraph tags and the like as words.

Unfortunately, I can't read the result properly, because the amount of mathematical notation in it kills my browsers.
*)

open Printf
open Sys

let html = ref false
;;
let unittest = ref false
;;
for i = 0 to Array.length Sys.argv - 1
do if 0 = String.compare Sys.argv.(i) "--html"
  then html := true
  else  if 0 = String.compare Sys.argv.(i) "--unittest"
    then unittest := true;
done

let html = !html
;;
let unittest = !unittest
;;
let counting = true
;;
let n = 3 (*infinity surrogate.*)
;;
let web = html && true; (* whether to get mathjax from web or from a file *)
;;
let p () = if html then printf "\n<p>\n" else printf "\n\n"
;;
let math() = if html then printf("$") else printf "\\("
;;
let unmath() = if html then printf "$" else printf "\\)"
;;
let mathjax() =
    if web
    then (
      printf "%s"
      "<script type=\"text/x-mathjax-config\">
  MathJax.Hub.Config({
    extensions: [\"tex2jax.js\"],
    jax: [\"input/TeX\", \"output/HTML-CSS\"],
    tex2jax: {
      inlineMath: [ ['$','$'], [\"\\(\",\"\\)\"] ],
      displayMath: [ ['$$','$$'], [\"\\[\",\"\\]\"] ],
      processEscapes: true
    },
    \"HTML-CSS\": { availableFonts: [\"TeX\"] }
  });
</script>
<script type=\"text/javascript\" src=\"path-to-MathJax/MathJax.js\">
</script>";
      
      printf "%s\n" "<script type=\"text/javascript\" async
  src=\"https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML\">
</script>"
    )
    else (* Haven't figured out how to make this work yet. *)
      printf "%s\n" "<script type=\"text/javascript\" async
  src=\"/home/hendrik/MathJax.js\">
</script>"
;;
let endhtml() = ()
;;
let starttex() =
  printf "\\documentclass{article}\n\\usepackage{mathtools}\n\\begin{document}\n"
;;
let endtex() =
  printf "\\end{document}\n"
    ;;
let prefix() =
  if html
  then mathjax()
  else starttex()
;;
let postfix() =
  if html
  then endhtml()
  else endtex()
;;
type ord = Exp of (ord * ord) | Mul of (ord * ord) | Add of (ord * ord) | Omega | Int of int
;;
let rec print x =
    match x with
      Exp (a, b) -> (print a; printf "^{"; print b; printf"}")
    | Mul (a, b) -> (print a; printf " "; print b) (* Unfortunately, mathjax takes the space out again, possibly fusing digits into an unintended number.  Well, maybe it won't happen in the ordinals I'm printing  *)
    | Add (a, b) -> (print a; printf "+"; print b)
    | Omega -> printf "\\omega"
    | Int i -> printf "%d" i
;;
let test i = (printf "$"; print i; printf "$ \n")
;;

if unittest
then(
  test (Int 0);
  test (Int 2);
  test Omega;
  test (Add (Omega, Int 0));
  test (Add (Omega, Int 1));
  test (Mul (Int 4, Int 5));
  test (Exp (Int 4, Int 5));
)
;;
let rec simplify x =
  match x with
    Exp (b, e) ->
      (let bb = simplify b in
       let ee = simplify e in
       ( match ee with
	 Int 0 -> Int 1
       | Int 1 -> bb
       | _ ->
	  ( match bb with
	    Int 1 -> Int 1
	  | _ -> Exp(bb, ee)
	  )
       )
      )

  | Mul (x, y) ->
     (let xx = simplify x in
      let yy = simplify y in
      match yy with
	Int 1 -> xx
      | Int 0 -> yy
      | _ ->
	 ( match xx with
	   Int 1 -> yy
	 | Int 0 -> xx
	 | _ -> Mul(xx, yy)
	 )
     )
  | Add (x, y) ->
     (let xx = simplify x in
      let yy = simplify y in
      match xx with
	Int 0 -> yy
      | _ -> match yy with
	Int 0 -> xx
	| _ -> Add(xx, yy)
     )
  | _ -> x

;;
let t i = (math(); print i; printf " = "; print (simplify i); unmath(); printf "\n")
;;
if unittest
then(
  
  t (Int 0);

  t (Int 2);
  t Omega;
  t (Add (Omega, Int 0));
  t (Add (Omega, Int 1));
  t (Mul (Int 4, Int 5));
  t (Exp (Int 4, Int 5));
  
  t(Exp (Int 0, Omega));
  t(Exp (Int 1, Omega));
  t(Exp (Omega, Int 0));
  t(Exp (Omega, Int 1));
  
  t(Mul (Int 0, Omega));
  t(Mul (Int 1, Omega));
  t(Mul (Omega, Int 0));
  t(Mul (Omega, Int 1));
  
  t(Add (Int 0, Omega));
  t(Add (Int 1, Omega));
  t(Add (Omega, Int 0));
  t(Add (Omega, Int 1));
  
  t(Add (Exp(Omega, Int 0), Int 7));
  t(Add (Exp(Omega, Int 1), Int 7));
  
  t(Add (Mul(Exp(Omega, Int 0), Int 0), Int 7));
  t(Add (Mul(Exp(Omega, Int 0), Int 1), Int 7));
  t(Add (Mul(Exp(Omega, Int 1), Int 0), Int 7));
  t(Add (Mul(Exp(Omega, Int 1), Int 1), Int 7));
)
;;
let inquote = ref false;
;;
let quote() = if !inquote then () else (p(); printf "\""; inquote := true)
;;
let unquote() = if !inquote then (printf "\".\n"; inquote := false) else ()
;;
let so_on() = (printf "... "; unquote())
;;
let showord i = (math(); print (simplify i); unmath())
;;
let text0() = (
  unquote();
  printf "John Baez started counting.\n";
  p();
  quote()
)
;;
let textomega() = (
(*  for i = 1 to n do printf " %d," i done;a\a\\
  printf " ... "; unquote;
  p();
*)
  unquote();
  printf "\nAfter a long while, he noticed that the stars had all gone out, and even the black holes were dissipating.\nHe went on counting.\n";
  quote();
  for i = 1 to n do showord (Int (467837845 + i)); printf ", " done;
  so_on();
  p();
  unquote();
  printf "\nAfter much more time, he noticed he had run out of natural numbers and that the universe was over and done with.  Interesting, he thought.  I never thought I would live this long.  He went on counting.";
  p();
);

(*
printf "\"";
for i = 1 to n do showord (Add(Omega, Int i)); printf ", "  done;
printf " ... \"\n";
p();

p(); p(); printf "End preamble"; p(); p();
*)
;;

let text n = (
  if counting
  then (if html then printf "{%d}" n);
  match n with
    0 -> text0()
  | 4 -> textomega()
  | _ -> ()
)
;;
let count = ref 0
  ;;
let show i =
  (
    text !count;
    count := !count + 1;
    quote();
    showord i
  )
let showuq i =
  (
    unquote();
    text !count;
    count := !count + 1;
    showord i
  )
;;

let rec omegapoly prefix m = (* precondition: m >= 2 *)
  ( (*p(); printf " level %d" m; p();*)
      for j = 0 to n
      do
	 let pf = Add( prefix, Mul(Exp(Omega, (Int m)), Int j))
	 in
	 (
(*	   if m > 0
	   then ( (*printf "Using ";*)
		 show pf;
		 printf "."
	   );
*)
	   if m > 0
	   then omegapoly pf (m - 1)
 	   else show pf;
	   if m > 0
	   then (
	     so_on();
	     p())
	   else printf ", ";
	   if m > 0
	   then (if !count > 5
	     then(
	       printf "Eventually he ran out of natural numbers again.  That didn't stop him.  He'd just use ";
	       if true then showuq (Add (pf, Exp(Omega, (Int m)) ))
	       else show pf;
	       printf ".";
	       p()
	     )
	   );
	 )
      done;
  )
;;
prefix();
omegapoly (Int 0) 3;
printf("...");
p();
printf("Eventually he ran out of integers for the powers of omega.  Never mind, he had all the ordinals available to count powers of omega.");
if true
then
  for m = 1 to 2 
  do for l = 0 to n
    do for k = 1 to n
      do omegapoly (Mul
		    ( Exp( Omega,
			   Add(
			     Mul(Omega, (Int m)),
			     Int l)),
		      Int k)) 3
      done
    done
  done;
p();
printf "To be continued, when reality catches up with this story.";
postfix();
