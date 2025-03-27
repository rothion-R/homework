(*函数类型： int list -> int option *)
(*函数功能： 如果x为L中的第一个奇数，则返回SOME x；否则返回NONE*)

type 'a option =NONE|SOME of 'a;

fun findOdd []=NONE
| findOdd (x::L) =
    if (x mod 2)=1 then 
        SOME x 
    else 
        findOdd L;

(*测试*)

val alist=[2,4,6,8];

val res=findOdd alist;

val blist=[2,4,6,9,10,11];

val res=findOdd blist;
