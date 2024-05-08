% Please define a predicate difference(A,B,C) for sets A, B, and C, which is fulfilled if and only if  C = A \ B .

difference([], _, []) :- !.

difference([AH|AT], B, C) :-
	member(AH, B),
	!,
	difference(AT, B, C).

difference([AH|AT], B, [AH|CT]) :-
	difference(AT, B, CT).
