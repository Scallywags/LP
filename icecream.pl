% LP Project Jeroen Weener, Jan Boerman

% stand(day, place, owner, flavour)

go(X)   :-  % the structure of the list
            X=[ stand(tuesday, _, _, _),
                stand(wednesday, _, _, _),
                stand(thursday, _, _, _),
                stand(friday, _, _, _)  ],

            /*
                  Most of these clauses are unnecessary since they can
                  be derived implicitly from the other rules by Prolog.

                  However, we decided to add them since these 
                  facts are given implicitly in the assignment.
                  Prolog can use them if it needs to,
                  though it may not need all of them.
            */
            member(stand(_, rockland, _, _), X),
            member(stand(_, granite, _, _), X),
            member(stand(_, marsh, _, _), X),
            member(stand(_, boulder, _, _), X),

            member(stand(_, _, tom, _), X),
            member(stand(_, _, sally, _), X),
            member(stand(_, _, alice, _), X),
            member(stand(_, _, gary, _), X),

            member(stand(_, _, _, peanutbutter), X),
            member(stand(_, _, _, peppermint), X),
            member(stand(_, _, _, chocolatechip), X),
            member(stand(_, _, _, coffeebean), X),


            % 1.  Sally’s Ice Cream wasn’t in Rockland. Sherry didn’t get peppermint stick
            %     ice cream on Thursday night.
            not(member(stand(_, rockland, sally, _), X)),
            not(member(stand(thursday, _, _, peppermint), X)),


            % 2.  Sherry stopped at the ice cream stand in Granite on the day before she
            %     got the chocolate chip ice cream and the day after she stopped at Gary’s
            %     Ice Cream.
            member(GaryStand, X),
            GaryStand = stand(_, _, gary, _),
            member(GraniteStand, X),
            GraniteStand = stand(_, granite, _, _),
            member(ChocolateChipStand, X),
            ChocolateChipStand = stand(_, _, _, chocolatechip),

            beforeStand(GaryStand, GraniteStand),
            beforeStand(GraniteStand, ChocolateChipStand),


            % 3.  At Tom’s Ice Cream she got peanut butter ice cream but not on Tuesday.
            member(stand(_, _, tom, peanutbutter), X),
            not(member(stand(tuesday, _, tom, peanutbutter), X)),

        
            % 4.  She got coffeebean icecream on Wednesday, but not at Alice’s IceCream.
            member(stand(wednesday, _, _, coffeebean), X),
            not(member(stand(wednesday, _, alice, coffeebean), X)),


            % 5.  She stopped at the stand in Marsh the day before she stopped at Sally’s
            %     Ice Cream.
            member(MarshStand, X),
            MarshStand = stand(_, marsh, _, _),
            member(SallyStand, X),
            SallyStand = stand(_, _, sally, _),

            beforeStand(MarshStand, SallyStand),


            % 6.  The ice she got in Boulder was gorgeous as well...
            member(stand(_, boulder, _, _), X).


beforeStand(stand(A, _, _, _), stand(B, _, _, _))   :- before(A, B).

before(tuesday, wednesday).
before(wednesday, thursday).
before(thursday, friday).