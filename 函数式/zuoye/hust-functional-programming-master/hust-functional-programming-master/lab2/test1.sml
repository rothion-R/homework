(*类型：int*string list -> string list *)
(*函数功能：在string list base前添加your个“are belong to us”*)
fun all (your,base)=
    case your of
        0=>base
        |_=>"are belong to us"::all(your-1,base);

fun funny (f,[])=0
| funny(f,x::xs)=f(x,funny(f,xs));

(fn x => (fn y => x)) "Hello, World!"
