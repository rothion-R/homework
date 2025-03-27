(* double : int -> int *)
(* REQUIRES: n >= 0 *)
(* ENSURES: double n evaluates to 2 * n.*)
fun double (0 : int) : int = 0
| double n = 2 + double (n - 1)

(* square: int -> int *)
(* REQUIRES: n >= 0*)
(* ENSURES: square n evaluates to n * n.*)

fun square (0:int):int =0
| square(n)=square(n-1)+double(n)-1;

val a=11;

val b=square(a);