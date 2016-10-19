male(joseArcadioBuendia).
male(nicanorUlloa).
male(joseArcadio).
male(aureliano).
male(arcadio).
male(aurelianoJose).
male(fernandoDelCarpio).
male(aurelianoSegundo).
male(joseArcadioSegundo).
male(gaston).
male(joseArcadioJunior).
male(mauricioBabilonia).
male(aurelianoBabilonia).
male(aurelianoJunior).

female(rebecaMontiel).
female(ursulaIguaran).
female(rebeca).
female(pilarTernera).
female(remediosMoscote).
female(amaranta).
female(santaSofiaDeLaPiedad).
female(renataArgote).
female(fernandaDelCaprio).
female(petraCotes).
female(remedios).
female(amarantaUrsula).
female(renataRemedios).

parent(rebeca, nicanorUlloa).
parent(rebeca, rebecaMontiel).
parent(joseArcadio, joseArcadioBuendia).
parent(joseArcadio, ursulaIguaran).
parent(aureliano, joseArcadioBuendia).
parent(aureliano, ursulaIguaran).
parent(amaranta, joseArcadioBuendia).
parent(amaranta, ursulaIguaran).
parent(arcadio, joseArcadio).
parent(arcadio, pilarTernera).
parent(aurelianoJose, pilarTernera).
parent(aurelianoJose, aureliano).
parent(remedios, santaSofiaDeLaPiedad).
parent(remedios, arcadio).
parent(joseArcadioSegundo, santaSofiaDeLaPiedad).
parent(joseArcadioSegundo, arcadio).
parent(aurelianoSegundo, santaSofiaDeLaPiedad).
parent(aurelianoSegundo, arcadio).
parent(fernandaDelCaprio, fernandoDelCarpio).
parent(fernandaDelCaprio, renataArgote).
parent(amarantaUrsula, aurelianoSegundo).
parent(amarantaUrsula, fernandaDelCaprio).
parent(joseArcadioJunior, aurelianoSegundo).
parent(joseArcadioJunior, fernandaDelCaprio).
parent(renataRemedios, aurelianoSegundo).
parent(renataRemedios, fernandaDelCaprio).
parent(aurelianoBabilonia, renataRemedios).
parent(aurelianoBabilonia, mauricioBabilonia).
parent(aurelianoJunior, amarantaUrsula).
parent(aurelianoJunior, aurelianoBabilonia).

father(X, Y) :- parent(X, Y), male(Y).
mother(X, Y) :- parent(X, Y), female(Y).

child(X, Y) :- parent(Y, X).
son(X, Y) :- child(X, Y), male(Y).
daughter(X, Y) :- child(X, Y), female(Y).

sibling(X, Y) :-
	parent(X, Z), parent(Y, Z),
	dif(X, Y).

brother(X, Y) :- sibling(X, Y), male(Y).
sister(X, Y) :- sibling(X, Y), female(Y).

cousin(X, Y) :-
	parent(X, Z),
	parent(Y, W),
	sibling(Z, W).

uncle(X, Y) :-
	brother(Z, Y),
	(father(X, Z); mother(X, Z)).

aunt(X, Y) :-
	sister(Z, Y),
	(father(X, Z); mother(X, Z)).

nephew(X, Y) :-
	(uncle(Y, X); aunt(Y, X)),
	male(Y).

niece(X, Y) :-
	(uncle(Y, X); aunt(Y, X)),
	female(Y).

grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
grandfather(X, Y) :- grandparent(X, Y), male(Y).
grandmother(X, Y) :- grandparent(X, Y), female(Y).

grandchild(X, Y) :- grandparent(Y, X).
grandson(X, Y) :- grandchild(X, Y), male(Y).
granddaughter(X, Y) :- grandchild(X, Y), female(Y).

bloodRelated(X, Y) :-
	parent(X, Y);
	child(X, Y);
	sibling(X, Y);
	grandparent(X, Y);
	grandchild(X, Y);
	uncle(X, Y);
	aunt(X, Y);
	nephew(X, Y);
	niece(X, Y).


procreated(X, Y) :-
	parent(Z, X), parent(Z, Y),
	dif(X, Y).

incest(X, Y) :- procreated(X, Y), bloodRelated(X, Y).