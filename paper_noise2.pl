
%Set a random label
0.5::label(pos); 0.5::label(neg).

%flip the values of attribute from pos to neg with 0.05 probability
0.05::flip(ID, pos, neg); 0.95::flip(ID, pos, pos).

%flip the values of attribute from neg to pos with 0.03 probability
0.03::flip(ID, neg, pos); 0.97::flip(ID, neg, neg).

%Output both, original class and noisy class
output([X, Class]) :- label(X), flip(lbl, X, Class).

query(output(_)).

