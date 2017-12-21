
normal(10, 0)::signal(X).
normal(100, 0)::freq(Y).

0.01::miss(ID, X, '?'); 0.99::miss(ID, X, X).

output([X, Y]) :-
	value(signal(att1), X1), miss(x1, X1, X),
	value(freq(y), Y1), miss(y1, Y1, Y).

query(output(_)).
