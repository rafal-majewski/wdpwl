% Please define a predicate powerset(L1,L2) using bagof.

powerset(L1, L2) :-
	bagof(X, subset(X, L1), L2).
	
subset([], []).

subset([L1H|L1T], [L1H|L2T]) :-
	subset(L1T, L2T).

subset(L1, [_|L2T]) :-
	subset(L1, L2T).
