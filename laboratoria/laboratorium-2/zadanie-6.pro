% Predicate sil/2 can also be defined as follows:
%   sil(X,N) :- sil(X,N,1).

%   sil(0,A,A).
%   sil(X,N,A) :- X > 0, A1 is A * X, X1 is X - 1, sil(X1,N,A1).
% Please define the predicates from exercise 5 using this technique. (Note: The variable A of sil/3 is called accumulator.)

% plus(NUMBER_1, NUMBER_2, RESULT) :- plus(NUMBER_1, NUMBER_2, 0, RESULT).

plus(0, NUMBER_2, NUMBER_2).

plus(NUMBER_1, NUMBER_2, RESULT) :-
	NUMBER_1 > 0,
	NUMBER_1_MINUS_1 is NUMBER_1 - 1,
	NUMBER_2_PLUS_1 is NUMBER_2 + 1,
	plus(NUMBER_1_MINUS_1, NUMBER_2_PLUS_1, RESULT).


plus(NUMBER_1, NUMBER_2, RESULT) :- 
	NUMBER_1 < 0,
	NUMBER_1_PLUS_1 is NUMBER_1 + 1,
	NUMBER_2_MINUS_1 is NUMBER_2 - 1,
	plus(NUMBER_1_PLUS_1, NUMBER_2_MINUS_1, RESULT).

times(NUMBER_1, NUMBER_2, RESULT) :-
	times(NUMBER_1, NUMBER_2, RESULT, 0).

times(0, _, RESULT, RESULT).

times(NUMBER_1, NUMBER_2, RESULT, ACCUMULATOR) :-
	NUMBER_1 > 0,
	NUMBER_1_MINUS_1 is NUMBER_1 - 1,
	ACCUMULATOR_PLUS_NUMBER_2 is ACCUMULATOR + NUMBER_2,
	times(NUMBER_1_MINUS_1, NUMBER_2, RESULT, ACCUMULATOR_PLUS_NUMBER_2).

times(NUMBER_1, NUMBER_2, RESULT, ACCUMULATOR) :-
	NUMBER_1 < 0,
	NUMBER_1_PLUS_1 is NUMBER_1 + 1,
	ACCUMULATOR_MINUS_NUMBER_2 is ACCUMULATOR - NUMBER_2,
	times(NUMBER_1_PLUS_1, NUMBER_2, RESULT, ACCUMULATOR_MINUS_NUMBER_2).

fib(N, RESULT) :-
	fib(N, RESULT, 0, 1).

fib(0, RESULT, RESULT, _).

fib(N, RESULT, ACCUMULATOR_1, ACCUMULATOR_2) :-
	N > 0,
	N_MINUS_1 is N - 1,
	ACCUMULATOR_3 is ACCUMULATOR_1 + ACCUMULATOR_2,
	fib(N_MINUS_1, RESULT, ACCUMULATOR_2, ACCUMULATOR_3).

sum-up(N, RESULT) :-
	sum-up(N, RESULT, 0).

sum-up(0, RESULT, RESULT).

sum-up(N, RESULT, ACCUMULATOR) :-
	N > 0,
	N_MINUS_1 is N - 1,
	ACCUMULATOR_PLUS_N is ACCUMULATOR + N,
	sum-up(N_MINUS_1, RESULT, ACCUMULATOR_PLUS_N).
