% Please define a predicate latin/2, which transforms Latin numbers into arabic numbers. Latin numbers are represented by ordinary lists,
% for example [x,l,v,i,i] denotes 47. You can assume that the Latin number is correct.

latin_character_value(i, 1).

latin_character_value(v, 5).

latin_character_value(x, 10).

latin_character_value(l, 50).

latin_character_value(c, 100).

latin([], 0).

latin([LATIN_CHARACTER], VALUE) :-
	latin_character_value(LATIN_CHARACTER, VALUE).

latin([LATIN_NUMBER_HEAD_1, LATIN_NUMBER_HEAD_2 | LATIN_NUMBER_TAIL], TOTAL_VALUE) :-
	latin_character_value(LATIN_NUMBER_HEAD_1, HEAD_1_VALUE),
	latin_character_value(LATIN_NUMBER_HEAD_2, HEAD_2_VALUE),
	HEAD_1_VALUE >= HEAD_2_VALUE,
	latin([LATIN_NUMBER_HEAD_2 | LATIN_NUMBER_TAIL], TAIL_VALUE),
	TOTAL_VALUE is HEAD_1_VALUE + TAIL_VALUE.

latin([LATIN_NUMBER_HEAD_1, LATIN_NUMBER_HEAD_2 | LATIN_NUMBER_TAIL], TOTAL_VALUE) :-
	latin_character_value(LATIN_NUMBER_HEAD_1, HEAD_1_VALUE),
	latin_character_value(LATIN_NUMBER_HEAD_2, HEAD_2_VALUE),
	HEAD_1_VALUE < HEAD_2_VALUE,
	HEAD_VALUE is HEAD_2_VALUE - HEAD_1_VALUE,
	latin(LATIN_NUMBER_TAIL, TAIL_VALUE),
	TOTAL_VALUE is HEAD_VALUE + TAIL_VALUE.
