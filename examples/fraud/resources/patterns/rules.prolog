% Rules defining high amount transactions

happensAt(large_transfer(User), T) :-
    happensAt(transfer(User, OldBal, Amount, NewBal), T),
    % Amount > 3000.
    threshold(Amount, Threshold).

happensAt(large_deposit(User), T) :-
    happensAt(cashIn(User, OldBal, Amount, NewBal), T),
    Amount > 3000.

% Grounding input
grounding(transfer(User, OldBal, Amount, NewBal)) :-
    user(User).

grounding(cashIn(User, OldBal, Amount, NewBal)) :-
    user(User).

% Grounding output

grounding(large_transfer(User)) :-
    user(User).

grounding(large_deposit(User)) :-
    user(User).