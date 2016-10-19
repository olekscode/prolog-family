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

spouse(nicanorUlloa, rebecaMontiel).
spouse(joseArcadioBuendia, ursulaIguaran).
spouse(rebeca, joseArcadio).
spouse(joseArcadio, pilarTernera).
spouse(pilarTernera, aureliano).
spouse(aureliano, remediosMoscote).
spouse(santaSofiaDeLaPiedad, arcadio).
spouse(fernandoDelCarpio, renataArgote).
spouse(petraCotes, aurelianoSegundo).
spouse(aurelianoSegundo, fernandaDelCaprio).
spouse(gaston, amarantaUrsula).
spouse(renataRemedios, mauricioBabilonia).
spouse(amarantaUrsula, aurelianoBabilonia).

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

spouse(X, Y) 	:- spouse(Y, X).
husband(X, Y) 	:- spouse(X, Y), male(Y).
wife(X, Y) 		:- spouse(X, Y), female(Y).

father(X, Y) 	:- parent(X, Y), male(Y).
mother(X, Y) 	:- parent(X, Y), female(Y).

child(X, Y) 	:- parent(Y, X).
son(X, Y) 		:- child(X, Y), male(Y).
daughter(X, Y) 	:- child(X, Y), female(Y).

sibling(X, Y) 	:- (mother(X, Z), mother(Y, Z) |
				   father(X, W), father(Y, W)),
				   dif(X, Y).

brother(X, Y)	:- sibling(X, Y), male(Y).
sister(X, Y)	:- sibling(X, Y), female(Y).

cousin(X, Y)	:- parent(X, Z), parent(Y, W),
				   sibling(Z, W).

uncle(X, Y) 	:- brother(Z, Y), (father(X, Z); mother(X, Z)).
aunt(X, Y)		:- sister(Z, Y), (father(X, Z); mother(X, Z)).

grandparent(X, Y)	:- parent(X, Z), parent(Z, Y).
grandfather(X, Y)	:- grandparent(X, Y), male(Y).
grandmother(X, Y)	:- grandparent(X, Y), female(Y).

grandchild(X, Y)	:- grandparent(Y, X).
grandson(X, Y)		:- grandchild(X, Y), male(Y).
granddaughter(X, Y)	:- grandchild(X, Y), female(Y).

bloodRelated(X, Y)	:-
	parent(X, Y);
	child(X, Y);
	sibling(X, Y);
	grandparent(X, Y);
	grandchild(X, Y);
	uncle(X, Y);
	aunt(X, Y).

incest(X, Y) 	:- spouse(X, Y), bloodRelated(X, Y).