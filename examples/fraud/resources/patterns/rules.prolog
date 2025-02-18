% Rules defining high amount transactions

happensAt(large_transfer(User), T) :-
    happensAt(transfer(User, OldBal, Amount, NewBal), T),
    Amount > 3000.

happensAt(large_deposit(User), T) :-
    happensAt(cashIn(User, OldBal, Amount, NewBal), T),
    Amount > 3000.

happensAt(large_withdrawal(User), T) :-
    happensAt(cashOut(User, OldBal, Amount, NewBal), T),
    Amount > 3000.

happensAt(large_payment(User), T) :-
    happensAt(payment(User, OldBal, Amount, NewBal), T),
    Amount > 3000.

% Grounding input
grounding(transfer(User, OldBal, Amount, NewBal)) :-
    user(User).

grounding(cashIn(User, OldBal, Amount, NewBal)) :-
    user(User).

grounding(cashOut(User, OldBal, Amount, NewBal)) :-
    user(User).

grounding(payment(User, OldBal, Amount, NewBal)) :-
    user(User).

% Grounding output

grounding(large_transfer(User)) :-
    user(User).

grounding(large_deposit(User)) :-
    user(User).

grounding(large_withdrawal(User)) :-
    user(User).

grounding(large_payment(User)) :-
    user(User).

cachingOrder2(User, large_transfer(User)) :-
    user(User).

cachingOrder2(User, large_deposit(User)) :-
    user(User).


cachingOrder2(User, large_withdrawal(User)) :-
    user(User).


cachingOrder2(User, large_payment(User)) :-
    user(User).