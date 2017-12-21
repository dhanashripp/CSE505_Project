normal(0, 1)::noise(X).
normal(10, 0)::signal(X).

output([X]) :-
	value(signal(att1), S),
	value(noise(att1), N),
	X is S+N.

query(output(_)).
