datatype tree = Empty | Node of tree * int * tree;

fun Ins(x, Empty) = Node(Empty, x, Empty)
    | Ins(x, Node(t1, y, t2)) =
        case Int.compare(x,y) of
        LESS => Node(Ins(x, t1), y, t2)
        | _ => Node(t1, y, Ins(x, t2));

fun trav Empty = []
    | trav(Node(t1,x,t2)) = trav t1 @ (x :: trav t2);

fun reverse([]:int list):int list = []
	| reverse(x::L) = (reverse L) @ [x];
[4,3,2] = reverse([2,3,4]);

fun helpreverse'([],A) = A 
	| helpreverse'(x::L,A) = helpreverse'(L,x::A);

fun reverse'(L:int list):int list = helpreverse'(L,[]);
[4,3,2] = reverse'([2,3,4]);

fun interleave(X:int list,Y:int list):int list = 
	case(X,Y) of
	  ([],_) => Y
	| (_,[]) => X
	| (x::X,y::Y) => x :: y ::interleave(X,Y);
[4,5,6,8,7,9,0] = interleave([4,6,7],[5,8,9,0]);

fun split []:(int list*int*int list) = ([],0,[])
    | split [x] = ([],x,[])
    | split (x::L) =
        let
            val (A,y,B) = split L
        in
            if length(A) > length(B) then
                (A, x, y::B)
            else
                (y::A, x, B)
        end;

fun listToTree [] = Empty
	| listToTree [x]= Node(Empty,x,Empty) 
	| listToTree  L=
	let
		val(T,x,R) = split L
	in
		Node(listToTree T ,x,listToTree R )
	end;
val list1 = [1,2,3,4,5,6,7,8,9,10]
val tree1 = listToTree list1;
trav tree1;

fun revT Empty = Empty
	| revT(Node(t1,x,t2)) =
	  Node(revT t2,x,revT t1);
trav(revT tree1) = reverse(trav tree1);

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