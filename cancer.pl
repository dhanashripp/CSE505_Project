%store the records sequentially
exnum(N):-
	previous(exnum(Y), Y=0),
	N is Y+1.

%Assume probability of actually having cancer to be 0.01
word(cancer).
0.01::cancer(pos); 0.99::cancer(neg).

%Assume the false negative rate for cancer test to be 5%
0.05::flip(ID, pos, neg); 0.95::flip(ID, pos, pos).

%Assume the false positive rate for cancer test to be 3%
0.03::flip(ID, neg, pos); 0.97::flip(ID, neg, neg).

%Output both, original class and noisy class
%output([X, Class]) :- cancer(X), flip(lbl, X, Class).

0.10::miss(ID, X, '?'); 0.90::miss(ID, X, X).

output([P, X, Class]) :-
	word(P),
	cancer(X1), flip(lbl, X1, Class),	
        miss(lbl, X1, X).

query(output(_)).

