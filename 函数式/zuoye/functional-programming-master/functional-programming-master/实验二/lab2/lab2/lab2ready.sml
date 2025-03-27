datatype tree = Empty | Node of tree * int * tree;

fun Ins(x, Empty) = Node(Empty, x, Empty)
    | Ins(x, Node(t1, y, t2)) =
        case Int.compare(x,y) of
        LESS => Node(Ins(x, t1), y, t2)
        | _ => Node(t1, y, Ins(x, t2));

fun trav Empty = []
    | trav(Node(t1,x,t2)) = trav t1 @ (x :: trav t2);