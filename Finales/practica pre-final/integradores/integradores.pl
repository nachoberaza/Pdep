puntajes(hernan,[3,5,8,6,9]).
puntajes(julio,[9,7,3,9,10,2]).
puntajes(ruben,[3,5,3,8,3]).
puntajes(roque,[7,10,10]).

/*
elementoPorIndice(Elemento, 1, [Elemento|_]).
elementoPorIndice(Elemento, Indice , [ _ | cola ]):-
    elementoPorIndice(Elemento, NuevoIndice, cola),
    Indice is NuevoIndice + 1.
*/

%1.
puntajePorSalto(Sujeto, Salto, Puntaje):-
    puntajes(Sujeto, Saltos),
    nth0(Salto, Saltos, Puntaje).

%2.
competidorDescalificado(Sujeto):-
    puntajes(Sujeto,Saltos),
    length(Saltos, CantSaltos),
    CantSaltos > 5.

%3. 
clasificable(Saltos):-
    sumlist(Saltos, Suma),
    Suma >= 28.
    
clasificable(Saltos):-
    puntajeClasificable(Saltos).

puntajeClasificable(Lista):-
    findall(
        Elemento,
        (member(Elemento,Lista), Elemento > 7),
        MayoresA7
    ),
    length(MayoresA7, Longitud),
    Longitud > 1.
    

clasificaALaFinal(Sujeto):-
    puntajes(Sujeto,Saltos),
    clasificable(Saltos).