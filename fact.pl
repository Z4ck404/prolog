%factoriel:
fact(1,1).
fact(0,1).
fact(X,Y):- X=\=1,X=\=0,fact(L,Z),Y is Z*X,L is X-1.
%on peut pas faire des expresseions au niveau des predicats.

%fibnacci:
fibo(1,0).
fibo(0,0).
fibo(X,Y):- X>1, fibo(M,Z),fibo(N,T),M is X-1,N is X-2,Y is T+Z.
