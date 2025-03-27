fun mult [ ] = 1
    | mult (x ::L) = x * (mult L);
fun Mult [ ] = 1
    | Mult (r ::R) = (mult r)*(Mult R);
12 = Mult[[1,2],[1,2,3]];