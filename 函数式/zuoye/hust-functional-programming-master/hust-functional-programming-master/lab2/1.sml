(*实现输出表参数的逆序输出；*)
fun reverse([])=[]
    | reverse(x::L) =reverse(L)@[x]

val a=[1,2,3,4,5];
val b=reverse(a);

(*实现输出表参数的逆序输出；*)
fun reverse' ([],y) = y
    |reverse' (x::L,y) = reverse'(L,x::y);

val a=[1,2,3,4,5];
val b=reverse'(l1);


