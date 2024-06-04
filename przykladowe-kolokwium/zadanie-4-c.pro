postorder(nil, []).

postorder(node(X, L, R), L_ORDER) :-
	postorder(L, L_L_ORDER),
	postorder(R, R_L_ORDER),
	append(L_L_ORDER, R_L_ORDER, BRANCH_ORDER),
	append(BRANCH_ORDER, [X], L_ORDER).
