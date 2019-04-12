:- use_module('../metagol').

%% tell Metagol to use the BK
prim(edge/2).

%% metarules
metarule([P,Q],([P,A,B]:-[[Q,A,B]])).
metarule([P,Q],([P,A,B]:-[[Q,B,A]])).

%% background knowledge
edge(a,b).
edge(b,d).
edge(c,c).

% second BK
% edge(a,b).
% edge(c,d).

a :-
 Pos = [
    target(a,b), 
    target(b,a), 
    target(b,d), 
    target(d,b), 
    target(c,c)
  ],
  Neg = [
  ],
  learn(Pos,Neg).

b :-
 Pos = [
    target(a,b), 
    target(b,a), 
    target(c,d), 
    target(d,c)
  ],
  Neg = [
  ],
  learn(Pos,Neg).