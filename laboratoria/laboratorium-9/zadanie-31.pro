% Please define a predicate count(A,T,N), which is fulfilled if term A appears N times in term T.
% Examples:
%  ?- count(a, f(a), N).
%  N = 1
%  ?- count(a, f(a, g(b,a)), N).
%  N = 2
%  ?- count(a, f(a,X)), N).
%  N = 1
%  ?- count(f(a), f(a,g(f(a),f(a))), N).
%  N = 2

count(_, TERM, 0) :-
	var(TERM),
	!.

count(TERM_TO_COUNT, TERM_TO_COUNT, 1) :-
	!.

count(_, TERM, 0) :-
	atomic(TERM),
	!.

count(TERM_TO_COUNT, TERM, COUNT) :-
	TERM =.. TERMS,
	count_in_terms(TERM_TO_COUNT, TERMS, COUNT).

count_in_terms(_, [], 0) :-
	!.

count_in_terms(TERM_TO_COUNT, [TERMS_HEAD|TERMS_TAIL], COUNT) :-
	count(TERM_TO_COUNT, TERMS_HEAD, COUNT_HEAD),
	count_in_terms(TERM_TO_COUNT, TERMS_TAIL, COUNT_TAIL),
	COUNT is COUNT_HEAD + COUNT_TAIL.
