import royal_family_facts.pl

father(X, Y) :- husband(X, Z), mother(Z, Y).
child(X, Y) :- mother(Y, X).
child(X, Y) :- father(Y, X).