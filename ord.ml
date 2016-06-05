open Printf
open Sys

let html = true
;;
let n = 3 (*infinitiy surrogate.*)
;;
let web = true;
;;
let p () = printf "\n<p>\n"
;;
let preamble() = 
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
type ord = Exp of (ord * ord) | Mul of (ord * ord) | Add of (ord * ord) | Omega | Int of int
;;
let rec print x =
    match x with
      Exp (a, b) -> (print a; printf "^"; print b)
    | Mul (a, b) -> (print a; printf " "; print b) (* Unfortunately, mathjax takes the space out again, possibly fusing digits into an unintended number.  Well, maybe it won't happen in the ordinals I'm printing  *)
    | Add (a, b) -> (print a; printf "+"; print b)
    | Omega -> printf "\\omega"
    | Int i -> printf "%d" i
;;
let test i = (printf "$"; print i; printf "$ \n")
;;

test (Int 0);

test (Int 2);
test Omega;
test (Add (Omega, Int 0));
test (Add (Omega, Int 1));
test (Mul (Int 4, Int 5));
test (Exp (Int 4, Int 5));

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
let t i = (printf "$$"; print i; printf " = "; print (simplify i); printf "$$\n")
;;

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
;;
let show i = (printf "$"; print (simplify i); printf "$")
;;
(* ---- *)
preamble();
printf "John Baez started counting.\n";
p();
printf "\n\"";
for i = 1 to n do printf " %d," i done;
printf " ... \"";
p();
printf "\nAfter a long while, he noticed that the stars had all gone out, and even the black holes were dissipating.\nHe went on counting.\n";
p();
printf "<p>";
for i = 1 to n do show (Int (467837845 + i)); printf ", " done;
printf " ... \"\n";
printf "\nAfter much more time, he noticed he had run out of natural numbers and that the universe was over and done with.  Interesting, he thought.  I never thought I would live this long.  He went on counting.";
p();
printf "\"";
for i = 1 to n do show (Add(Omega, Int i)); printf ", "  done;
printf " ... \"\n";
p();

printf "<p><p>End preamble <p><p>"
  ;;

let omegas j = (
  printf "Eventually he ran out of natural numbers again.  That didn't stop him.  He'd just usee ";
  printf "$"; print (Add (simplify (Mul(Omega, (Int (j - 1)))), Omega));
  printf"$.";
  p();
  printf "Wait! Better call that $\\omega %d$." j;
  p();
  printf "\"";
  for i = 1 to n do printf "$\\omega %d + %d$, " j i done;
  printf " ... \"\n";
  p();)
;;
(*
  for j = 2 to n do omegas j done
;
*)
printf "Eventually he ran out of natural numbers to count the number of times he had run out of natural numbers.  That didn't stop him.  He'd just usew $\\omega \\omega$, or rather, $\\omega$ squared.";

;;
let omegas2 prefix j = (
  p();
(*  printf "Wait! Better call that $\\omega^2 + \\omega %d$." j; 
    p(); *)
  printf "\"";
  for i = 1 to n
  do show (Add (prefix, (Add(Exp(Omega, (Int 2)), Add(Mul(Omega, Int j), Int i)))));
    printf ", ";
  done;
  printf " ... \"\n";
  p();
  printf "Eventually he ran out of natural numbers again.  That didn't stop him.  He'd just usex ";
  show (Add (prefix, (Add(Exp(Omega, (Int 2)), (Mul(Omega, Int (j + 1)))))));
  printf "."
)
;;

(* for j = 0 to n do omegas2 (Int 0) j done; *)

p();
printf "... ";
p()
;;

let ome prefix = (* m = 0 *)
  (
    for j = 1 to n
    do (*printf "!!!!! omegasm %d starting !!!!!" m;*)
      let pf = Add( prefix, Mul(Exp(Omega, (Int 0)), Int j))
      in
	 (*printf "<p>prefix is "; show pf; printf "<p>";*)
      for i = 0 to n
      do show(Add(prefix, (Int i)))
      done;
      p();
      printf "\"";
	 (*
	   for i = 1 to n
	   do show (Add preefix, Mul(Exp(Omega, (Int 0)), Int j),  Int i)));
	   printf ", ";
	   done;
	 *)
      printf " ... \"\n";
      p();
      printf "Eventually he ran out of natural numbers again.  That didn't stop him.  He'd just useq ";
      show (Add (pf, Mul(Exp(Omega, (Int 0)), Int (j + 1))));
      printf "."
    done;
  )
;;
let rec omegasm prefix m = (* precondition: m >= 2 *)
  (printf "<p> level %d <p>" m;
      for j = 0 to n
      do
	 let pf = Add( prefix, Mul(Exp(Omega, (Int m)), Int j))
	 in
	 (
	   if m > 0
	   then (printf "Using ";
		 if false then show (Add (pf, Exp(Omega, (Int m)) ))
		   else show pf;
		 (* Not clear under which circumstance we want to print this.
		    printf "; that is, ";
		    show (Add( prefix, Mul(Exp(Omega, (Int m)), Int (j+1))));
		 *)
		 printf "."
	   );
	 (*printf "<p>prefix is "; show pf; printf "<p>";*)
	   if m > 0
	   then omegasm pf (m - 1)
 	   else show pf;
	 (*
	   for i = 1 to n
	   do show (Add preefix, Mul(Exp(Omega, (Int m)), Int j),  Int i)));
	   printf ", ";
	   done;
	 *)
	   if m > 0
	   then (
	     p();
	     printf "\"";
	     printf " ... \"\n";
	     p())
	   else printf ", ";
	   if m > 0
	   then (printf "Eventually he ran out of natural numbers again.  That didn't stop him.  He'd just uset ";
		 if true then show (Add (pf, Exp(Omega, (Int m)) ))
		   else show pf;
		 (* Not clear under which circumstance we want to print this.
		    printf "; that is, ";
		    show (Add( prefix, Mul(Exp(Omega, (Int m)), Int (j+1))));
		 *)
		 printf "."
	   );
	 )
      done;
  )
;;
omegasm (Int 0) 3
