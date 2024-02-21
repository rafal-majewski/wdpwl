% Suppose predicates parent/2, female/1 i male/1 with the obvious interpretation are given.
% Please define predicates child/2, mother/2, sister/2, has_a_child/1, grandparent/2 and predecessor/2.

parent(mymom, me).

female(mymom).

male(me).

child(CHILD, PARENT) :-
	parent(PARENT, CHILD).

mother(MOTHER, CHILD) :-
	parent(MOTHER, CHILD),
	female(MOTHER).

sister(SISTER, PERSON) :-
	parent(PARENT, SISTER),
	parent(PARENT, PERSON).

has_a_child(PERSON) :-
	parent(PERSON, _).

grandparent(GRANDPARENT, GRANDCHILD) :-
	parent(GRANDPARENT, PARENT),
	parent(PARENT, GRANDCHILD).

predecessor(PREDECESSOR, SUCCESSOR) :-
	parent(PREDECESSOR, SUCCESSOR).

predecessor(PREDECESSOR, SUCCESSOR) :-
	parent(PREDECESSOR, CHILD),
	predecessor(CHILD, SUCCESSOR).
