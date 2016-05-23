goal(state(_, _, _, has)).

init(state(atdoor, onfloor, atwindow, hasnot)).

move(state(middle, onbox, middle, hasnot), grasp, state(middle, onbox, middle, has)).
move(state(Pos, onfloor, Pos, Has), climb, state(Pos, onbox, Pos, Has)).
move(state(Pos1, onfloor, Pos1, Has), push, state(Pos2, onfloor, Pos2, Has)).
move(state(Pos1, onfloor, P, Has), walk, state(Pos2, onfloor, P, Has)).

solve(X) :- goal(X).
solve(X) :- move(X, _, Y) , solve(Y).

solve(X, []) :- goal(X).
solve(X, [Move|T]) :- move(X, Move, Y), solve(Y, T).