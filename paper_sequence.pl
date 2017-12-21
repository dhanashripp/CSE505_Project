
%Distribution of characters
1/26::c(N,a); 1/26::c(N,b); 1/26::c(N,c);
1/26::c(N,d); 1/26::c(N,e); 1/26::c(N,f);
1/26::c(N,g); 1/26::c(N,h); 1/26::c(N,i);
1/26::c(N,j); 1/26::c(N,k); 1/26::c(N,l);
1/26::c(N,n); 1/26::c(N,m); 1/26::c(N,o);
1/26::c(N,p); 1/26::c(N,q); 1/26::c(N,r);
1/26::c(N,s); 1/26::c(N,t); 1/26::c(N,u);
1/26::c(N,v); 1/26::c(N,w); 1/26::c(N,x);
1/26::c(N,y); 1/26::c(N,z).

%Probability to stop, in order to control the distribution of the length of the sequence
0.2::stop(N) :- N> 0.

sequence(Seq) :- seq(0,Seq).

%Sequence termination when the decision is made to stop
seq(Pos, []) :- stop(Pos).

seq(Pos, [Char|Rest]) :-
	not stop(Pos),
	c(Pos , Char),
	PosNext is Pos + 1,
	seq(PosNext, Rest).

query(sequence(_)).

