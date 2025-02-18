happensAtEv(large_deposit(_96),_78) :-
     happensAtIE(cashIn(_96,_102,_104,_106),_78),
     _104>3000.

happensAtEv(large_withdrawal(_96),_78) :-
     happensAtIE(cashOut(_96,_102,_104,_106),_78),
     _104>3000.

happensAtEv(large_payment(_96),_78) :-
     happensAtIE(payment(_96,_102,_104,_106),_78),
     _104>3000.

cachingOrder2(_280,large_deposit(_280)) :- 
     user(_280).

cachingOrder2(_280,large_withdrawal(_280)) :- 
     user(_280).

cachingOrder2(_280,large_payment(_280)) :- 
     user(_280).

grounding(transfer(_356,_358,_360,_362)) :- 
     user(_356).

grounding(cashIn(_356,_358,_360,_362)) :- 
     user(_356).

grounding(cashOut(_356,_358,_360,_362)) :- 
     user(_356).

grounding(payment(_356,_358,_360,_362)) :- 
     user(_356).

grounding(large_transfer(_356)) :- 
     user(_356).

grounding(large_deposit(_356)) :- 
     user(_356).

grounding(large_withdrawal(_356)) :- 
     user(_356).

grounding(large_payment(_356)) :- 
     user(_356).

inputEntity(cashIn(_132,_134,_136,_138)).
inputEntity(cashOut(_132,_134,_136,_138)).
inputEntity(payment(_132,_134,_136,_138)).
inputEntity(transfer(_132,_134,_136,_138)).
inputEntity(large_transfer(_132)).

outputEntity(large_deposit(_218)).
outputEntity(large_withdrawal(_218)).
outputEntity(large_payment(_218)).

event(large_deposit(_292)).
event(large_withdrawal(_292)).
event(large_payment(_292)).
event(cashIn(_292,_294,_296,_298)).
event(cashOut(_292,_294,_296,_298)).
event(payment(_292,_294,_296,_298)).
event(transfer(_292,_294,_296,_298)).
event(large_transfer(_292)).




index(large_deposit(_516),_516).
index(large_withdrawal(_516),_516).
index(large_payment(_516),_516).
index(cashIn(_516,_570,_572,_574),_516).
index(cashOut(_516,_570,_572,_574),_516).
index(payment(_516,_570,_572,_574),_516).
index(transfer(_516,_570,_572,_574),_516).
index(large_transfer(_516),_516).


