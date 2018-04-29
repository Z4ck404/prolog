%definition de member:
membere(X,L):- L=[M|Y], X=M;L=[M|Y],membere(X,Y).
%membere % membere(E,[E|_]).%membere(E,[_|Y]):-membere(M,Y).
%
%
%
%
%longeur d'une liste :
longeur(0,[]).
longeur(X,List):- List=[premier|List1],X=Y+1,longeur(Y,List1).
%longeur(L,[_|X]):-longeur(L1,X),L is Y1+1.
%
%
%
%dernier elemnt d'une liste:
dernier(D,[D]).
dernier(D,List):-List=[element|List2],dernier(D,List2).
%correction prof/chaimaa :
%dernier([X],X).
%dernier([_|X],S):- dernier(X,S).
%
%
%
%
%avant dernier element d'une liste:
av_dernier(D,List):-List=[D,element] ;List=[element,Liste2],av_dernier(D,Liste2).
%av_dernier([E,_],E)
%av_dernier(L,X):- L=[_|L1],av_dernier(L1,X).
/*remarque*/
% one ne peut pas faire l'incrementation d'un variable :
% cad on ne peut pas faire : N is N+1.
%
%
%
% Inverse d'une liste :
inverse([X,Y],[Y,X]).%ou bien juste inverse([],[]).
inverse(G,H):- G=[U|V],inverse(V,C),append(C,[U],H).
%
%
%
%Somme d'une liste:
somme(0,[]).
somme(S,L):- L=[element|L2],S is element+X,somme(X, L2).
%
%
%le moyen des elements d'une liste :
moyen(List,Moyen):-somme(S,List),longeur(L,List),Moyen is L/S.
%
%
premier(P,List):-List=[P|_].
%
maxlist([Max],Max).
% maxlist(List,Max):-List=[element|Rest],premier(P,Rest),(element =< P
% ->Max=P;maxlist(Rest,Max)).
%les element de la liste L1 se trouve dans la liste L2 :
trouve(L1,L2):- L1=[D],member(D,L2); L1=[E|R],L2=[_|_],member(E,L2),trouve(R,L2).
%la substitution de e1 par e2 dans L1 = L2 :
sub(L1,L2,X,Y):- L1=[X],L2=[Y];L1=[A|R1],L2=[B|R2],A=B,sub(R1,R2,X,Y);L1=[A|R1],L2=[B|R2],A=X,B=Y,sub(R1,R2,X,Y).


