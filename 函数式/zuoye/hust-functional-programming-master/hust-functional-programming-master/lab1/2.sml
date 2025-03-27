(* mult : int list -> int *)
(* REQUIRES: true *)
(* ENSURES: mult(L) evaluates to the product of the integers in L. *)

fun mult[]=0
|   mult(x::L)= 
    if L=[] then
        x
    else
        x*mult(L);

val a=[1,2,3,4,5];
val b=mult(a);

