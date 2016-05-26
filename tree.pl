% 1

isTree(nil).
isTree(t(L, _, R))	:- isTree(L), isTree(R).

max(t(nil, X, nil), X).
max(t(_, _, R), Y)	:- max(R, Y).

min(t(nil, X, nil), X).
min(t(L, _, _), Y)	:- min(L, Y).

isSorted(nil).
isSorted(t(nil, X, nil)).
isSorted(t(nil, X, t(RL, B, RR))	:- isSorted(t(RL, B, RR)), X < B.
isSorted(t(t(LL, A, LR), X, nil))	:- isSorted(t(LL, A, LR)), A =< X.
isSorted(t(t(LL, A, LR), X, t(RL, B, RR)))	:- isSorted(t(LL, A, LR)), isSorted(t(RL, B, RR)), A =< X, X < B.

find(nil, _, _)	:- fail.
find(t(L, N, R), N, t(L, N, R)).
find(t(L, X, R), N, S)	:- N < X, find(L, N, S), !.
find(t(L, X, R), N, S)	:- find(R, N, S).

insert(nil, N, t(nil, N, nil)).
insert(t(L, X, R), N, t(S, X, R))	:- N =< X, insert(L, N, S), !.
insert(t(L, X, R), N, t(L, X, S))	:- insert(R, N, S).

deleteOne(t(nil, N, nil), N, nil).
deleteOne(t(nil, N, R), N, R).
deleteOne(t(L, N, nil), N, L).
deleteOne(t(L, N, R), N, t(LminMax, Max, R))	:- !, max(L, Max), deleteOne(L, Max, LminMax).
deleteOne(t(L, X, R), N, t(S, X, R) :- N < X, deleteOne(L, N, S), !.
deleteOne(t(L, X, R), N, t(L, X, S) :- deleteOne(R, N, S).

deleteAll(T, N, S).