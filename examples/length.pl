:- use_module('../metagol').

%% tell Metagol to use the BK
prim(cons/2).
prim(value/2).
prim(succ/2).
prim(zero/1).
prim(empty/1).

%% metarules
metarule([P,Q,R],([P,A,B]:-[[Q,A],[R,B]])).
metarule([P,Q,R],([P,A,B]:-[[Q,A,C],[R,C,B]])).

%% background knowledge
zero(0).
empty([]).
cons([1,2,3],[2,3]).
cons([2,3],[3]).
cons([3],[]).
value([1,2,3],1).
value([2,3],2).
value([3],3).

target(X, Y) :- empty(X), zero(Y).
target(X, Y) :- cons(X, Z), pred1(Z, Y).
pred1(X, Y) :- target(X, Z), succ(Z, Y).

a :-
 Pos = [
    target([1,2,3],3),
    target([2,3],2),
    target([3],1),
    target([],0)
  ],
  Neg = [
    target([1,2,3],1),
    target([1,2,3],2),
    target([1,2,3],4),
    target([2,3],1),
    target([2,3],3),
    target([3],2)
  ],
  learn(Pos,Neg).