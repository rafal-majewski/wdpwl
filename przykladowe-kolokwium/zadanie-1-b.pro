member(X, [X|_]).

member(X, [_|T]) :-
	member(X, T).

member(X, [H|T]) :-
	member(X, H).
