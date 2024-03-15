
% A binary tree T is either empty - represented by the term nil - or consists of an element X (the root element) and two subtrees L and P - represented by the term node(X,L,P).
% Please define the following predicates for binary trees.

% size(T,N), which is fulfilled if N is the number of elements of tree D.
size(nil, 0).

size(node(_, L, P), N) :-
	size(L, L_SIZE),
	size(P, P_SIZE),
	N is L_SIZE + P_SIZE + 1.

% search(T,X), which is fulfilled if X appears in tree T.
search(node(X, _, _), X).

search(node(_, L, P), X) :-
	(
		search(L, X);
		search(P, X)
	).

% max(T,X), which is fulfilled if X is the largest element of tree T.
max_element_of_list([ELEMENT], ELEMENT).

max_element_of_list([FIRST_ELEMENT|REST_ELEMENTS], MAX_ELEMENT) :-
	max_element_of_list(REST_ELEMENTS, MAX_REST_ELEMENT),
	(
		(
			FIRST_ELEMENT > MAX_REST_ELEMENT,
			MAX_ELEMENT = FIRST_ELEMENT
		);
		(
			FIRST_ELEMENT =< MAX_REST_ELEMENT,
			MAX_ELEMENT = MAX_REST_ELEMENT
		)
	).

max(node(ELEMENT, nil, nil), ELEMENT).

max(node(ELEMENT, node(L_ELEMENT, L_L, L_P), nil), MAX_ELEMENT) :-
	max(node(L_ELEMENT, L_L, L_P), MAX_L_ELEMENT),
	max_element_of_list([ELEMENT, MAX_L_ELEMENT], MAX_ELEMENT).

max(node(ELEMENT, nil, node(P_ELEMENT, P_L, P_P)), MAX_ELEMENT) :-
	max(node(P_ELEMENT, P_L, P_P), MAX_P_ELEMENT),
	max_element_of_list([ELEMENT, MAX_P_ELEMENT], MAX_ELEMENT).

max(node(ELEMENT, node(L_ELEMENT, L_L, L_P), node(P_ELEMENT, P_L, P_P)), MAX_ELEMENT) :-
	max(node(L_ELEMENT, L_L, L_P), MAX_L_ELEMENT),
	max(node(P_ELEMENT, P_L, P_P), MAX_P_ELEMENT),
	max_element_of_list([ELEMENT, MAX_L_ELEMENT, MAX_P_ELEMENT], MAX_ELEMENT).

% times(N,T1,T2), which is fulfilled if D2 is the tree D1 in which each element has been multiplied with N.
times(_, nil, nil).

times(N, node(ELEMENT, LEFT_SUBTREE, RIGHT_SUBTREE), node(MULTIPLIED_ELEMENT, MULTIPLIED_LEFT_SUBTREE, MULTIPLIED_RIGHT_SUBTREE)) :-
	MULTIPLIED_ELEMENT is N * ELEMENT,
	times(N, LEFT_SUBTREE, MULTIPLIED_LEFT_SUBTREE),
	times(N, RIGHT_SUBTREE, MULTIPLIED_RIGHT_SUBTREE).

% preorder(T,L), which is fulfilled if L is the list of D's elements in preorder.
preorder(nil, []).

preorder(node(ELEMENT, LEFT_SUBTREE, RIGHT_SUBTREE), [ELEMENT|REST_ELEMENTS]) :-
	preorder(LEFT_SUBTREE, LEFT_ELEMENTS),
	preorder(RIGHT_SUBTREE, RIGHT_ELEMENTS),
	append(LEFT_ELEMENTS, RIGHT_ELEMENTS, REST_ELEMENTS).
