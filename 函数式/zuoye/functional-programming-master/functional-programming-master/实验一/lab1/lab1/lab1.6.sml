fun divisibleByThree(0:int):bool = true
  |divisibleByThree 1 = false
  |divisibleByThree 2 = false
  |divisibleByThree n = divisibleByThree(n-3);
true = divisibleByThree(369);
false = divisibleByThree(3245);