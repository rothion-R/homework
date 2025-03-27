fun reverse([]:int list):int list = []
	| reverse(x::L) = (reverse L) @ [x];

[4,3,2] = reverse([2,3,4]);

fun helpreverse'([],A) = A 
	| helpreverse'(x::L,A) = helpreverse'(L,x::A);

fun reverse'(L:int list):int list = helpreverse'(L,[]);

[4,3,2] = reverse'([2,3,4]);