
fun unzip([]: (string * int) list): string list * int list=([],[])
| unzip((x,y)::L)=
    let 
    val(a,b)=unzip(L);
    in
    (x::a,y::b)
    end;

val yy=unzip([("a",1),("b",2)]);
