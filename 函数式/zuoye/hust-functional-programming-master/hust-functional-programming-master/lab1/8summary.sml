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

(* mult : int list list -> int *)
(* REQUIRES: true *)
(* ENSURES: mult(R) evaluates to the product of all the integers in the 
lists of R. *)

fun Mult []=0
    | Mult(r::R)=
    if R=[] then
        mult(r)
    else 
        mult(r)*Mult(R);

val a=[[1,2,3,4],[5,6]];
val b=Mult(a);

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


(* divisibleByThree : int -> bool *)
(* REQUIRES: true *)
(* ENSURES: divisibleByThree n evaluates to true if n is a multiple of 3 and 
to false otherwise *)

fun divisibleByThree (0:int):bool = true
    | divisibleByThree(1:int):bool = false
    | divisibleByThree(2:int):bool = false
    | divisibleByThree(n:int):bool =
    if n<0 then divisibleByThree(abs(n))
    else divisibleByThree(n-3);

val a=7;
val b=divisibleByThree a;

val a=9;
val b=divisibleByThree a;

(* evenP : int -> bool *)
(* REQUIRES: n >= 0 *)
(* ENSURES: evenP n evaluates to true iff n is even. *)
fun evenP (0 : int) : bool = true
| evenP 1 = false
| evenP n = evenP (n - 2)


(* oddP : int -> bool *)
(* REQUIRES: n >= 0 *)
(* ENSURES: oddP n evaluates to true iff n is odd. *)
fun oddP (0:int):bool =false
| oddP(1:int):bool =true
| oddP n =oddP(n-2);

val a=7;
val b=oddP(a);