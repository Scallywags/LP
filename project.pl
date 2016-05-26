goal([  stand(tuesday,   _, _, _),
        stand(wednesday, _, _, _),
        stand(thursday,  _, _, _),
        stand(friday,    _, _, _) ]).
        
% stand(Day, Place, Name, Flavour)
% Day:      { tuesday,      wednesday,      thursday,       friday          }
% Place:    { rockland,     granite,        marsh,          boulder         }
% Name:     { sally,        tom,            alice,          gary            }
% Flavour:  { peppermint,   chocolatechip,  coffeebean,     peanutbutter    }



% Sally’s Ice Cream wasn’t in Rockland. Sherry didn’t get peppermint stick
% ice cream on Thursday night.
stand(_,        rockland,   sally,  _         ) :- fail.
stand(thursday, _,          _,      peppermint) :- fail.

% Sherry stopped at the ice cream stand in Granite on the day before she
% got the chocolate chip ice cream and the day after she stopped at Gary’s
% Ice Cream.
before(stand(A, granite, _, _), stand(B, _, _,      chocolatechip)) :- before(A, B).
before(stand(A, granite, _, _), stand(B, _, gary,   _            )) :- before(B, A).

% She got coffee bean ice cream on Wednesday, but not at Alice’s Ice Cream
stand(wednesday,    _, alice,   _         ) :- fail.
stand(_,            _, alice,   coffeebean) :- fail.
stand(wednesday,    _, _,       coffeebean) .

% She stopped at the stand in Marsh the day before she stopped at Sally’s
% Ice Cream
before(stand(A, marsh, _, _), stand(B, _, sally, _)) :- before(A, B).
        
% At Tom’s Ice Cream she got peanut butter ice cream but not on Tuesday
stand(tuesday,  _, tom, _           )   :- fail.
stand(tuesday,  _, _,   peanutbutter)   :- fail.
stand(_,        _, tom, peanutbutter)   .

% The ice she got in Boulder was gorgeous as well...
stand(_, boulder, _, _).


before(tuesday,     wednesday   ).
before(wednesday,   thursday    ).
before(thursday,    friday      ).