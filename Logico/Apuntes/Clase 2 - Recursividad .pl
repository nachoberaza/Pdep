/* Factorial de un numero */
factorial(0,1).
factorial(Numero,Factorial):-
    % Valido que el numero sea positivo
    Numero > 0,
    % Extraigo su anterior
    Anterior is Numero-1,
    % Calculo el factorial del numero anterior (Parte recursiva de la funcion)
    factorial(Anterior,FactorialAnterior),
    % El factorial es igual al numero por el factorial del anterior
    Factorial is Numero*FactorialAnterior.


/* Ancestro */
% Mi ancestro mas cercano es mi padre (Caso base)
ancestro(Ancestro,Sucesor):-
    padre(Ancestro,Sucesor).

ancestro(Ancestro,Sucesor):-
    % Un ancestro mio es a su vez un ancestro de mi padre
    padre(Ancestro,Alguien),
    % Parte recursiva
    ancestro(Alguien,Sucesor).

/* Los amigos de mis amigos son mis amigos */
amigo(agus,tom).
amigo(tom,franco).
amigo(franco, diego).

% Caso base
sonAmigo(Amigo1,Amigo2):-
    amigo(Amigo1,Amigo2).

sonAmigo(Amigo1,Amigo2):-
    amigo(Amigo1,otroAmigo),
    amigo(otroAmigo,Amigo2).

/* Nth1 */
enesimo(x,[x| _ ],1).
enesimo(x,[_|cola],Posicion):-
    enesimo(x,cola,PosicionCola),
    Posicion is PosicionCola+1.

/* Member */
elemento(x,[x|_]).
elemento(x,[_|cola]):-
    elemento(x,cola).

% Sin recursividad pero reutilizando la funcion nth1
elemento(x,Lista):-
    enesimo(x,Lista,_).