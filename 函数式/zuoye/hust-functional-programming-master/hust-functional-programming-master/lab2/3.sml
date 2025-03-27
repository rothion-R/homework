datatype tree=None|Node of tree*int*tree;
(*将一个列表分割为（L1,X,L2）,且length(L1)和length(L1)相差小于等于1*)
fun split [] = ([],0,[])
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

(*将一个表转换成一棵平衡树。*)
fun listToTree [] = None
    | listToTree [x] = Node(None,x,None)
    | listToTree L =
        let
            val (A,y,B) = split L
        in
            Node(listToTree A, y, listToTree B)
        end;

val list=[1,2,3,4,5];
val res=listToTree(list);