%To keep the track of example number
exnum(N) :-
	previous(exnum(M), M = -1),
	N is M+1.

%Uniformly sample each of the three attributes
1/3::size(small); 1/3::size(medium); 1/3::size(large).
1/3::color(red); 1/3::color(green); 1/3::color(blue).
1/3::shape(circle); 1/3::shape(triangle); 1/3::shape(square).

poisson(40)::drift_int.
next_drift(Tn) :-
	previous(next_drift(T), T = 0),
	T == 0,
	value(drift_int, Tn).

next_drift(Tn) :-
	previous(next_drift(T), T = 0),
	T \== 0, Tn is T - 1.

%Determine where concept drift should occur, based on the prediate next_drift, a counter that counts down to the next concept drift occurence
drift :- previous(next_drift(T), T = 0), T == 0.

%Determine active concept
active_concept(Cn) :-
	drift,
	previous(active_concept(C), C=-1),
	Cn is (C+1) mod 3.
active_concept(C) :-
	not drift,
	previous(active_concept(C), C=-1).

%Defining concept according to original STAGGER definition
concept(0) :- size(small), color(red).
concept(1) :- color(green); shape(circle).
concept(2) :- size(medium); size(large).

label(true) :-
	active_concept(C), concept(C).
label(false) :-
	not label(true).

output((SZ, SH, CL, LBL)) :-
	size(SZ), shape(SH), color(CL), label(LBL).

query(active_concept(_)).
query(output(_)).

	
