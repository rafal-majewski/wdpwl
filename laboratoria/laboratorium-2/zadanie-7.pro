% Assume the following predicates are given.
q1(X, Y) :-
	p(X, Y).

q1(X, Y) :-
	p(X, Z),
	q1(Z, Y).

q2(X, Y) :-
	p(X, Z),
	q2(Z, Y).

q2(X, Y) :-
	p(X, Y).

q3(X, Y) :-
	p(X, Y).

q3(X, Y) :-
	q3(X, Z),
	p(Z, Y).

q4(X, Y) :-
	q4(X, Z),
	p(Z, Y).

q4(X, Y) :-
	p(X, Y).

p(tom, bob).
p(tom, liz).
p(bob, ann).
p(bob, pat).
p(pat, jim).

% Using answer trees please show how Prolog answers to the following questions: ?-qi(tom,pat). and ?-qi(liz,jim) for i = 1, ... 4.
