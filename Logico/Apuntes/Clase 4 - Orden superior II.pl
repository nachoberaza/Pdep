doble(Numero,Doble):- Doble is Numero * 2.

% Medio feo porque no es muy declarativo
dobles(Lista,Dobles):-
    findall(
        Doble,
        (member(N,Lista),doble(N,Doble)),
        Dobles
    ).

% Map en logico

dobles(Lista,Dobles):-
    mapList(doble,Lista,Dobles).

% ¿A que numero le puedo sumar un 2 y me da la lista resultante [2,4]?
mapList(plus(2),ListaOriginal,[2,4]).
ListaOriginal= [0,2]

