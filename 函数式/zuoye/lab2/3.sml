fun printInt (a:int) =     print(Int.toString(a)^" ");  fun getInt () =     Option.valOf (TextIO.scanStream (Int.scan StringCvt.DEC) TextIO.stdIn);      fun printIntList ( [] ) = ()   | printIntList ( x::xs ) =      let 	val tmp = printInt(x)     in 	printIntList(xs)     end;  fun getIntList ( 0 ) = []   | getIntList ( N:int) = getInt()::getIntList(N-1);    (*** Begin ***)  fun interleave([], []) = []     | interleave(a::x, []) = a::interleave(x, [])     | interleave([], b::y) = b::interleave([], y)     | interleave(a::x, b::y) = a::b::interleave(x, y);    (*****End*****)  val L = getIntList(2); val R = getIntList(6); val O = interleave (L, R); printIntList(O); 