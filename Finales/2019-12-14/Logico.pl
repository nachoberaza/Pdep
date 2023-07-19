% stock(sucursal, producto, cantidad).
stock(boedo, sillon(comun, 3), 4).
stock(boedo, silla(madera), 12).
stock(flores, sillon(cama, 2), 1).
stock(flores, silla(metal), 4).
stock(belgrano, sillon(reclinable, 2), 3).
stock(belgrano, silla(madera), 8).


% sillon(Tipo, CantidadModulos):-
  % Tipo = comun | cama | reclinable.

% silla(Material):-
  % Material = metal | madera.


% mesa(Forma, Material):-
  % Forma = rectangular | cuadrada | circular,
  % Material = madera | vidrio.  

%1. 
busca(mati, mesa(circular, vidrio),1).
busca(mati, silla(metal), 4).

busca(leo, sillon(cama, 2), 1).
busca(leo, sillon(reclinable, 1), 1).


%2.
trabaja(Sucursal, _):- 
  stock(Sucursal, sillon(_,_),_).

trabaja(Sucursal, Material):-
  stock(Sucursal, silla(Material), _).

trabaja(Sucursal, Material):-
  stock(Sucursal, mesa(_, Material), _).

%3. Sucursal ideal: Se cumple cuando una sucursal tiene en stock todo lo que el cliente busca.
ideal(Cliente, Sucursal):-
  busca(Cliente, Mueble, Cantidad),
  