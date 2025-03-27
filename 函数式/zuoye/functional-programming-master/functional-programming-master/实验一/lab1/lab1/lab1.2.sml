fun sum [ ] = 0
    | sum (x ::L) = x + (sum L);
6=sum[1,2,3];
fun mult [ ] = 1
    | mult (x ::L) = x * (mult L);
6=mult[1,2,3];