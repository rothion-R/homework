fun oddP (0 : int) : bool = false
   | oddP 1 = true
   | oddP n = oddP (n-2);
false = oddP(4);
true = oddP(5);
