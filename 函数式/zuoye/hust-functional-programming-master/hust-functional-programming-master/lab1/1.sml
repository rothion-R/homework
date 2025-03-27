3+ 4;
(*val it=7:int*)
3 + 2.0;
(*
类型不匹配
stdIn:2.1-2.6 Error: operator and operand don't agree [literal]
  operator domain: int * int
  operand:         int * real
  in expression:
    3 + 2.0
*)
it + 6;
(*val it = 13 : int*)
val it = “hello”;
(*val it = "hello" : string*)
it + “ world”;
(*
+号没有重载sting类型的连接，应该使用^号
stdIn:8.3 Error: overloaded variable not defined at type
  symbol: +
  type: string
*)
it + 5;
(*
string + int 类型不匹配
stdIn:10.3 Error: overloaded variable not defined at type
  symbol: +
  type: string
*)
val a = 5;
(*
val a = 5 : int
*)
a = 6;
(*
=用于判断，并非赋值
val it = false : bool
*)
a + 8; 
(*
val it = 13 : int
*)
val twice = (fn x => 2 * x);
(*
val twice = fn : int -> int
*)
twice a;
(*
val it = 10 : int
*)
let x = 1 in x end;
(*
应该在x之前加上‘val’
stdIn:1.2-11.3 Error: syntax error: deleting  LET ID EQUALOP
stdIn:11.5 Error: syntax error found at IN
*)
foo;
(*
无意义的语句
stdIn:1.2-9.1 Error: unbound variable or constructor: foo
*)
[1, “foo”];
(*
列表中应该为类型一致的元素
stdIn:11.1 Error: illegal token
stdIn:11.2 Error: illegal token
stdIn:11.6 Error: illegal token
stdIn:11.7 Error: illegal token
*)
