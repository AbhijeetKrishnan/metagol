:- use_module('../metagol').

%% tell Metagol to use the BK
body_pred(cons/2).
body_pred(value/2).

%% metarules
metarule([P,Q], [P,A,B], [[Q,B,A]]).
metarule([P,Q], [P,A,B], [[Q,B,C],[P,A,C]]).

%% background knowledge
cons([4,3,2,1],[3,2,1]).
cons([3,2,1],[2,1]).
cons([2,1],[1]).
cons([1],0).
cons([2,3,2,4],[3,2,4]).
cons([3,2,4],[2,4]).
cons([2,4],[4]).
cons([4],0).

value([4,3,2,1],4).
value([3,2,1],3).
value([2,1],2).
value([1],1).
value([2,3,2,4],2).
value([3,2,4],3).
value([2,4],2).
value([4],4).

:-
 Pos = [
    target(4,[4,3,2,1]),
    target(3,[4,3,2,1]),
    target(2,[4,3,2,1]),
    target(1,[4,3,2,1]),
    target(3,[3,2,1]),
    target(2,[3,2,1]),
    target(1,[3,2,1]),
    target(2,[2,1]),
    target(1,[2,1]),
    target(1,[1])
  ],
  Neg = [
    target(5,[4,3,2,1]),
    target(6,[4,3,2,1]),
    target(7,[4,3,2,1]),
    target(8,[4,3,2,1]),
    target(4,[3,2,1]),
    target(5,[3,2,1]),
    target(6,[3,2,1]),
    target(3,[2,1]),
    target(4,[2,1]),
    target(2,[1])
  ],
  learn(Pos,Neg).

b :-
  Pos = [
    target(2,[2,3,2,4]),
    target(3,[2,3,2,4]),
    target(4,[2,3,2,4]),
    target(3,[3,2,4]),
    target(2,[3,2,4]),
    target(4,[3,2,4]),
    target(2,[2,4]),
    target(4,[2,4]),
    target(4,[4])
  ],
  Neg = [
    target(1,[2,3,2,4]),
    target(5,[2,3,2,4]),
    target(6,[2,3,2,4]),
    target(7,[2,3,2,4]),
    target(1,[3,2,4]),
    target(5,[3,2,4]),
    target(6,[3,2,4]),
    target(1,[2,4]),
    target(3,[2,4]),
    target(1,[4])
  ],
  learn(Pos,Neg).