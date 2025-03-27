(* mult’ : int list * int -> int *)
(* REQUIRES: true *)
(* ENSURES: mult’(L, a) … (* FILL IN *) *)
(* 函数功能：mul([1,2,3],4)-> 1*2*3*4   *)

fun mult'([],a)=a
| mult'(x::L,a)=mult'(L,x*a);

fun Mult'([],a)=a
| Mult'(r::R,a)=mult'(r,a)*Mult'(R,1);

val A=[[1,2,3],[4,5,6]];
val B=2;
val C=Mult'(A,B);