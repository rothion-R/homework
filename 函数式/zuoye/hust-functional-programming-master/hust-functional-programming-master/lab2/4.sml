
(*中序遍历*)
fun trav(Empty)=[]
    |trav(Node(t1,x,t2))=trav(t1)@[x]@trav(t2);

(*翻转树*)
fun revT Empty = Empty
  | revT(Node(t1,x,t2)) = 
    Node(revT t2, x, revT t1);



