fun sum [ ] = 0
    | sum (x ::L) = x + (sum L);
6 =sum[1,2,3];
fun mult [ ] = 1
    | mult (x ::L) = x * (mult L);
6 =mult[1,2,3];

fun Mult [ ] = 1
    | Mult (r ::R) = (mult r)*(Mult R);
12 = Mult[[1,2],[1,2,3]];

fun mult' ([ ], a) = a
	  | mult' (x :: L, a) = mult' (L, x * a);
fun Mult' ( [ ], a) =a
    |  Mult' (r::R, a) = 	mult'(r,1)*Mult'(R,a);
48 = Mult'([[1,2],[2,3]],4);

fun double (0 : int) : int = 0
    | double n = 2 + double (n - 1);
fun square (0: int) : int =0
    | square n = double(n)-1 + square(n-1);
64 = square(8);

fun divisibleByThree(0:int):bool = true
  |divisibleByThree 1 = false
  |divisibleByThree 2 = false
  |divisibleByThree n = divisibleByThree(n-3);
true = divisibleByThree(369);
false = divisibleByThree(3245);

fun oddP (0 : int) : bool = false
   | oddP 1 = true
   | oddP n = oddP (n-2);
val a = oddP(4);
val b = oddP(5);
