
%Trabalho 7
ao_lado(X, Y, L) :- nextto(X, Y, L).

regra1(E) :-
	nth0(0, E, f);
	nth0(1, E, f);
	nth0(2, E, f).

regra2(E) :-
	ao_lado(h, g, E).

regra3(E) :-
	nth0(1, E, l);
	nth0(2, E, l);
	nth0(3, E, l);
	nth0(4, E, l);
	nth0(5, E, l).

regra4(E) :-
	nth0(0, E, m);
	nth0(6, E, m).

regra5(E) :-
	nth0(4, E, p);
	nth0(5, E, p);
	nth0(6, E, p).
	


ex1(D) :-
    D = [_,_,_,_,_,_,_],
    Casas = [f,g,h,l,m,p,t],
    permutation(Casas, D),
    regra1(D),
    regra2(D),
    regra3(D),
    regra4(D),
    regra5(D).

ex2(L, R) :-
	L = [_,_,_,_,_,_,_],
	Casas = [f, g, h, l, m, p, t],
	permutation(L, Casas),
	ao_lado(t, l, L),
	ao_lado(l, f, L),
	regra1(L),
	regra2(L),
	regra3(L),
	regra4(L),
	regra5(L),
	nth1(R, L, g).
/*  
	Questao 1:
	dengue([h,g,f,l,t,p,m]).

	Questao 2:
	quinta posicao

	Questao 3: testes
	ex1([h,_,_,f,_,_,_]).
	ex1([h,_,_,g,_,_,_]).
	Resposta: ex1([h,_,_,l,_,_,_]).
	ex1([h,_,_,m,_,_,_]).
	ex1([h,_,_,p,_,_,_]).
*/


/*
	---------------------------------------------Segundo Trabalho
	http://olimpiada.ic.unicamp.br/pdf/provas/ProvaOBI2011_inic_f1n1.pdf


	Pizza Compartilhada


*/

nao_lado2(C, S, E):- not(nextto(C, S, E)), not(nextto(S, C, E)).

regra1_2(E) :- nao_lado2("bacon", "portuguesa", E).
regra2_2(E) :- nao_lado2("atum", "mussarela", E).

regra3_2(E) :- ao_lado("napolitano", "mussarela", E).

pizza(E) :-
	E = [_,_,_,_,_,_],
	Casas = ["mussarela", "atum", "bacon", "portuguesa", "calabresa", "napolitano"],
	permutation(Casas, E),
	regra1_2(E),
	regra2_2(E),
	regra3_2(E).




/*

------------Questao 16 		Resposta: D) "mussarela"
?- ex16(E).
(Use ;)

*/
ex16(E) :-
	E = [_,_,_,_,_,_],
	Casas = ["mussarela", "atum", "bacon", "portuguesa", "calabresa", "napolitano"],
	permutation(Casas, E),
	ao_lado("atum", "napolitano", E),
	regra1_2(E),
	regra2_2(E),
	regra3_2(E).




/*
------------Questao 17 			Resposta: D) ["portuguesa", "napolitano", "mussarela", "bacon", "atum", "calabresa"] 

?- pizza(E). 	(Use ;)

*/


/*

-------------Questao 18			Resposta: B)
?- ex18(E).
(Use ;)

*/


ex18(E) :-
	E = [_,_,_,_,_,_],
	Casas = ["mussarela", "atum", "bacon", "portuguesa", "calabresa", "napolitano"],
	permutation(Casas, E),
	ao_lado("mussarela", "bacon", E),
	regra1_2(E),
	regra2_2(E),
	regra3_2(E).
