open Printf
open Sys

let html = true
;;
let n = 5 (*infinitiy surrogate.*)
;;
let web = true;
;;
let p () = printf "\n<p>\n"
  ;;
if web then
  (
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
else (* Haven't figured out how to mae this work yet. *)
  printf "%s\n" "<script type=\"text/javascript\" async
  src=\"/home/hendrik/MathJax.js\">
</script>"
;;
printf "John Baez started counting.\n";
p();
printf "\n\"";
for i = 1 to n do printf " %d," i done;
printf " ... \"";
p();
printf "\nAfter a long while, he noticed that the stars had all gone out, and even the black holes were dissipating.\nHe went on counting.\n";
p();
printf "<p>";
for i = 1 to n do printf " %d," (467837845 + i) done;
printf " ... \"\n";
printf "\nAfter much more time, he noticed he had run out of natural numbers and that the universe was over and done with
.  Interesting, he thought.  I never thought I would live this long.  He went on counting.";
p();
printf "\"";
for i = 1 to n do printf "$\\omega + %d$, " i done;
printf " ... \"\n";
p();

let omegas j = (
  printf "Eventually he ran out of natural numbers again.  That didn't stop him.  He'd just use $\\omega + \\omega$.";
  p();
  printf "Wait! Better call that $\\omega %d$." j;
  p();
  printf "\"";
  for i = 1 to n do printf "$\\omega %d + %d$, " j i done;
  printf " ... \"\n";
  p();)
in
  for j = 2 to n do omegas j done
;
    printf "Eventually he ran out of natural numbers to count the number of times he had run out of natural numbers.  That didn't stop him.  He'd just use $\\omega \\omega$, or rather, $\\omega$ squared.";


let omegas2 j = (
  p();
  printf "Wait! Better call that $\\omega^2 + \\omega %d$." j;
  p();
  printf "\"";
  for i = 1 to n do printf "$\\omega^2 + \\omega %d + %d$, " j i done;
  printf " ... \"\n";
  p();
  printf "Eventually he ran out of natural numbers again.  That didn't stop him.  He'd just use $\\omega^2 + \\omega %d + \\omega$." j;
)
in

 for j = 0 to n do omegas2  j done;

p();
printf "... ";
p()
;;
type ord = Exp of (ord * ord) | Mul of (ord * ord) | Add of (ord * ord) | Omega | Int of int
;;
let rec print x =
    match x with
      Exp (a, b) -> (print a; printf "^"; print b)
    | Mul (a, b) -> (print a; print b)
    | Add (a, b) -> (print a; printf "+"; print b)
    | Omega -> printf "\\omega"
    | Int i -> printf "%d" i
;;
printf "$$";
print (Int 0);
print (Int 2);
print Omega;
print (Add (Omega, Int 0));
print (Add ((Omega), Int 1));
print (Mul ((Int 4), (Int 5)));
print (Exp ((Int 4), (Int 5)));
printf "$$";
(*
let rec simplify x =
  match x with
    Exp b e ->
      (let bb = simplify b in
       let ee = simplify e in
       ( match ee with
	 Int 0 -> int 1
       | Int 1 -> bb
       | _ ->
	  ( match bb with
	    Int 1 -> Int 1
	  | _ => x
	  )
       )
      )

  | Mul x y ->
     (let xx = simplify x in
      let yy = simplify y in
      march yy with
	Int 1 -> xx
      | Int 0 -> 0
     )
  | Add x y ->
     (let xx = simplify x in
      let yy = simplify y in
      match xx with
	Int 0 -> yy
      | _ -> match yy with
	Int 0 -> xx
     )
  | _ -> x
*)
;;
