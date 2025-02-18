parent(tom, bob).
parent(tom, john).
parent(bob, jim).
parent(bob, kim).
parent(jim, pat).
children(tom, [bob, john]).
male(tom).
male(bob).
male(jim).
male(john).

female(kim).
female(pat).

father(X, Y) :-
    male(X),
    parent(X, Y).

mother(X, Y) :-
    female(X),
    parent(X, Y).

is_father(X) :-
    father(X, _).

ancestor(X, Y) :-
	parent(X, Y).

ancestor(X, Y) :-
	parent(X, Z),
	ancestor(Z, Y).