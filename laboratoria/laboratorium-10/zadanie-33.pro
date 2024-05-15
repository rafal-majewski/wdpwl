% The following predicate gives the N-th Fibonacci number.
fib(1, 1) :- !.
fib(0, 1) :- !.
%  fib(N,F) :- N >1, N1 is N-1, N2 is N-2, fib(N1,F1), fib(N2,F2), F is F1 + F2.
% Please improve this predicate using assert.

:- dynamic(fib/2).

fib(N, RESULT) :-
	!,
	N > 1,
	N_MINUS_1 is N - 1,
	N_MINUS_2 is N - 2,
	fib(N_MINUS_1, RESULT_OF_N_MINUS_1),
	fib(N_MINUS_2, RESULT_OF_N_MINUS_2),
	RESULT is RESULT_OF_N_MINUS_1 + RESULT_OF_N_MINUS_2,
	asserta(fib(N, RESULT) :- !).
