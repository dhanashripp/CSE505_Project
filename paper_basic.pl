
0.5::male; 0.5::female.

normal(175, 8)::height :- male.
normal(160, 8)::height :- female.

output([H,m]) :-
	value(height , H), male.
output([H,f]) :-
	value(height, H), female. 

query(output(_)).
