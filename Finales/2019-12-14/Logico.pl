
% sillon(Tipo, CantidadModulos):-
  % Tipo = comun | cama | reclinable.

% silla(Material):-
  % Material = metal | madera.

% mesa(Forma, Material):-
  % Forma = rectangular | cuadrada | circular,
  % Material = madera | vidrio.  

% stock(sucursal, producto, cantidad).
stock(boedo, sillon(comun, 3), 4).
stock(boedo, silla(madera), 12).
stock(flores, sillon(cama, 2), 1).
stock(flores, silla(metal), 4).
stock(belgrano, sillon(reclinable, 2), 3).
stock(belgrano, silla(madera), 8).

stock(villaUrquiza, mesa(circular, vidrio), 10).
stock(villaUrquiza, silla(metal), 8).

%1. 
busca(mati, mesa(circular, vidrio),1).
busca(mati, silla(metal), 4).

busca(leo, sillon(cama, 2), 1).
busca(leo, sillon(reclinable, 1), 1).


%2.
materialMueble(Material, silla(Material)).
materialMueble(Material, mesa(_,Material)).

trabaja(Sucursal, madera):- 
  stock(Sucursal, sillon(_,_),_).

trabaja(Sucursal, Material):-
  stock(Sucursal, Mueble, _),
  materialMueble(Material, Mueble).

%3. Sucursal ideal: Se cumple cuando una sucursal tiene en stock todo lo que el cliente busca.

todoLoQueBusca(Cliente, Muebles):-
  findall(
    (Mueble, Cantidad),
    busca(Cliente, Mueble,Cantidad),
    Muebles
  ).

todoLoQueTiene(Sucursal, Muebles):-
  findall(
    (Mueble, Cantidad),
    stock(Sucursal, Mueble,Cantidad),
    Muebles
  ).

hayStock(Mueble, Sucursal, CantidadBuscada):-
  stock(Sucursal, Mueble, Stock),
  Stock >= CantidadBuscada.

/* Una sucursal ideal se cumple cuando para todos los muebles buscados hay stock en la sucursal */
ideal(Sucursal,Cliente):-
  todoLoQueBusca(Cliente, MueblesBuscados),
  todoLoQueTiene(Sucursal, MueblesEnStock),
  forall(
    member( (Mueble, CantidadBuscada) , MueblesBuscados),
    (
      member( (Mueble, CantidadEnStock) , MueblesEnStock ),
      CantidadBuscada =< CantidadEnStock
    )
  ).