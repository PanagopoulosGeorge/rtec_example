initiatedAt(large_transfer(_17288)=true, _17322, _17258, _17328) :-
     happensAtIE(transfer(_17288,_17294,_17296,_17298),_17258),_17322=<_17258,_17258<_17328,
     _17296>3000.

initiatedAt(large_transfer(_17288)=true, _17322, _17258, _17328) :-
     happensAtIE(transfer(_17288,_17294,_17296,_17298),_17258),_17322=<_17258,_17258<_17328,
     _17296< -3000.

initiatedAt(cashStructuring(_17288)=true, _17382, _17258, _17388) :-
     happensAtIE(transfer(_17288,_17294,_17296,_17298),_17304),_17382=<_17304,_17304<_17388,
     findall(_17296,(happensAtIE(transfer(_17288,_17322,_17296,_17326),_17316),_17304-_17316=<7),_17346),
     total_amount(_17346,_17352),
     _17352>5000.

happensAtEv(large_deposit(_17276),_17258) :-
     happensAtIE(cashIn(_17276,_17282,_17284,_17286),_17258),
     abs(_17284,_17298),
     _17298>3000.

happensAtEv(large_withdrawal(_17276),_17258) :-
     happensAtIE(cashOut(_17276,_17282,_17284,_17286),_17258),
     abs(_17284,_17298),
     _17298>3000.

happensAtEv(large_payment(_17276),_17258) :-
     happensAtIE(payment(_17276,_17282,_17284,_17286),_17258),
     abs(_17284,_17298),
     _17298>3000.

fi(large_transfer(_17292)=true,large_transfer(_17292)=false,2):-
     grounding(large_transfer(_17292)=true),
     grounding(large_transfer(_17292)=false).

fi(cashStructuring(_17292)=true,cashStructuring(_17292)=false,7):-
     grounding(cashStructuring(_17292)=true),
     grounding(cashStructuring(_17292)=false).

cachingOrder2(_17460,large_transfer(_17460)) :- 
     user(_17460).

cachingOrder2(_17460,large_deposit(_17460)) :- 
     user(_17460).

cachingOrder2(_17460,large_withdrawal(_17460)) :- 
     user(_17460).

cachingOrder2(_17460,large_payment(_17460)) :- 
     user(_17460).

cachingOrder2(_17460,cashStructuring(_17460)) :- 
     user(_17460).

grounding(transfer(_17608,_17610,_17612,_17614)) :- 
     user(_17608).

grounding(cashIn(_17608,_17610,_17612,_17614)) :- 
     user(_17608).

grounding(cashOut(_17608,_17610,_17612,_17614)) :- 
     user(_17608).

grounding(payment(_17608,_17610,_17612,_17614)) :- 
     user(_17608).

grounding(large_deposit(_17608)) :- 
     user(_17608).

grounding(large_withdrawal(_17608)) :- 
     user(_17608).

grounding(large_payment(_17608)) :- 
     user(_17608).

grounding(large_transfer(_17614)=true) :- 
     user(_17614).

grounding(large_transfer(_17614)=false) :- 
     user(_17614).

grounding(cashStructuring(_17614)=true) :- 
     user(_17614).

grounding(cashStructuring(_17614)=false) :- 
     user(_17614).

total_amount([],0).

total_amount([_17616|_17618],_17514) :- 
     total_amount(_17618,_17624),_17514 is _17624+_17616.

p(large_transfer(_17608)=true).

p(cashStructuring(_17608)=true).

inputEntity(transfer(_17312,_17314,_17316,_17318)).
inputEntity(cashIn(_17312,_17314,_17316,_17318)).
inputEntity(cashOut(_17312,_17314,_17316,_17318)).
inputEntity(payment(_17312,_17314,_17316,_17318)).

outputEntity(large_transfer(_17398)=true).
outputEntity(cashStructuring(_17398)=true).
outputEntity(large_transfer(_17398)=false).
outputEntity(cashStructuring(_17398)=false).
outputEntity(large_deposit(_17392)).
outputEntity(large_withdrawal(_17392)).
outputEntity(large_payment(_17392)).

event(large_deposit(_17490)).
event(large_withdrawal(_17490)).
event(large_payment(_17490)).
event(transfer(_17490,_17492,_17494,_17496)).
event(cashIn(_17490,_17492,_17494,_17496)).
event(cashOut(_17490,_17492,_17494,_17496)).
event(payment(_17490,_17492,_17494,_17496)).

simpleFluent(large_transfer(_17594)=true).
simpleFluent(cashStructuring(_17594)=true).
simpleFluent(large_transfer(_17594)=false).
simpleFluent(cashStructuring(_17594)=false).



index(large_deposit(_17732),_17732).
index(large_withdrawal(_17732),_17732).
index(large_payment(_17732),_17732).
index(transfer(_17732,_17786,_17788,_17790),_17732).
index(cashIn(_17732,_17786,_17788,_17790),_17732).
index(cashOut(_17732,_17786,_17788,_17790),_17732).
index(payment(_17732,_17786,_17788,_17790),_17732).
index(large_transfer(_17732)=true,_17732).
index(cashStructuring(_17732)=true,_17732).
index(large_transfer(_17732)=false,_17732).
index(cashStructuring(_17732)=false,_17732).


cachingOrder2(_18070, large_transfer(_18070)=true) :- % level in dependency graph: 1, processing order in component: 1
     user(_18070).

cachingOrder2(_18070, large_transfer(_18070)=false) :- % level in dependency graph: 1, processing order in component: 2
     user(_18070).

cachingOrder2(_18032, cashStructuring(_18032)=true) :- % level in dependency graph: 1, processing order in component: 1
     user(_18032).

cachingOrder2(_18032, cashStructuring(_18032)=false) :- % level in dependency graph: 1, processing order in component: 2
     user(_18032).

