split(P, [], [], []).

split(P, [H|T], [H|L1], L2) :-
	call(P, H),
	split(P, T, L1, L2).

split(P, [H|T], L1, [H|L2]) :-
	\+ call(P, H),
	split(P, T, L1, L2).

odd(X) :-
	1 is X mod 2.
