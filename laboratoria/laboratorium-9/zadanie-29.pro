% Please define a predicate list_to_term(L,T), which is fulfilled if L is a non-empty list of natural number and T is the term built uing these numbers with operator +.
% Examples:
%  ?- list_to_term([1,2,3,4],T).
%  T = 1 + (2 + (3 + 4))
%  ?- list_to_term([7],T).
%  T = 7

list_to_term([H], H) :- !.

list_to_term([H|T], H + TT) :-
	list_to_term(T, TT).
