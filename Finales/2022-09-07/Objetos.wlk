class Personaje{
  const enemigos = #{}

  method recibirDanio(cantidad){
    /* Asumir que funciona */
  }

  method agregarEnemigo(personaje){
    enemigos.add(personaje)
  }
}

class Arma {
  var property danioBase
  var property armaDeEfecto
}

class Villano inherits Personaje{
  var property arma

  method danioDeArma(){
    return arma.danioBase() / arma.areaDeEfecto()
  }

  method atacar(personaje){
    personaje.recibirDanio(self.danioDeArma())
    personaje.agregarEnemigo(self)
  }
}

class Heroe inherits Personaje{
  const habilidades = #{}
  const aliados = #{}

  method atacar(personaje){
    if (not enemigos.contains(personaje)){
      return "El personaje atacado no es un enemigo"
    }

    personaje.recibirDanio(self.poder())
    personaje.agregarEnemigo(self)
  }

  method poder() = aliados.size() * habilidades.sum({h => h.poder()})
}

class Habilidad{
  var property poder
}

/* Consignas */

// 1. Responder verdadero o falso
//  a. El ataque de un heroe no maneja correctamente el caso de atacar a un personaje que no es enemigo
//  b. Hay logica comun entre villanos y heroes que podria generalizarse.
//  c. No hay problemas de delegacion en la solucion.
//  d. Los heroes son polimorficos con las habilidades, ya que ambos entienden el mensaje poder().
//  e. Para que un heroe se convierta en villano alcanza con instanciar villano, inicializandolo con el arma que corresponda y los enemigos que tenia la instancia original de la clase Heroe.

// 2. Proponer una solucion alternativa realizando las mejoras que consideres apropiadas en base a las observaciones del punto anterior.

/* Respuestas */
// 1. a. Falso. El heroe si maneja bien el ataque a un personaje aliado. Esto ya que valida bien que el aliado no se encuentre en la lista de enemigos
// antes de efectuar el ataque

// 1. b. Verdadero. El heroe y villano comparten el hacer uso de los mensajes recibirDanio(personaje) y agregarEnemigo(personaje), lo que podria generalizarse 
// en un mensaje comun.

// 1. c. Falso. Si hay problemas de delegacion, ya que en el villano se calcula el danio de la arma con un mensaje del villano pero deberia ser
// un mensaje de la propia arma.

// 1. d. Verdadero. Ambas clases tienen definido el mensaje poder() y con distinto comportamiento, por lo que ambos son polimorficos.

// 1. e. Falso. Al hacer lo que se pide, se estaria creando un nuevo villano,
// no cambiando el heroe. Para solucionar esto, se puede utilizar composicion en lugar de herencia con el bando del personaje.



// 2. 

class Personaje{
  const enemigos = #{}
  var property bando

  method recibirDanio(cantidad){
    /* Asumir que funciona */
  }

  method agregarEnemigo(personaje){
    enemigos.add(personaje)
  }

  method atacar(personaje){
    rol.atacar(personaje)
    rol.efectuarAtaque(personaje)
  }

  method efectuarAtaque(personaje){
    personaje.recibirDanio(self.poder())
    personaje.agregarEnemigo(self)
  }
}

object heroe {
  const habilidades = #{}
  const aliados = #{}

  method esAliado(personaje) = not enemigos.contains(personaje)
  
  method atacar(personaje){   
    if (self.esAliado(personaje)){
      return "El personaje atacado no es un enemigo"
    }
  }
  
  method poder() = aliados.size() * habilidades.sum({h => h.poder()})
}

object villano {}

class Arma {
  var property danioBase
  var property armaDeEfecto

  method danio(){
    return arma.danioBase() / arma.areaDeEfecto()
  }
}