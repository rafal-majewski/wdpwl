% Suppose the following predicate f/2 is given.
f(1, one).
f(s(1), two).
f(s(s(1)), three).
f(s(s(s(X))), N) :- f(X, N). 

% How does Prolog answer to the following questions?
% f(s(1), A)?
	Call: (11) f(s(1), _20552) ? creep
	Exit: (11) f(s(1), two) ? creep
A = two.

% f(s(s(1)), two)?
	Call: (10) f(s(s(1)), two) ? creep
	Fail: (10) f(s(s(1)), two) ? creep
false.

% f(s(s(s(s(s(s(1)))))),C)?
	Call: (10) f(s(s(s(s(s(s(1)))))), _31988) ? creep
	Call: (11) f(s(s(s(1))), _31988) ? creep
	Call: (12) f(1, _31988) ? creep
	Exit: (12) f(1, one) ? creep
	Exit: (11) f(s(s(s(1))), one) ? creep
	Exit: (10) f(s(s(s(s(s(s(1)))))), one) ? creep
C = one.

% f(D,three)?
	Call: (10) f(_39236, three) ? creep
	Exit: (10) f(s(s(1)), three) ? creep
D = s(s(1)).
