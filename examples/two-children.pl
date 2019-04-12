:- use_module('../metagol').

%% tell Metagol to use the BK
prim(neq/2).
prim(edge/2).

%% metarules
metarule([P,Q,R],([P,A]:-[[Q,A,B],[R,A,B]])).
metarule([P,Q,R],([P,A,B]:-[[Q,A,C],[R,B,C]])).

%% background knowledge
neq(a,b).
neq(a,c).
neq(a,d).
neq(a,e).
neq(b,c).
neq(b,d).
neq(b,e).
neq(c,d).
neq(c,e).
neq(d,e).
neq(b,a).
neq(c,a).
neq(d,a).
neq(e,a).
neq(c,b).
neq(d,b).
neq(e,b).
neq(d,c).
neq(e,c).
neq(e,d).

edge(a,b). 
edge(a,c). 
edge(b,d).
edge(c,d). 
edge(c,e). 
edge(d,e).

% second BK
% edge(a,b).
% edge(b,c).
% edge(b,d).
% edge(c,c).
% edge(c,e).
% edge(d,e).

target(X) :- edge(X,Y), pred1(X,Y).
pred1(X,Y) :- edge(X,Z), neq(Z,Y).

a :-
 Pos = [
    target(a),
    target(c)
  ],
  Neg = [
    target(b),
    target(d),
    target(e)
  ],
  learn(Pos,Neg).

b :-
 Pos = [
    target(b),
    target(c)
  ],
  Neg = [
    target(a),
    target(d),
    target(e)
  ],
  learn(Pos,Neg).