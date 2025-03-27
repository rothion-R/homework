(*1.sml*)

(*函数类型： ((int ->int) * int) -> int*)
(*函数功能： 为将一个整数通过函数变换(如翻倍、求平方或求阶乘)后再加1*)

fun thenAddOne (f,x)= f x +1;

(*测试*)
fun double x = 2 * x ;

val a=3;

val res=thenAddOne(double,a);


(*2.sml*)

(*函数类型：((‘a -> ‘b) * ‘a list) -> ‘b list*)
(*函数功能：实现整数集的数学变换(如翻倍、求平方或求阶乘)*)

fun mapList (f,[])=[]
|   mapList (f,x::L)=  f(x):: mapList(f,L);


(*函数类型： (‘a -> ‘b) -> (‘a list -> ‘b list) *)
(*函数功能：实现整数集的数学变换(如翻倍、求平方或求阶乘)*)
fun mapList' f = fn L =>
    case L of [] => []
    | x::R => (f x):: mapList' f R;

(*测试*)

val alist=[1,2,3,4,5,6];

val blist=mapList(double,alist);

val clist=(mapList' double) alist;

(*3.sml*)

(*函数类型： int list -> int option *)
(*函数功能： 如果x为L中的第一个奇数，则返回SOME x；否则返回NONE*)


fun findOdd []=NONE
| findOdd (x::L) =
    if (x mod 2)=1 then 
        SOME x 
    else 
        findOdd L;

(*测试*)

val alist=[2,4,6,8];

val res=findOdd alist;

val blist=[2,4,6,9,10,11];

val res=findOdd blist;

(*4.sml*)


datatype 'a tree=Empty|Node of 'a tree * 'a * 'a tree;

(*函数类型： (‘a -> bool) -> ‘a tree -> ‘a option tree*)
(*函数功能： 将树中满足条件P（ ‘a -> bool ）的节点封装成option类型保留，否则替换成NONE*)

fun treeFilter f Empty=Empty
| treeFilter f (Node(left,x,right))=
            if (f x) then 
                Node(treeFilter f left,SOME x,treeFilter f right)
            else
                Node(treeFilter f left,NONE,treeFilter f right);


fun test x= (x mod 2)=1;

val tree1=Node(Node(Empty,5,Empty), 10,Node(Empty,7,Empty));
val tree2= treeFilter test tree1;

(*5.sml*)

(*函数类型： tree * tree -> order *)
(*when given two trees, returns a value of type order, 
based on which tree has a larger value at the root node*)

fun treecompare (Empty,Empty)=EQUAL
|   treecompare(Empty,Node(t1,x,t2))=GREATER
|   treecompare(Node(t1,x,t2),Empty)=LESS
|   treecompare(Node(left1,x1,right1),Node(left2,x2,right2))=
    if (x1<x2) then 
        LESS
    else if (x1>x2) then
        GREATER
    else EQUAL;

val tree1=Node(Node(Empty,10,Empty),11,Node(Empty,9,Empty));

val tree2=Node(Node(Empty,10,Empty),15,Node(Empty,9,Empty));

val tree3=Node(Empty,16,Empty);

val res=treecompare(tree1,tree2);

val res=treecompare(tree2,tree3);



(*函数类型： tree -> tree*)
(* REQUIRES the subtrees of t are both minheaps
* ENSURES swapDown(t) = if t is Empty or all of t’s immediate children are empty then
* just return t, otherwise returns a minheap which contains exactly the elements in t. *)

fun SwapDown Empty=Empty
| SwapDown (Node(Empty,x,Empty))=Node(Empty,x,Empty)
| SwapDown (Node(left,x,right))=

    if treecompare(Node(left,x,right),left)=LESS andalso treecompare(Node(left,x,right),right)=LESS then
        Node(left,x,right)
    else if treecompare(left,right)=LESS then
        let
          val Node(l,root,r)=left
        in
          Node(SwapDown( Node(l,x,r)),root,right)
        end
    else
        let
          val Node(l,root,r)=right
        in
          Node(left,root,SwapDown (Node(l,x,r)))
        end;

val tree1=Node(Node(Empty,10,Empty),11,Node(Empty,9,Empty));
val res=SwapDown(tree1);

val tree1=Node(Empty,11,Node(Empty,9,Empty));
val res=SwapDown(tree1);



(*函数类型：tree -> tree*)
(*函数功能：given an arbitrary tree t, evaluates to a minheap with exactly the elements of t.*)

fun heapify Empty =Empty
| heapify (Node(left,root,right))=
    let
      val t1=heapify(left)
      val t2=heapify(right)
      val t3=Node(t1,root,t2);
    in
        SwapDown(t3)
    end;


(*测试*)

val tree1=Node(Node(Node(Empty,7,Empty),9,Node(Empty,6,Empty)),10,Node(Empty,8,Empty));

val res=heapify tree1;