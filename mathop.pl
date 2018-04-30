%derivation des fonctions ppolynomialles :
num(n):-member(n,[1,2,3,4,5,6,7,8,9,0]).
der(x,x,1).
der(n,x,0):-num(n).
der(n*F,x,D):-der(F,x,df),num(n),D is n*df.
der(F+G,x,dfg):- der(F,x,df),der(G,x,dg),dfg is df+dg.
der(F*G,x,dfg):-der(F,x,df),der(G,x,dg),dfg is (F*dg+G*df).
der(F/G,x,dfg):-der(F,x,df),der(G,x,dg),dfg is (df*G-dg*F)/(G*G).
%derivation des fonctions trigonometriques( en cours de modification )  :
%der(sin(x),x,0):- number(x).
%der(cos(x),x,0):- number(x).
%der(sin(x),x,cos(x)).
%der(cos(x),x,dcos(x)):- docs(x)is (-1)* sin(x).
%sin(x):-number(x).
%cos(x):-number(x).


