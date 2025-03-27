fun mult' ([ ], a) = a
	  | mult' (x :: L, a) = mult' (L, x * a);
fun Mult' ( [ ], a) =a
    |  Mult' (r::R, a) = 	mult'(r,1)*Mult'(R,a);
48 = Mult'([[1,2],[2,3]],4);
