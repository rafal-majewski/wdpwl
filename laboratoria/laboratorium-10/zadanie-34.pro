% Please realize counters in Prolog: A counter has a name and a value and should provide operations init/2, getvalue/2, incr/1, decr/1, and del/1.
% Example:
%  ?- init(z,3).
%  true
%  ?- getvalue(z,V).
%  V = 3
%  ?- incr(z), decr(z), decr(z).
%  true
%  ?- getvalue(z,V).
%  V = 2
%  ?- del(z).
%  true
%  ?- getvalue(z,V).
%  no

:- dynamic(counter/2).

init(Name, Value) :-
	asserta(counter(Name, Value)).

getvalue(Name, Value) :-
	counter(Name, Value).

incr(Name) :-
	counter(Name, CurrentValue),
	NewValue is CurrentValue + 1,
	retract(counter(Name, _)),
	asserta(counter(Name, NewValue)).

decr(Name) :-
	counter(Name, CurrentValue),
	NewValue is CurrentValue - 1,
	retract(counter(Name, _)),
	asserta(counter(Name, NewValue)).

del(Name) :-
	retract(counter(Name, _)).
