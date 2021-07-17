/* Comienzo del mundo conocido */

viveEn(mariano, avellaneda).
viveEn(fede, avellaneda).
viveEn(victoria, versalles).
viveEn(rodrigo, villaBallester).
viveEn(tomas, nuniez).

quedaEn(utn, almagro).
quedaEn(utn, villaLugano).
quedaEn(exactas, nuniez).
quedaEn(river, nuniez).
quedaEn(racing, avellaneda). 
quedaEn(montoto, palermo).
quedaEn(montoto, nuniez).
quedaEn(montoto, avellaneda).

tieneAuto(tomas).
tieneAuto(fede). 

llegaFacil(batman, _).
llegaFacil(Persona, _) :-
 tieneAuto(Persona).
llegaFacil(Persona, Destino) :-
  viveEn(Persona, Zona),
  quedaEn(Destino, Zona).

destinosProximos(Destino, OtroDestino) :-
   quedaEn(Destino, Zona),
   quedaEn(OtroDestino, Zona).

sonVecinos(UnaPersona, OtraPersona) :-
    UnaPersona \= OtraPersona,
    viveEn(UnaPersona, Zona), 
    viveEn(OtraPersona, Zona).

zonaHabitada(Zona):-
  viveEn(_,Zona).

dificilDeEstacionar(Lugar):-
  zonaHabitada(Lugar),
  forall(
    viveEn(Persona,Lugar),
    tieneAuto(Persona)
  ).

zonaDesierta(Zona):-
  not(zonaHabitada(Zona)), 
  forall(
    quedaEn(_,Zona),
    not(quiereIr(_,Zona))
  ).


trabajaEn(hernan,compras).

trabajaEn(maquiavelo,ventas).
trabajaEn(camilo,ventas).
trabajaEn(anastasia,ventas).

trabajaEn(ingrid,ilegales).
trabajaEn(tomas,ilegales).

/* 

Una persona trabaja con otra si ambas trabajan en el mismo sector

Una persona trabaja con todas las que trabajan en el mismo departamento

*/

trabajaCon(Persona,Companiero):-
  trabajaEn(Persona,Sector1),
  forall(
    trabajaEn(Companiero,Sector2),
    Sector1 == Sector2
  ).
/* Fin del mundo conocido */





