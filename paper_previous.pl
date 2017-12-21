exnum(X) :-
	previous(exnum(Y) , Y = 0),
	X is Y+1. 
query(exnum(_)).
