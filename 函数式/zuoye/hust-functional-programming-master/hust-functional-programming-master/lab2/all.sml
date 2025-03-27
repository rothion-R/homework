(*test1*)

(*实现输出表参数的逆序输出；*)
fun reverse([])=[]
    | reverse(x::L) =reverse(L)@[x];

val a=[1,2,3,4,5];
val b=reverse(a);

(*实现输出表参数的逆序输出；*)
fun reverse'([],y) = y
    |reverse'(x::L,y) = reverse'(L,x::y);

val a=[1,2,3,4,5];
val b=reverse'(a,[]);

(*test2*)

(*实现两个int list数据的合并，且两个list中的元素在结果中交替出现，
直至其中一个int list数据结束，而另一个int list数据中的剩余元素则
直接附加至结果数据的尾部。*)
fun interleave(L1,[])=L1
    |interleave([],L2)=L2
    |interleave(x::L1,y::L2)=x::y::interleave(L1,L2);

val a=[1,3,5];
val b=[2,4,6,7];
val c=interleave(a,b);

(*test3*)

datatype tree=Empty|Node of tree*int*tree;
(*将一个列表分割为（L1,X,L2）,且length(L1)和length(L1)相差小于等于1*)
fun split [] = ([],0,[])
    | split [x] = ([],x,[])
    | split (x::L) =
        let
            val (A,y,B) = split L
        in
            if length(A) > length(B) then
                (A, y, x::B)
            else
                (x::A, y, B)
        end;

(*将一个表转换成一棵平衡树。*)
fun listToTree [] = Empty
    | listToTree [x] = Node(Empty,x,Empty)
    | listToTree L =
        let
            val (A,y,B) = split L
        in
            Node(listToTree A, y, listToTree B)
        end;

val list=[1,2,3,4,5,6];
val tree=listToTree(list);

(*test4*)


(*中序遍历*)
fun trav(Empty)=[]
    |trav(Node(t1,x,t2))=trav(t1)@[x]@trav(t2);

(*翻转树*)
fun revT Empty = Empty
  | revT(Node(t1,x,t2)) = 
    Node(revT t2, x, revT t1);

val a=trav(tree);
val b=trav(revT(tree));

trav(tree)=reverse(trav(revT(tree)));

(*test5*)

(*在树中查找节点*)
fun binarySearch(Empty, _ )=false
    |binarySearch(Node(left,root,right),input)=
    case Int.compare(root,input) of
        GREATER => binarySearch(right,input)
        |EQUAL => true
        |LESS=>binarySearch(left,input);
val isFind=binarySearch(tree,5);
val isFind=binarySearch(tree,100);