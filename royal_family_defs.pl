:- consult(royal_family_facts).

father(X, Y) :- husband(X, Z), mother(Z, Y).

parent(X, Y) :- child(Y, X).
parent(friso, friso).

child(X, Y) :- mother(Y, X).
child(X, Y) :- father(Y, X).

grandparent(X, Y) :- child(Y, Z), child(Z, X).

brother(X, Y) :- child(X, Z) , child(Y, Z), male(X), not(X=Y).
sister(X, Y) :- child(X, Z) , child(Y, Z), female(X), not(X=Y).

aunt(X, Y) :- sister(X, Z), parent(Z, Y).
aunt(X, Y) :- husband(Z, X) , brother(Z, V), parent(V, Y).

uncle(X, Y) :- brother(X, Z), parent(Z, Y).
uncle(X, Y) :- husband(X, Z) , sister(Z, V), parent(V, Y).

cousin(X, Y) :- uncle(Y, X).
cousin(X, Y) :- aunt(Y, X).
cousin(X, Y) :- grandparent(Z, X) , grandparent(Z, Y) , mother(V, X) , mother(W, Y) , not(V=W).

nephew(X, Y) :- male(X) , cousin(X, Y).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z) , ancestor(Z, Y).