% Please define a predicate permutation(L1,L2), which is fulfilled if the list L2 is a permuation of L1.
% (Using ";" it should be possible to enumerate all permutations of L1.)


delete_element_from_list_once(ELEMENT, [ELEMENT|LIST_TAIL], LIST_TAIL).

delete_element_from_list_once(ELEMENT, [LIST_HEAD|LIST_TAIL], [LIST_HEAD|LIST_TAIL_WITHOUT_ELEMENT]) :-
	delete_element_from_list_once(ELEMENT, LIST_TAIL, LIST_TAIL_WITHOUT_ELEMENT).

permutation([],[]).

permutation(L1, L2) :-
	delete_element_from_list_once(SOME_ELEMENT, L1, L1_WITHOUT_SOME_ELEMENT),
	permutation(L1_WITHOUT_SOME_ELEMENT, L2_WITHOUT_SOME_ELEMENT),
	append([SOME_ELEMENT], L2_WITHOUT_SOME_ELEMENT, L2).
