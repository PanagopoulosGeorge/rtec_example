% Rules defining high amount transactions
%% mia periodos otan kanei kapoios large transfer 
%% EPOMENOS REALISTIKOS KANONAS --> MEGALO TRANSFER KAI KAPAKI KAPOIO MEGALO WITHDRAWAL

initiatedAt(large_transfer(User) = true, T) :-
    happensAt(transfer(User, OldBal, Amount, NewBal), T),
    Amount > 3000.

initiatedAt(large_transfer(User) = true, T) :-
    happensAt(transfer(User, OldBal, Amount, NewBal), T),
    Amount < -3000.
fi(large_transfer(User)=true, large_transfer(User)=false, 2).
p(large_transfer(User)=true).

DE DOULEUEI
% ATHROISTHS SYNALLAGWN
total_amount([], 0). % TERMATIKOS

total_amount([ Amount | Rest  ], Sum) :- % ANADROMH
    total_amount(Rest, RestSum),
    Sum is RestSum + Amount.
% CASH STRUCTURING
initiatedAt(cashStructuring(User)=true, T) :-
    happensAt(transfer(User, _, Amount, _), T1),
    findall(Amount, (happensAt(transfer(User, _, Amount, _), T2), T1 - T2 =< 7), Amounts),
    total_amount(Amounts, Total),
    Total > 5000.
fi(cashStructuring(User)=true, cashStructuring(User)=false, 7).
p(cashStructuring(User)=true).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
happensAt(large_deposit(User), T) :-
    happensAt(cashIn(User, OldBal, Amount, NewBal), T),
   abs(Amount, AmountPos),
   AmountPos > 3000.

happensAt(large_withdrawal(User), T) :-
    happensAt(cashOut(User, OldBal, Amount, NewBal), T),
   abs(Amount, AmountPos),
   AmountPos > 3000.

happensAt(large_payment(User), T) :-
    happensAt(payment(User, OldBal, Amount, NewBal), T),
   abs(Amount, AmountPos),
   AmountPos > 3000.

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

grounding(large_deposit(User)) :-
    user(User).

grounding(large_withdrawal(User)) :-
    user(User).

grounding(large_payment(User)) :-
    user(User).

grounding(large_transfer(User)=true) :-
    user(User).
grounding(large_transfer(User)=false) :-
    user(User).
grounding(cashStructuring(User)=true) :-
    user(User).
grounding(cashStructuring(User)=false) :-
    user(User).
%

cachingOrder2(User, large_transfer(User)) :-
    user(User).

cachingOrder2(User, large_deposit(User)) :-
    user(User).


cachingOrder2(User, large_withdrawal(User)) :-
    user(User).


cachingOrder2(User, large_payment(User)) :-
    user(User).

cachingOrder2(User, cashStructuring(User)) :-
    user(User).