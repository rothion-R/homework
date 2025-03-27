fun zip([]:string list,_:int list):(string*int) list = []
	| zip(_:string list,[]:int list) = []
	| zip(s::S,i::I) =(s,i)::zip(S,I);

zip(["a","b"],[1,2]);

fun unzip([]:(string*int) list):(string list*int list)= ([],[])
	| unzip((x,y)::L) =
	let	val (S,I) = unzip(L)
	in	( x::S,y::I)
	end;

unzip([("a",2),("b",3)]);