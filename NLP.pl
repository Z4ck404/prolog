%ce programme prolog recoaanit la structure languistique d'une phrase
%et corrige aussi les fautes d'orthographe.
%La grammaire que les phrases doivent respectées :
ph(P,R):-gn(P,S),gv(S,R).
%le groupe nominal :
gn(P,S):-sn(P,S).
gn(P,S):-pps(P,S).%pps : prenon personnel sujet
pps([P|S],S):-member(P,["je","tu","il"]).
%syntagme_nominal :
sn(P,S):-det(P,R1),adjs(R1,R2),nom(R2,R3),adjs(R3,R4),cnom(R4,S).
gv(P,S):-verbe(P,R1),cod(R1,R2),coi(R2,R3),ccir(R3,S).
gv(P,S):-verbeetat(P,R1),attribut(R1,R2),ccir(R2,S).
verbe([P|R],R):-member(P,["mange","prend"]).
verbeetat([V|R],R):-member(V,["suis","est","es"]).
cod(P,S):-sn(P,S).
cod(P,P).
coi(["à"|R],S):-sn(R,S).
coi(P,P).
ccir(P,R):-prep(P,R1),sn(R1,R).
ccir(P,P).
prep([P|R],R):-member(P,["à","de","dans","avec"]).
det([D|R],R):-detm(D).
det(P,P).
detm(D):-member(D,["le","la","un","une"]).
attribut(R,S):-adjs(R,S);sn(R,S).
cnom(["de"|N],R):-sn(N,R).
cnom([],[]).
adjs([A|R],S):-adj(A),adjs(R,S).
adjs(P,P).
adj(A):-member(A,["petit","grand"]).
nom([R|S],S):-member(R,["ali","jawad","steve","pomme","chat"]).









