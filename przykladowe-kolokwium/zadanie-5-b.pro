erasePairs([],[]).

erasePairs([X,X|L1],L2) :-
	erasePairs(L1,L2).

erasePairs([X|L1],[X|L2]) :-
	erasePairs(L1,L2).
