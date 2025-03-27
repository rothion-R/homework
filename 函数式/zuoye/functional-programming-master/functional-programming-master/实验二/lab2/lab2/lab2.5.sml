datatype tree = Empty | Node of tree * int * tree;

fun Ins(x, Empty) = Node(Empty, x, Empty)
    | Ins(x, Node(t1, y, t2)) =
        case Int.compare(x,y) of
        LESS => Node(Ins(x, t1), y, t2)
        | _ => Node(t1, y, Ins(x, t2));

fun trav Empty = []
    | trav(Node(t1,x,t2)) = trav t1 @ (x :: trav t2);

fun binarySearch(Empty,_) = false
	| binarySearch(Node(t1,x,t2),a:int) =
	  case Int.compare(a,x) of
		  LESS => binarySearch(t1,a)
	                | EQUAL => true
		| GREATER => binarySearch(t2,a);

fun createSortedTree [] =Empty
	| createSortedTree(x::L) =
	  Ins(x,createSortedTree(L));

val tree2 = createSortedTree [1,2,3,4,5,6,7,8,9];
binarySearch(tree2,1);