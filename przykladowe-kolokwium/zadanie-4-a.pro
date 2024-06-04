search(node(X, _, _), X).

search(node(_, L, _), X) :-
	search(L, X).

search(node(_, _, R), X) :-
	search(R, X).
