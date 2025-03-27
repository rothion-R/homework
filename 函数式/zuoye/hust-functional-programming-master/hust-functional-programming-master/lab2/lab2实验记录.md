 # lab2

## 课堂练习

### 1分析以下函数或表达式的类型

1.

```
(*类型：int*string list -> string list *)
(*函数功能：在string list base前添加your个“are belong to us”*)
fun all (your,base)=
    case your of
        0=>base
        |_=>"are belong to us"::all(your-1,base);
```

2.

```
(*类型：('a * int -> int) * 'a list -> int *)
fun funny(f,[])=0
    | funny(f,x::xs)=f(x,funny(f,xs));
```

3.

```
 (*   'a -> 'b -> 'a    *)
 (*    Hello,World是输入。  *)
(fn x => (fn y => x)) "Hello, World!"
```

### 2.用归纳法证明ins函数和isort函数的正确性

```
(*对任一整数x和有序整数序列L，函数ins(x, L) 计算结果为x和L中所有元素构成的一个有序序列*)
fun ins (x, []) = [x]
    | ins (x, y::L) = case compare(x, y) of
		    GREATER => y::ins(x, L)
		    |   _ 	=> x::y::L
```

证明：

ins(x,L)。当L是空表时，结果为[x]，是一个有序序列。

假设对于长度<k的有序表L来说，ins(x,L)的结果均为x和L中所有元素构成的有序序列。

那么对于长度为k的有序表L来说：

ins(x,L) 时会将L的首元素y取出，剩余部分为Y，即L=y::Y。

将y与x进行比较，

1.如果x>y。则进行操作y::ins（x,Y）。因为Y的长度为k-1，而由假设可知，ins(x,Y)会

得到一个有序表。然后将y加入这个有序表的首部。因为表L本身就是有序的，所以它的首元素y是整个表

中最小的元素，如果x大于y的话，那么在加入x的排好序的列表中，y还应该是首元素。

所以可得，当x>y时所得结果正确。

2.如果x<=y。则直接将x放入L的首元素。因为y本身就是L中最小的元素，如果x仍小于y，那么只有将它

放到首部才能构成有序序列。由此可知当x<=y所得结果正确。

综上可知，该函数能够达到要求。

```
(* REQUIRES true 				*)
(* ENSURES isort(L) = a sorted perm of L 	*)
(*对所有整数序列L，isort L计算得到L中所有元素的一个有序排列。*)
fun isort [ ] = [ ]
   |   isort (x::L) = ins (x, isort L)
```

证明：

对于空表来说，所得结果仍为空表。正确

假设对于所有长度<k的列表来说，所得结果均为一个递增的有序序列。

那么对于长度为k的列表L来说：

假设L=y::Y.

进行isort（L）= ins( y , isort( Y ) )

由于Y长度为k-1，根据假设可知，isort(Y)的结果是一个有序序列，不妨将其设为Z。

然后进行ins(x,Z)。已经证毕，ins()的计算结果为x和Z中所有元素构成的一个有序序列。

所以可知，isort能够将列表元素进行排序。

### 3分析下面菲波拉契函数的时间复杂度

1.

```
fun fib n = if n<=2 then 1 else fib(n-1) + fib(n-2);
```

fib(n)的复杂度为O(2^n)

2.

```
fun fibber (0: int) : int * int = (1, 1)
  | fibber (n: int) : int * int =
      let val (x: int, y: int) = fibber (n-1)
      in (y, x + y)
      end
```

fibber的复杂度为O(n)