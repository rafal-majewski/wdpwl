maximum(X, Y, R) :- X >= Y, !, R = X.
maximum(_, Y, Y).
