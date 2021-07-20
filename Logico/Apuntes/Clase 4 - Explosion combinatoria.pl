/* =================== Ejemplo de vuelto =================== */
denominacion(1000).
denominacion(500).
denominacion(200).
denominacion(100).
denominacion(50).
denominacion(20).
denominacion(10).
denominacion(5).
denominacion(2).
denominacion(1).

% Tengo que dar un vuelto

vuelto(Importe,Pago,Vuelto):-
    TotalVuelto is Pago - Importe,
    denominacion(TotalVuelto, Vuelto).

/* Armo el vuelto que tengo que pagar: */

% Si no hay mas que pagar, no necesito billetes \ monedas
denominaciones(0,[]).

% Si queda algo por pagar, tomo un billete \ moneda y sigo con el proceso
denominaciones(Total,[ Denominacion | Denominaciones ]).
    Total > 0,
    denominacion(Denominacion),
    between(1,Total,Denominacion), % 1<= Denominacion <= Total
    Resto is Total - Denominacion,
    denominaciones(Resto,Denominaciones),

/* Agregando requerimientos (quiero quedarme con la menor cantidad de denominaciones, osea la mayor denominacion posible ) */
denominaciones(Total,[ Denominacion | Denominaciones ]).
    Total > 0,
    denominacion(Denominacion),
    between(1,Total,Denominacion), % 1<= Denominacion <= Total
    not((denominacion(Otra),between(Denominacion,Total,Otra))), % No quiero una denominacion menor al total y mayor a la denominacion anterior
    Resto is Total - Denominacion,
    denominaciones(Resto,Denominaciones),

/* =================== Ejemplo sin repetir y sin soplar =================== */

% Un grupo comando quiere infiltrarse en la base enemiga.
% La comandante del escuadron dispone de 5 personas para esta.
% infiltracion: fede, belen, tom, franco, diego.

% -- Base de conocimiento --
candidatos([fede,belen,tom,franco,diego]).

candidatos(Candidatos):-
    findall(Comando,integrante(Comando),Candidatos).

% ----------------------------

% Incluyo a la persona en el escuadron
escuadronPosible(Candidatos,[Persona|RestoSeleccion]):-
    select(Persona,Candidatos,RestoCandidatos),
    escuadron(RestoCandidatos,RestoSeleccion).

% Descarto a la persona
escuadronPosible(Candidatos,RestoSeleccion):-
    select(_,Candidatos,RestoCandidatos),
    escuadron(RestoCandidatos,RestoSeleccion).

% No quiero seleccionar mas 
escuadronPosible(_,[]).

% Entonces implemento la clausula cuando selecciono un escuadron
escuadronSeleccionado(Seleccion):-
    candidatos(Candidatos),
    escuadronPosible(Candidatos,Seleccion),
    Seleccion \= [].
