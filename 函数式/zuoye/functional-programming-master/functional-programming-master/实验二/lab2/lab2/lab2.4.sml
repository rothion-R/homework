datatype tree = Empty | Node of tree * int * tree;

fun trav Empty = []
    | trav(Node(t1,x,t2)) = trav t1 @ (x :: trav t2);

fun reverse([]:int list):int list = []
	| reverse(x::L) = (reverse L) @ [x];

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

fun revT Empty = Empty
	| revT(Node(t1,x,t2)) =
	  Node(revT t2,x,revT t1);

val list1 = [1,2,3,4,5,6,7,8,9,10]
val tree1 = listToTree list1;
trav tree1;
trav(revT tree1) = reverse(trav tree1);