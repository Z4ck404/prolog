%ce programme prolog recoaanit la structure languistique d'une phrase
%et corrige aussi les fautes d'orthographe.
%La grammaire que les phrases doivent respectées :
ph(P,R,_,_):-gn(P,S,_,_),gv(S,R,_,_).
ph([],[],_,_).
%le groupe nominal :
gn(P,S,G,N):-sn(P,S,G,N).
gn(P,S,G,N):-pps(P,S,G,N).%pps : prenon personnel sujet
%G pour le genre , N pour le nombre .
pps([P|S],S,G,N):-member(P,["je","tu","il"]),G=m,N=s,write(pren_perso__).
pps([P|S],S,G,N):-member(P,["je","tu","elle"]),G=f,N=s,write(pren_perso__).
pps([P|S],S,G,N):-member(P,["nous","vous","ils"]),G=m,N=p,write(pren_perso__).
%syntagme_nominal :
sn(P,S,_,_):-det(P,R1,G,N),adjs(R1,R2,G,N),nom(R2,R3,G,N),adjs(R3,R4,G,N),cnom(R4,S,G,N).
nom([R|S],S,G,N):-member(R,["ali","jawad","steve","chat"]),G=m,N=s,write(nom__).
nom([R|S],S,G,N):-member(R,["cathrine","pomme","table"]),G=f,N=s,write(nom__).
gv(P,S,_,_):-verbeetat(P,R1,_,_),attribut(R1,R2,_,_),ccir(R2,S,_,_).
gv(P,S,G1,N1):-verbe(P,R1,G1,N1),cod(R1,R2,_,_),coi(R2,R3,_,_),ccir(R3,S,_,_).
verbe([P|R],R,m,s):-member(P,["mange","prend"]),write(verbe__).
verbeetat([V|R],R,m,s):-member(V,["suis","es","est"]),write(verbe_etat__).
verbeetat([V|R],R,m,p):-member(V,["sommes","etes","sont"]),write(verbe_etat__).
verbeetat([V|R],R,f,s):-member(V,["suis","es","est"]),write(verbe_etat__).
verbeetat([V|R],R,f,p):-member(V,["sommes","etes","sont"]),write(verbe_etat__).
cod(P,S,_,_):-sn(P,S,_,_),write(cod__).
cod(P,P,_,_).
coi(["à"|R],S,_,_):-sn(R,S,_,_),write(coi__).
coi(P,P,_,_).
ccir(P,R,_,_):-prep(P,R1),sn(R1,R,_,_),write(ccir__).
ccir(P,P,_,_).
prep([P|R],R):-member(P,["à","de","dans","avec"]),write(preposition__).
prep(P,P).
det([D|R],R,G,N):-detm(D,G,N),write(determinat__).
det(P,P,_,_).
detm(D,G,N):-member(D,["le","un"]),G=m,N=s.
detm(D,G,N):-member(D,["la","une"]),G=f,N=s.
detm(D,G,N):-member(D,["les","des"]),G=m,N=p.
detm(D,G,N):-member(D,["les","des"]),G=f,N=p.
attribut(R,S,_,_):-sn(R,S,_,_).
attribut(R,S,G,N):-adjs(R,S,G,N).
cnom(["de"|N],R,G,N):-sn(N,R,G,N),write(complementNom__).
cnom(R,R,_,_).
adjs([A|R],S,G,N):-adj(A,G,N),adjs(R,S,G,N).
adjs(P,P,_,_).
adj(A,G,N):-member(A,["petit","grand"]),G=m,N=s,write(adjectif__).
adj(A,G,N):-member(A,["petite","grande"]),G=f,N=s,write(adjectif__).
adj(A,G,N):-member(A,["petits","grands"]),G=m,N=p,write(adjectif__).
adj(A,G,N):-member(A,["petites","grandes"]),G=f,N=p,write(adjectif__).
