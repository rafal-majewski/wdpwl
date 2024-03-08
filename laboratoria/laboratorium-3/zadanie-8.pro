% Please define the following predicates for lists.

% last(X,L), which is fulfilled if X is the last element of L.

last(X, [X]).

last(X, [_|REST_L]) :-
	last(X, REST_L).

% delete(X,L1,L2), which is fulfilled if L2 is the list L1 without the element X.

delete(_, [], []).

delete(X, [X|REST_L1], REST_L2) :-
	delete(X, REST_L1, REST_L2).

delete(X, [Y|REST_L1], [Y|REST_L2]) :-
	X \= Y,
	delete(X, REST_L1, REST_L2).

% delete(L1,L2), which is fulfilled if L2 is the list L1 without L1's last three elements.

delete(L1, L2) :-
	append(L2, [_,_,_], L1).

% reverse(L1,L2), which is fulfilled if L2 is the list L2 in reversed order.

reverse([], []).

reverse([X|REST_L1], L2) :-
	reverse(REST_L1, REST_L2),
	append(REST_L2, [X], L2).

% evenlength(L) and oddlength(L), which are fulfilled if the length of L is even and odd, respectively.

evenlength([]).

evenlength([_|REST_L]) :-
	oddlength(REST_L).

oddlength([_]).

oddlength([_|REST_L]) :-
	evenlength(REST_L).

% shift(L1,L2), which is fulfilled if L2 the list L1 after one rotation to left.
% Example:
%  ?- shift([1,2,3,4,5],L).
%  L = [2,3,4,5,1] 

shift([], []).

shift([X|REST_L1], L2) :-
	append(REST_L1, [X], L2).

% quadrat(L1,L2), which is fulfilled if L2 contains the squares of the elements of L1.
% Example:
%  ?- quadrat([1,2,3,4,5],L).
%  L = [1,4,9,16,25]

quadrat([], []).

quadrat([X|REST_L1], [Y|REST_L2]) :-
	Y is X * X,
	quadrat(REST_L1, REST_L2).

% combine(L1,L2,L3), which is fulfilled if L3 contains the pairs of the elements of L1 and L2.
% Example:
%  ?- combine([1,2,3,4],[a,b,c,d],L).
%  L = [[1,a],[2,b],[3,c],[4,d]] 

combine([], [], []).

combine([X|REST_L1], [Y|REST_L2], [[X,Y]|REST_L3]) :-
	combine(REST_L1, REST_L2, REST_L3).

% palindrom(L), which is fulfilled if L contains a palindrom.
% Examples:
%  ?- palindrom([a,b,c]).
%  no
%  ?- palindrom([a,b,c,d,c,b,a]).
%  yes

palindrom(L) :-
	reverse(L, L).

% p(X,L,Y,Z), which is fulfilled if Y is the predecessor of X in L and Z is the successor of X in L.
% Example:
%  ?- p(3,[1,2,3,4,5],Y,Z).
%  Y = 2, Z = 4

p(X, [Y, X, Z|_], Y, Z).

p(X, [_|REST_L], Y, Z) :-
	p(X, REST_L, Y, Z).

% q(X,L1,L2), which is fulfilled if L2 is the beginning of the list L1 up to the (first) double occurence of element X.
% Example:
%  ?- q(3,[1,2,3,3,1,2,4],Z).
%  Z = [1,2,3,3] 

q(X, L1, L2) :-
	append(_, [X,X], L2),
	append(L2, _, L1).
