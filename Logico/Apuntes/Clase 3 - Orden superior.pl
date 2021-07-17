
/* Acciones */
% Tenemos ciertas personas que realizaron acciones, buenas malas y travesuras

% realizo(Persona,TipoDeAccion).
realizo(fede,buena).
realizo(topy,travesura).
realizo(agustin,mala).
realizo(topy,buena).

% Una persona es buena si no hizo ninguna mala accion
buenaPersona(Persona):-
    % Predicado generador
    realizo(Persona,_),
    not(
        realizo(Persona,mala)
    ).

/* Saber si una persona es buena, que es cuando todas las acciones que realizo son buenas */
realizo(fede,ayudo(mati)).
realizo(topy,desaparecioGuita).
realizo(topy,ayudo(franco)).
realizo(agustin,prometioAsado).

% accionTipo(Accion,Tipo).
accionTipo(ayudo(_),buena).
accionTipo(prometioAsado,mala).
accionTipo(desaparecioGuita,travesura).

buenaPersona(Persona):-
    % Predicado generador
    realizo(Persona,_),
    % Predicado de orden superior
    forall(
        realizo(Persona,Accion),
        accionTipo(Accion,buena)
    ).

/* Saber cuantas acciones realizo una persona */
cantidadAcciones(Persona,Cantidad):-
    % Predicado generador
    realizo(Persona,_),
    % Predicado de orden superior (findall)
    findall(Accion,realizo(Persona,Accion),Acciones),
    length(Aciones, Cantidad).