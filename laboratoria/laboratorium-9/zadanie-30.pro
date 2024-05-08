% Please define a predicate variables(T,L), which is fulfilled if L is the list of variables appearing in temr T.

variables(TERM, [TERM]) :- 
	var(TERM), 
	!.

variables(TERM, []) :-
	atomic(TERM), 
	!.

variables(TERM, VARIABLES) :- 
	TERM =.. TERMS,
	variables_in_terms(TERMS, VARIABLES).

variables_in_terms([], []) :-
	!.

variables_in_terms([TERMS_HEAD|TERMS_TAIL], VARIABLES) :- 
	variables(TERMS_HEAD, VARIABLES_HEAD), 
	variables_in_terms(TERMS_TAIL, VARIABLES_TAIL), 
	append(VARIABLES_HEAD, VARIABLES_TAIL, VARIABLES).
