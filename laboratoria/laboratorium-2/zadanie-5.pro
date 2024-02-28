% Please define predicates plus/3, times/3, fib/2 oraz sum-up/2 (using recursion).
% Predicate sum-up(N,X) is fulfilled, if X equals the sum from 0 to N.

plus(0, NUMBER_2, NUMBER_2).

plus(NUMBER_1, NUMBER_2, RESULT) :-
	NUMBER_1 > 0,
	NUMBER_1_MINUS_1 is NUMBER_1 - 1,
	plus(NUMBER_1_MINUS_1, NUMBER_2, RESULT_MINUS_1),
	RESULT is RESULT_MINUS_1 + 1.

plus(NUMBER_1, NUMBER_2, RESULT) :-
	NUMBER_1 < 0,
	NUMBER_1_PLUS_1 is NUMBER_1 + 1,
	plus(NUMBER_1_PLUS_1, NUMBER_2, RESULT_PLUS_1),
	RESULT is RESULT_PLUS_1 - 1.

times(0, _, 0).

times(NUMBER_1, NUMBER_2, RESULT) :-
	NUMBER_1 > 1,
	NUMBER_1_MINUS_1 is NUMBER_1 - 1,
	times(NUMBER_1_MINUS_1, NUMBER_2, RESULT_MINUS_1),
	RESULT is RESULT_MINUS_1 + NUMBER_2.

times(NUMBER_1, NUMBER_2, RESULT) :-
	NUMBER_1 < 0,
	NUMBER_1_PLUS_1 is NUMBER_1 + 1,
	times(NUMBER_1_PLUS_1, NUMBER_2, RESULT_PLUS_1),
	RESULT is RESULT_PLUS_1 - NUMBER_2.

fib(0, 0).

fib(1, 1).

fib(N, RESULT) :- N > 1,
	N_MINUS_1 is N - 1,
	N_MINUS_2 is N - 2,
	fib(N_MINUS_1, RESULT_MINUS_1),
	fib(N_MINUS_2, RESULT_MINUS_2),
	RESULT is RESULT_MINUS_1 + RESULT_MINUS_2.

sum-up(0, 0).

sum-up(N, RESULT) :- N > 0,
	N_MINUS_1 is N - 1,
	sum-up(N_MINUS_1, RESULT_MINUS_1),
	RESULT is RESULT_MINUS_1 + N.
