(*在树中查找节点*)
fun binarySearch(Empty,_)=false
    |binarySearch(Node(left,root,right),input)=
    case Int.compare(root,input) of
        GREATER => binarySearch(right,input)
        |EQUAL => true
        |LESS => binarySearch(left,input)


fun Ins(x,Empty)=Node(Empty,x,Empty)
    |Ins(x,Node(left,root,right))=
    case Int.compare(x,root) of
    GREATER=>Node(left,root,Ins(x,right))
    | _    =>Node(Ins(x,left),root,right);

(*创建一颗排序树*)
fun createSortedTree[]=Empty
    |createSortedTree(x::L)=Ins(x,createSortedTree(L));

fun trav(Empty)=[]
    |trav(Node(t1,x,t2))=trav(t1)@[x]@trav(t2);

val list=[1,2,3,4,5,6];
val sortedTree=createSortedTree(list);
trav(sortedTree);

