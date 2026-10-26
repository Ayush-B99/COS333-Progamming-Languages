
% Task 2

%   + vals = same
%   - vals = abs(val)
%   zero vals = remove

% base case
absPositivesNegatives([], []).

%  zero vals = remove
absPositivesNegatives([H|T], Result) :-
    H =:= 0,
    absPositivesNegatives(T, Result).

%  + vals = same
absPositivesNegatives([H|T], [H|Result]) :-
    H > 0,
    absPositivesNegatives(T, Result).

%  - vals = abs(val)
absPositivesNegatives([H|T], [Abs|Result]) :-
    H < 0,
    Abs is -H,
    absPositivesNegatives(T, Result).
