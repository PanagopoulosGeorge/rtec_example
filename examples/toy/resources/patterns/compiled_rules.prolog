initiatedAt(rich(_2002)=true, _2018, _1972, _2024) :-
     happensAtIE(win_lottery(_2002),_1972),
     _2018=<_1972,
     _1972<_2024.

initiatedAt(location(_2002)=_1978, _2020, _1972, _2026) :-
     happensAtIE(go_to(_2002,_1978),_1972),
     _2020=<_1972,
     _1972<_2026.

terminatedAt(rich(_2002)=true, _2018, _1972, _2024) :-
     happensAtIE(lose_wallet(_2002),_1972),
     _2018=<_1972,
     _1972<_2024.

holdsForSDFluent(happy(_2002)=true,_1972) :-
     holdsForProcessedSimpleFluent(_2002,rich(_2002)=true,_2018),
     holdsForProcessedSimpleFluent(_2002,location(_2002)=pub,_2034),
     union_all([_2018,_2034],_1972).

grounding(go_to(_2286,_2288)) :- 
     person(_2286),place(_2288).

grounding(lose_wallet(_2286)) :- 
     person(_2286).

grounding(win_lottery(_2286)) :- 
     person(_2286).

grounding(location(_2292)=pub) :- 
     person(_2292).

grounding(location(_2292)=home) :- 
     person(_2292).

grounding(location(_2292)=work) :- 
     person(_2292).

grounding(rich(_2292)=true) :- 
     person(_2292).

grounding(happy(_2292)=true) :- 
     person(_2292).

inputEntity(win_lottery(_2026)).
inputEntity(go_to(_2026,_2028)).
inputEntity(lose_wallet(_2026)).

outputEntity(rich(_2106)=true).
outputEntity(location(_2106)=pub).
outputEntity(location(_2106)=home).
outputEntity(location(_2106)=work).
outputEntity(happy(_2106)=true).

event(win_lottery(_2186)).
event(go_to(_2186,_2188)).
event(lose_wallet(_2186)).

simpleFluent(rich(_2266)=true).
simpleFluent(location(_2266)=pub).
simpleFluent(location(_2266)=home).
simpleFluent(location(_2266)=work).


sDFluent(happy(_2402)=true).

index(go_to(_2462,_2410),_2410).
index(win_lottery(_2410),_2410).
index(lose_wallet(_2410),_2410).
index(rich(_2410)=true,_2410).
index(location(_2410)=pub,_2410).
index(location(_2410)=home,_2410).
index(location(_2410)=work,_2410).
index(happy(_2410)=true,_2410).


cachingOrder2(_2746, rich(_2746)=true) :- % level in dependency graph: 1, processing order in component: 1
     person(_2746).

cachingOrder2(_2692, location(_2692)=work) :- % level in dependency graph: 1, processing order in component: 1
     person(_2692).

cachingOrder2(_2708, location(_2708)=home) :- % level in dependency graph: 1, processing order in component: 2
     person(_2708).

cachingOrder2(_2724, location(_2724)=pub) :- % level in dependency graph: 1, processing order in component: 3
     person(_2724).

cachingOrder2(_3096, happy(_3096)=true) :- % level in dependency graph: 2, processing order in component: 1
     person(_3096).

