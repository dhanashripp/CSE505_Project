:- consult(paper_previous).

%Stock rate variation for companies%
0.4::companyA; 0.3::companyB; 0.3::companyC.

normal(200, 5)::rate :- companyA.
normal(300, 10)::rate :- companyB.
normal(400, 15)::rate :- companyC.

output([N, R, companyA]) :-
	value(rate , R), companyA, exnum(N).
output([N, R, companyB]) :-
	value(rate, R), companyB, exnum(N).
output([N, R, companyC]) :-
	value(rate, R), companyC, exnum(N).

query(output(_)).
