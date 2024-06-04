prod(node(X, nil, nil), X).

prod(node(X, nil, R), P) :-
	prod(R, P_R),
	P is X * P_R.

prod(node(X, L, nil), P) :-
	prod(L, P_L),
	P is X * P_L.

prod(node(X, L, R), P) :-
	prod(L, P_L),
	prod(R, P_R),
	P is X * P_L * P_R.
