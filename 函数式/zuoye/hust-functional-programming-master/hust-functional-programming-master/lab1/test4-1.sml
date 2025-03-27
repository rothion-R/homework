
fun zip([]:string list,d2::L2:int list): (string * int) list =[]
| zip([]:string list,[]:int list):(string*int)list =[]
| zip(d1::L1:string list,[]:int list) :(string * int) list=[]
| zip(d1::L1:string list,d2::L2:int list): (string * int) list=(d1,d2)::zip(L1,L2);

val a=["a","b","c"];
val b=[1,2,3];

val c=zip(a,b);

val a=["a","b"];
val b=[1,2,3];

val c=zip(a,b);

val a=["a","b","c"];
val b=[1,2];

val c=zip(a,b);