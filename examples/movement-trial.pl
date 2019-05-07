:- use_module('../metagol').

%% tell Metagol to use the BK
prim(succ/2).
prim(eq/2). % arithmetic equal to
prim(right/1).
prim(left/1).
prim(up/1).
prim(down/1).

%% metarules
metarule([P,Q,R],([P,A,B,C]:-[[Q,A],[R,B],[S,C,E]])).
%metarule([P,Q,R],([P,A,B,C,D,E]:-[[Q,A],[R,D],[S,C,E]])).
%metarule([P,Q,R],([P,A,B,C,D,E]:-[[Q,A],[R,B],[S,E,C]])).
%metarule([P,Q,R],([P,A,B,C,D,E]:-[[Q,A],[R,D],[S,E,C]])).

%% background knowledge
right(right). % (X,Y) -> (X,Y+1)
down(down).   % (X,Y) -> (X-1,Y)
up(up).       % (X,Y) -> (X+1,Y)
left(left).   % (X,Y) -> (X,Y-1)
eq(X,Y) :- X =:= Y.

a :-
 Pos = [
    target(right,at(0,0),at(0,1)),
    target(right,at(3,4),at(3,5)),
    target(right,at(1,2),at(1,3)),
    target(right,at(4,7),at(4,8))
  ],
  Neg = [
  ],
  learn(Pos,Neg).

b :-
 Pos = [
    target(left,0,1,0,0),
    target(left,3,5,3,4),
    target(left,1,3,1,2),
    target(left,4,8,4,7)
  ],
  Neg = [
  ],
  learn(Pos,Neg).

c :-
 Pos = [
    target(up,0,0,1,0),
    target(up,4,3,5,3),
    target(up,2,1,3,1),
    target(up,7,4,8,4)
  ],
  Neg = [
  ],
  learn(Pos,Neg).

d :-
 Pos = [
    target(down,1,0,0,0),
    target(down,5,3,4,3),
    target(down,3,1,2,1),
    target(down,8,4,7,4)
  ],
  Neg = [
  ],
  learn(Pos,Neg).