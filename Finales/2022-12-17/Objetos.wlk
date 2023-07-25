/*
class Persona{
  var property edad
  var property consolas = []

  method puedeJugar(unJuego){

    if (unJuego.tipo() = "Juego de mesa")
      return edad.between(unJuego.edadMinima(), unJuego.edadMaxima())
    
    if(unJuego.tipo() = "Videojuego"){
      if (edad.between(unJuego.genero().edadMinima(), 80)){
        consolas.forEach{
          consola => unJuego.consolasPosibles().forEach{
            otraConsola => if (consola == otraConsola) return true
          }
        }
      }
      return false
    } else return false

    return edad > 1 // Si llega hasta aca es porque es una pelota
  }

}

class Juego{
  var property tipo
  var property edadMinima
  var property edadMaxima
}

class Videojuego inherits Juego{
  var property consolasPosibles
  var property genero
}

class genero {
  var property titulo
  var property edadMinima
}
*/

/* Consignas */

// 1. Critique la solucion presentada en terminos de declaratividad,
// polimorfismo, delegacion, encapsulamiento y herencia marcando los diferentes lugares
// en los cuales encuentra problemas.

// 2. Codifique una nueva solucion teniendo en cuenta los problemas detectados y fundamente
// los cambios realizados conceptualmente para cada cambio (no se consideraran respuestas genericas).

class Persona{
  var property edad
  var property consolas = []

  method puedeJugar(unJuego){
    unJuego.aptoParaJugar(self);
  }
}

class Juego{
  var property tipo
  var property edadMinima
  var property edadMaxima

  method aptoParaJugar(unaPersona);
}

class JuegoDeMesa inherits Juego{
  override method aptoParaJugar(unaPersona) = unaPersona.edad().between(self.edadMinima(), self.edadMaxima());
}

class Genero{
  var property titulo
  var property edadMinima

  method cumpleEdadRequerida(unaPersona) = unaPersona.edad().between(genero.edadMinima(), 80);
  
}

class Videojuego inherits Juego{
  var property genero
  var property consolasCompatibles

  method tieneConsolaCompatible(unaPersona) = consolasCompatibles.any{consolaCompatible => unaPersona.consolas().contains{consolaCompatible}};

  override method aptoParaJugar(unaPersona){
     return genero.cumpleEdadRequerida(unaPersona) && tieneConsolaCompatible(unaPersona);
  }

}

class Pelota inherits Juego{
  override method aptoParaJugar(unaPersona) = unaPersona.edad() > 1;
}