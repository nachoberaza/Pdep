class Pedido {
  var faldas
  var blusas
  var shorts
  method tiempoDeConfeccion(){
    var tiempoTotal = 0
    faldas.forEach({falda =>
      tiempoTotal += falda.tiempo()})
    blusas.forEach({blusa =>
      tiempoTotal += blusa.tiempo()})
    shorts.forEach({short =>
      tiempoTotal += short.tiempo()})
    return tiempoTotal
  }
}

/* Prendas */
class FaldaModal {
  method tiempo(){
    return 120
  }
}

class BlusaModal {
  var cantBotones
  method tiempo(){
    return 200 + cantBotones * 5
  }
}

class ShortModal {
  var tiempoNecesario
  method tiempo(){
    return tiempo
  }
}

class FaldaLycra {
  method tiempo(){
    return 120 * 1.2
  }
}

class BlusaLycra {
  var cantBotones
  method tiempo(){
    return (200 + cantBotones * 5) * 1.2
  }
}

class ShortLycra {
  var tiempoNecesario
  method tiempo(){
    return tiempoNecesario * 1.2
  }
}

class FaldaDenim {
  method tiempo(){
    return 120 + 25
  }
}

class BlusaDenim {
  var cantBotones
  method tiempo(){
    return 200 + cantBotones * 5 + 25
  }
}

class ShortDenim {
  var tiempoNecesario
  method tiempo(){
    return tiempoNecesario + 25
  }
}

// 1. Falso. Es correcto el uso del polimorfismo ya que cualquier prenda puede ser intercambiada sin que un tercero que la utilice se vea afectado.

// 2. Falso. Hay repeticion de logica ya que siempre se retorna 120 mas alguna operacion.

// 3. Falso. Si bien soluciona gran parte de la logica repetida, se debe acompañar de polimorfismo. 

// 4. 

// 5.

