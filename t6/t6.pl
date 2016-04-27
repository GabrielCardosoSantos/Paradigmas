%ex1
zeroInit([0|_]).

%ex2
has5(L) :- L = ([_,_,_,_,_]).

%ex3
hasN(L, N) :- length(L, I), N =:= I.

%ex4
potN0(0, []).
potN0(N, L) :- 
	N >= 0,
	I is 2^N,
	N1 is N-1,
	L = [I|T],
	potN0(N1, T).

%ex5
zipmult([], [], []).
zipmult(L1,L2,L3) :-
	L1 = [H1|T1],
	L2 = [H2|T2],
	L3 = [_|T3],
	N is H1 * H2,
	L3 = [N|T3],
	zipmult(T1, T2, T3).

%ex6
potencias(0, []).
potencias(N,L) :- aux(0, N, L).

aux(N, N, []).
aux(I, N, L) :-
	I =< N,
	N1 is 2^I,
	L = [_|T],
	L = [N1|T],
	N2 is I+1,
	aux(N2, N, T).

%ex7
positivos([],[]).
positivos(L1, L2) :-
	L1 = [H1|T1],
	L2 = [H2|T2],
	H1 > 0,
	H2 is H1,
	positivos(T1,T2).
positivos([_|T1],L) :- positivos(T1,L).

%ex8
mesmaPosicao(A, [A|_],[A|_]).
mesmaPosicao(A, [H1|T1], [_|T2]) :- A \= H1, mesmaPosicao(A, T1, T2).

%ex9
comissao(0, _, []).
comissao(N, [H|T1], [H|T2]) :- 
	N > 0, 
	N1 is N-1, 
	comissao(N1, T1, T2).
comissao(N, [_|T1], T2) :- 
	N > 0, 
	comissao(N, T1, T2).

%ex10
azulejos(0, 0).
azulejos(NA, NQ) :-
	A is floor(sqrt(NA)),
	N1 is NA - A*A,
	azulejos(N1, N2),
	NQ is N2 + 1.
