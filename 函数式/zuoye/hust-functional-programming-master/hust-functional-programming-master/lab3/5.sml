datatype tree =Empty|Node of tree * int *tree ;

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
          Node(Node(l,x,r),root,right)
        end
    else
        let
          val Node(l,root,r)=right
        in
          Node(left,root,Node(l,x,r))
        end;

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

val tree1=Node(Node(Empty,10,Empty),11,Node(Empty,9,Empty));
val tree2=Node(Empty,5,Empty);
val res=SwapDown(tree1);

val tree3=Node(Node(Node(Empty,7,Empty),9,Node(Empty,6,Empty)),10,Node(Empty,8,Empty));

val res=heapify tree3;