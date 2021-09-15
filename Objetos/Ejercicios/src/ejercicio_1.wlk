// Ejercicio 1
object pepita {
	// Energia de pepita expresada en joules */
	var energia = 1500

	var ubicacion = 0

	method cantar(){
		return "i'll sing a birdsong"
	}

	/** Cuando vuela consume un joule por cada km mas un costo fijo de 10 joule */
	method volar(cantKilometros) {
		energia = energia - (cantKilometros + 10)
		return energia
	}

	/** Cuando come adquiere 4 joules por cada gramo que come */
	method comer(cantGramosComidos) {
		energia = energia + 4*cantGramosComidos
	}
	
	method viajar(distancia){
		ubicacion = ubicacion + distancia
	}
	
	method darUbicacion() = ubicacion
	
	method puedeIr(distancia) {
		var llega = true
		if ( self.volar(distancia) < 0 )
			llega=false

		return llega
	}
}

// Ejercicio 2
class Gato {
	var property energia
	var property velocidad
	
	method comerRatones()
	
	method correr()
}

object tom inherits Gato {
	energia = 8
	velocidad = 8
}