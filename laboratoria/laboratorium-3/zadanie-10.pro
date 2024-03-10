% Please define the following predicates for lists.

% nth(N,L,X), which is fulfilled if X is the N-th element in the list L.
nth(1, [X|_], X).

nth(N, [_|L_TAIL], X) :-
	nth(N_MINUS_1, L_TAIL, X),
	N is N_MINUS_1+1.

% ordered(L), which is fulfilled if list L is ordered.

ordered([]).

ordered([_]).

ordered([X,Y|L_TAIL]) :-
	X =< Y,
	ordered([Y|L_TAIL]).

% mergesort(L1,L2), which is fulfilled if L2 is the ordered version of the list L1. The predicate should simulate algorithm mergesort.
mergesort([], []).

mergesort([ELEMENT], [ELEMENT]).

mergesort_split([], [], []).

mergesort_split([ELEMENT], [ELEMENT], []).

mergesort_split([ELEMENT_0, ELEMENT_1|L_TAIL], [ELEMENT_0|L1_TAIL], [ELEMENT_1|L2_TAIL]) :-
	mergesort_split(L_TAIL, L1_TAIL, L2_TAIL).

mergesort_merge([], ELEMENTS, ELEMENTS).

mergesort_merge(ELEMENTS, [], ELEMENTS).

mergesort_merge([ELEMENT_1|L1_TAIL], [ELEMENT_2|L2_TAIL], [ELEMENT_1|MERGED_TAIL]) :-
	ELEMENT_1 =< ELEMENT_2,
	mergesort_merge(L1_TAIL, [ELEMENT_2|L2_TAIL], MERGED_TAIL).

mergesort_merge([ELEMENT_1|L1_TAIL], [ELEMENT_2|L2_TAIL], [ELEMENT_2|MERGED_TAIL]) :-
	ELEMENT_1 > ELEMENT_2,
	mergesort_merge([ELEMENT_1|L1_TAIL], L2_TAIL, MERGED_TAIL).

mergesort(UNSORTED_ELEMENTS, SORTED_ELEMENTS) :-
	mergesort_split(UNSORTED_ELEMENTS, UNSORTED_ELEMENTS_HALF_1, UNSORTED_ELEMENTS_HALF_2),
	mergesort(UNSORTED_ELEMENTS_HALF_1, SORTED_ELEMENTS_HALF_1),
	mergesort(UNSORTED_ELEMENTS_HALF_2, SORTED_ELEMENTS_HALF_2),
	mergesort_merge(SORTED_ELEMENTS_HALF_1, SORTED_ELEMENTS_HALF_2, SORTED_ELEMENTS).
