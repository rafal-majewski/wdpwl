% Assume the following definition of the predicate append is given.
append([X|L1], L2, [X|L3]) :-
	append(L1, L2, L3).

append([], L, L).

% Using answer trees please show how Prolog answers to the questions
%  ?- append(X, [3,4], [2,3,4]).

append(X, [3, 4], [2, 3, 4]).
	append(L1_1, [3, 4], [3, 4]).
		append(L1_2, [3, 4], [4]).
			append(L1_3, [3, 4], []).
				false.
		append([], [3, 4], [3, 4]).
			true, X = [2].
