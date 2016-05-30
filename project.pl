tour([  stand(tuesday,   P1, N1, F1),
        stand(wednesday, P2, N2, F2),
        stand(thursday,  P3, N3, F3),
        stand(friday,    P4, N4, F4) ]) :-  place(P1),      place(P2),      place(P3),      place(P4),
                                            name(N1),       name(N2),       name(N3),       name(N4),
                                            flavour(F1),    flavour(F2),    flavour(F3),    flavour(F4),
                                            stand(tuesday,   P1, N1, F1),
                                            stand(wednesday, P2, N2, F2),
                                            stand(thursday,  P3, N3, F3),
                                            stand(friday,    P4, N4, F4),
                                            before(stand(tuesday,   P1, N1, F1), stand(wednesday, P2, N2, F2)),
                                            before(stand(wednesday, P2, N2, F2), stand(thursday, P3, N3, F3)),
                                            before(stand(thursday,  P3, N3, F3), stand(friday, P4, N4, F4)),
                                            not(P1==P2),
                                            not(P2==P3),
                                            not(P3==P4),
                                            not(P4==P1),
                                            not(P1==P3),
                                            not(P2==P4),
                                            not(N1==N2),
                                            not(N2==N3),
                                            not(N3==N4),
                                            not(N4==N1),
                                            not(N1==N3),
                                            not(N2==N4),
                                            not(F1==F2),
                                            not(F2==F3),
                                            not(F3==F4),
                                            not(F4==F1),
                                            not(F1==F3),
                                            not(F2==F4).
        
% stand(Day, Place, Name, Flavour)
% Day:      { tuesday,      wednesday,      thursday,       friday          }
% Place:    { rockland,     granite,        marsh,          boulder         }
% Name:     { sally,        tom,            alice,          gary            }
% Flavour:  { peppermint,   chocolatechip,  coffeebean,     peanutbutter    }

day(tuesday).
day(wednesday).
day(thursday).
day(friday).

place(rockland).
place(granite).
place(marsh).
place(boulder).

name(sally).
name(tom).
name(alice).
name(gary).

flavour(peppermint).
flavour(chocolatechip).
flavour(coffeebean).
flavour(peanutbutter).

% Sally’s Ice Cream wasn’t in Rockland. Sherry didn’t get peppermint stick
% ice cream on Thursday night.
stand(_,        rockland,   sally,  _         ) :- fail.
stand(thursday, _,          _,      peppermint) :- fail.

% Sherry stopped at the ice cream stand in Granite on the day before she
% got the chocolate chip ice cream and the day after she stopped at Gary’s
% Ice Cream.
before(stand(A, granite, _, _), stand(B, _, _,      chocolatechip)) :- not(before(A, B)), !, fail.
before(stand(A, granite, _, _), stand(B, _, gary,   _            )) :- not(before(B, A)), !, fail.

% She got coffee bean ice cream on Wednesday, but not at Alice’s Ice Cream
stand(wednesday,    _, alice,   _         ) :- fail.
stand(_,            _, alice,   coffeebean) :- fail.
stand(wednesday,    _, _,       coffeebean) .

% She stopped at the stand in Marsh the day before she stopped at Sally’s
% Ice Cream
before(stand(A, marsh, _, _), stand(B, _, sally, _)) :- not(before(A, B)), !, fail.
        
% At Tom’s Ice Cream she got peanut butter ice cream but not on Tuesday
stand(tuesday,  _, tom, _           )   :- fail.
stand(tuesday,  _, _,   peanutbutter)   :- fail.
stand(_,        _, tom, peanutbutter)   .

% The ice she got in Boulder was gorgeous as well...
stand(_, boulder, _, _).

before(stand(A, B, C, D), stand(E, F, G, H)) :- before(A, E).

before(tuesday,     wednesday   ).
before(wednesday,   thursday    ).
before(thursday,    friday      ).