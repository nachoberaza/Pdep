toma(juan, vino(cabernet, 4)).
toma(juan, coca).
toma(daiana, cerveza(golden, 18,0)).
toma(gisela, cerveza(ipa, 52,7)).
toma(edu, cerveza(stout, 28, 6)).

/*
tieneProblemas(Persona):-
  findall(
    C,(toma(Persona, cerveza(C,_,A)), A>0),Cs
  ),
  findall(V,toma(Persona, vino(V,_)), Vs),
  findall(T, toma(Persona, T), Ts),
  length(Cs, CCs),
  length(Vs, CVs),
  length(Ts, CTs),
  CTs is CCs + CVs.
*/


% 1. VoF:
%  a. No se repite logica, dado que la estructura de las bebidas alcoholicas son distintas.
%  b. La solucion planteada para tieneProblemas/1 es declarativa.
%  c. La solucion planteada podria mejorarse con polimorfismo.

% 2. Explique y justifique cual es el significado de lo que se estaria consultando con el siguiente codigo:
% ?- tieneProblemas(P).

% 3. Implemente una solucion superadora de tieneProblemas/1.

% Rtas:
/*
1.a. Falso. Si se repite logica dentro del predicado tieneProblemas/1 a la hora de hacer el findall. Aunque
las bebidas alcoholicas sean distintas, esto puede delegarse a un predicado aparte y utilizar el polimorfismo.

1.b. Falso. Esta falta de delegacion del predicado hace que sea poco declarativa ya que tiene muchos pasos, 
provocando que sea demasiado procedural.

1.c. Verdadero. La solucion se podria mejorar utilizando polimorfismo y orden superior.
*/

/*
2. El predicado tieneProblemas/1 se cumple para una persona si la cantidad de bebidas con alcohol es la misma 
que la cantidad total de bebidas tomadas. Por lo tanto al consultar '?- tieneProblemas(P)' se consulta por las personas
que todas las bebidas que toman son alcoholicas.
*/

esBebidaAlcoholica(vino(_,_)).

esBebidaAlcoholica(cerveza(_,_,Alcohol)):-
  Alcohol > 0.

tieneProblemas(Persona) :-
  toma(Persona,_),
  forall(
    toma(Persona, Bebida),
    esBebidaAlcoholica(Bebida)
  ).



