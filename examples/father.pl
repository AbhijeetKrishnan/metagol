:- use_module('../metagol').

%% tell Metagol to use the BK
prim(husband/2).
prim(mother/2).
prim(brother/2).
prim(aunt/2).

%% metarules
metarule([P,Q,R],([P,A,B]:-[[Q,A,C],[R,C,B]])).

%% background knowledge
aunt(dorothy_edward,anne_boleyn).
aunt(anne_boleyn,henry_carey).

brother(henry_viii,margaret_tudor).
brother(henry_of_beauvais,louis_vii).
brother(adele_of_champagne,margaret_of_france).

husband(henry_viii,anne_boleyn).
husband(louis_vii,adele_of_champagne).
husband(george_donatus,cecilie_of_mountbatten).

mother(anne_boleyn,elizabeth_i).
mother(adele_of_champagne,philip_ii).
mother(cecilie_of_mountbatten,louis_vii).

a :-
 Pos = [
    target(george_donatus,louis_vii)
  ],
  Neg = [
  ],
  learn(Pos,Neg).
