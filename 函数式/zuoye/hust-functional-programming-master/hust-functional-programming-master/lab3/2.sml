
(*函数类型：((‘a -> ‘b) * ‘a list) -> ‘b list*)
(*函数功能：实现整数集的数学变换(如翻倍、求平方或求阶乘)*)

fun mapList (f,[])=[]
|   mapList (f,x::L)=  f(x):: mapList(f,L);



(*函数类型： (‘a -> ‘b) -> (‘a list -> ‘b list) *)
(*函数功能：实现整数集的数学变换(如翻倍、求平方或求阶乘)*)
fun mapList' f = fn L =>
    case L of [] => []
    | x::R => (f x):: mapList' f R;

(*测试*)

fun double x = 2 * x ;

val alist=[1,2,3,4,5,6];

val blist=mapList(double,alist);

val clist=(mapList' double) alist;