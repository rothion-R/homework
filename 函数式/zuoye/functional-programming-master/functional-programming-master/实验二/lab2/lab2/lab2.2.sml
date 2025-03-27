fun interleave(X:int list,Y:int list):int list = 
	case(X,Y) of
	  ([],_) => Y
	| (_,[]) => X
	| (x::X,y::Y) => x :: y ::interleave(X,Y);

[4,5,6,8,7,9,0] = interleave([4,6,7],[5,8,9,0]);