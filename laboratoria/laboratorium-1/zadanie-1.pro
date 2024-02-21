% A predicate length/2 describing the length of a list can be defined as follows.
%   length(0,[]).
%   length(N,[_|L]) :- length(M,L), N is M+1.
% Please define predicates member/2, fac/2, fib/2, and gcd/3 analogously.

member(ELEMENT, [ELEMENT|_]).

member(ELEMENT, [_|LIST]) :-
	member(ELEMENT, LIST).

fac(0, 1).

fac(N, RESULT) :-
	N > 0,
	N_MINUS_1 is N - 1,
	fac(N_MINUS_1, RESULT_MINUS_1),
	RESULT is N * RESULT_MINUS_1.

fib(0, 0).

fib(1, 1).

fib(N, RESULT) :- N > 1,
	N_MINUS_1 is N - 1,
	N_MINUS_2 is N - 2,
	fib(N_MINUS_1, RESULT_MINUS_1),
	fib(N_MINUS_2, RESULT_MINUS_2),
	RESULT is RESULT_MINUS_1 + RESULT_MINUS_2.

gcd(A, 0, A).

gcd(A, B, RESULT) :-
	B > 0,
	MOD is A mod B,
	gcd(B, MOD, RESULT).
