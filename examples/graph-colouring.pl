:- use_module('../metagol').

%% tell Metagol to use the BK
body_pred(edge/2).
body_pred(colour/2).

%% metarules
metarule([P,Q,R], [P,A], [[Q,A,B],[R,A,B]]).
metarule([P,Q,R], [P,A,B], [[Q,A,C],[R,B,C]]).

%% background knowledge
edge(a,b).
edge(b,c).
edge(b,d).
edge(c,e).
edge(e,f).
colour(a,green).
colour(b,red).
colour(c,green).
colour(d,green).
colour(e,red).
colour(f,red).

% second BK
% edge(a,b).
% edge(b,a).
% edge(c,b).
% edge(f,c).
% edge(d,c).
% edge(e,d).
% 
% colour(a,green).
% colour(b,green).
% colour(c,red).
% colour(d,green).
% colour(e,green).
% colour(f,red).

a :-
 Pos = [
    target(e)
  ],
  Neg = [
    target(a),
    target(b),
    target(c),
    target(d),
    target(f)
  ],
  learn(Pos,Neg).

b :-
 Pos = [
    target(a),
    target(b),
    target(e),
    target(f)
  ],
  Neg = [
    target(c),
    target(d)
  ],
  learn(Pos,Neg).