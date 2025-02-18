happensAtEv(large_transfer(_96),_78) :-
     happensAtIE(transfer(_96,_102,_104,_106),_78),
     _104>3000.

happensAtEv(large_deposit(_96),_78) :-
     happensAtIE(cashIn(_96,_102,_104,_106),_78),
     _104>3000.

happensAtEv(large_withdrawal(_96),_78) :-
     happensAtIE(cashOut(_96,_102,_104,_106),_78),
     _104>3000.

happensAtEv(large_payment(_96),_78) :-
     happensAtIE(payment(_96,_102,_104,_106),_78),
     _104>3000.

grounding(transfer(_338,_340,_342,_344)) :- 
     user(_338).

grounding(cashIn(_338,_340,_342,_344)) :- 
     user(_338).

grounding(cashOut(_338,_340,_342,_344)) :- 
     user(_338).

grounding(payment(_338,_340,_342,_344)) :- 
     user(_338).

grounding(large_transfer(_338)) :- 
     user(_338).

grounding(large_deposit(_338)) :- 
     user(_338).

grounding(large_withdrawal(_338)) :- 
     user(_338).

grounding(large_payment(_338)) :- 
     user(_338).

inputEntity(transfer(_132,_134,_136,_138)).
inputEntity(cashIn(_132,_134,_136,_138)).
inputEntity(cashOut(_132,_134,_136,_138)).
inputEntity(payment(_132,_134,_136,_138)).

outputEntity(large_transfer(_212)).
outputEntity(large_deposit(_212)).
outputEntity(large_withdrawal(_212)).
outputEntity(large_payment(_212)).

event(large_transfer(_292)).
event(large_deposit(_292)).
event(large_withdrawal(_292)).
event(large_payment(_292)).
event(transfer(_292,_294,_296,_298)).
event(cashIn(_292,_294,_296,_298)).
event(cashOut(_292,_294,_296,_298)).
event(payment(_292,_294,_296,_298)).




index(large_transfer(_516),_516).
index(large_deposit(_516),_516).
index(large_withdrawal(_516),_516).
index(large_payment(_516),_516).
index(transfer(_516,_570,_572,_574),_516).
index(cashIn(_516,_570,_572,_574),_516).
index(cashOut(_516,_570,_572,_574),_516).
index(payment(_516,_570,_572,_574),_516).


