(*实现两个int list数据的合并，且两个list中的元素在结果中交替出现，
直至其中一个int list数据结束，而另一个int list数据中的剩余元素则
直接附加至结果数据的尾部。*)
fun interleave(L1,[])=L1
    |interleave([],L2)=L2
    |interleave(x::L1,y::L2)=x::y::interleave(L1,L2);

val a=[1,3,5];
val b=[2,4,6,7];
val c=interleave(a,b);