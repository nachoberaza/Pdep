/* =================== Disenio y acloplamiento ============== */
/* Disenio de piezas de canieria */
pieza(canilla1,canilla).
color(canilla1,rojo).
tipo(canilla1,triangular).
ancho(canilla1,12).

% Otra forma de disenio
pieza(canilla1,canilla,rojo).
tipo(canilla1,triangular).
ancho(canilla1,12).

% Otro modelo (tal vez el mejor)
pieza(canilla(Color,_,_),Color).
color(codo(Color)).
color(canio(Color,_),Color)

pieza(canilla(rojo,12,triangular)).
pieza(codo(azul)).
pieza(canio(negro,4)).

/* Acoplamiento (puedoEnchufar) */
sonEnchufables(Color,Color).
sonEnchufables(azul,rojo).
sonEnchufables(rojo,negro).

% Nota que esto anda para todas las alternativas de modelo propuestas
puedoEnchufar(Pieza1,Pieza2):-
    color(Pieza1,Color1),
    color(Pieza2,Color2),
    sonEnchufables(Color1,Color2).

/* ======= Code Snells ========== */

% Asercion vs Negacion

produce(netflix,serie(theWalkingDead,10)).
produce(netflix,serie(mindhunter,2)).
produce(netflix,serie(umbrellaAcademy,2)).

/* 
    "Una plataforma es divertida si todas sus series tienen mas de 4 temporadas"            
    Que equivale a:
    "Una plataforma divertida si no produce series que no superen las 4 temporadas"(es re confuso)
    En conclusion, es mejor implementar la primera opcion porque es mas expresiva y simple

*/

% Opcion 1 (con asercion)
divertida(Plataforma):-
    produce(Plataforma,_),
    forall(
        produce(Plataforma,serie(_,Temporadas)),
        Temporadas > 4.
    ).

% Opcion 2 (con negacion)
divertida(Plataforma):-
    produce(Plataforma,_),
    not(
        (
            produce(Plataforma, serie(_,Temporadas)),
            serie(_,Temporadas),
            not(Temporadas>4)
        )
    ).

% Duplicidades

/* Queremos conocer la cantidad de contenidos de una productora */
produce(netflix,pelicula(awake,2021)).

% Puedo contar cada uno de los titulos que produce
cantidadTitulo(Productora,Cantidad):-
    produce(Productora,_),
    findall(
        Peli,produce(Productora,pelicula(Peli,_,_),_)
    ),
    findall(
            Serie,produce(Productora,serie(Serie,_),Series)
    ),
    findall(
        Documental,produce(Productora,documental(...),Docs),
        ...
    ).
    
% Puedo contar directamente todo lo que produce 
cantidadTitulo(Productora,Cantidad):-
    produce(Productora,_),
    findall(Contenido,produce(Productora,Contenido),Contenidos),
    length(Contenidos, Cantidad).
    
/* Una productora es interesante si, tiene al menos una pelicula producida en 2021 */
interesante(Productora):-
    produce(Productora,pelicula(_,2021)).

/* ======= Lazy Predicate ======== */
/* 
Algo que podemos encontrar en cualquier paradismga es Lazy <component>,
nos referimos asi cuando no aporta nada a la solucion
*/

interesante(Productora):-
    tienePeliculaInteresante(Productora).
tienePeliculaInteresante(Productora):-
    produce(Productora,pelicula(_,2021)).

/* ======= La no incognita ======== */
/*
    Las peliculas tienen un puntaje y se calcula como:
    - 9 si es del 2021
    - Si no es del 2021, la decima parte de la longitud de su nombre 
*/

% Esto es innecesario
puntaje(pelicula(_,2021),Puntaje):-
    Puntaje is 9.

% Para lo anterior esto seria adecuado
puntaje(pelicula(_,2021),9).

% Esto en cambio es mucho mejor
puntaje(pelicula(Nombre,Anio),Puntaje):-
    Anio \= 2021,
    atom_length(Nombre, Cantidad),
    Puntaje is Cantidad / 10.

    