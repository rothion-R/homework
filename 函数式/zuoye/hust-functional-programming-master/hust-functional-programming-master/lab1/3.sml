(* mult : int list list -> int *)
(* REQUIRES: true *)
(* ENSURES: mult(R) evaluates to the product of all the integers in the 
lists of R. *)

fun mult[]=0
   |mult(x::L)= 
    if L=[] then
        x
    else
        x*mult(L);

fun Mult []=0
    | Mult(r::R)=
    if R=[] then
        mult(r)
    else 
        mult(r)*Mult(R);

val a=[[1,2,3,4],[5,6]];

val b=Mult(a);