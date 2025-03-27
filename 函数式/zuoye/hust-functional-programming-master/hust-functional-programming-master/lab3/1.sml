(*函数类型： ((int ->int) * int) -> int*)
(*函数功能： 为将一个整数通过函数变换(如翻倍、求平方或求阶乘)后再加1*)

fun thenAddOne (f,x)= f x +1;

(*测试*)
fun double x = 2 * x ;

val a=3;

val res=thenAddOne(double,a);
