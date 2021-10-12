/* Recordar diferencia entre set y list
 * 
 * Set: Es un conjunto de algo sin importar el orden ni los repetidos
 * List: Lo mismo que las listas
 * 
 */

class CancionMelodica {
	var property cantidadNotas
	const property titulo = ""
	const fraseEstribillo = ""
	
	method esDificil() = cantidadNotas > 5
	method animarPublico() = "¡" + fraseEstribillo + "!"
}

class CancionRock{
	var property notaMasRepetida = ""
	const property titulo = ""
	
	method esDificil() = notaMasRepetida == "FA#"
}

class Banda{
	
	/* Defino el album como un conjunto de canciones (para un album creo que seria mas conveniente usar una lista) */
	const album = new Set()
	var property nombre = ""
	
	method mostrarCancionesDelAlbum() = 
		album.forEach{ cancion => console.println( "Cancion: "+ cancion.titulo() )}
	
	method agregarCancion(cancion) = album.add(cancion)
	
	/* Muy util ya que solo me tengo que centrar en el metodo esDificil en la instancia de la cancion */
	method cancionesDificiles() = 
		album.filter{ cancion => cancion.esDificil() }
	
	method titulosDelAlbum() = 
		album.map{ cancion => cancion.titulo() }
	
	method duracionAlbum() = 
		album.sum{ cancion => cancion.duracion() }
		
	method duracionAlbumConFold() = 
		album.fold(0,{ acum,cancion => acum + cancion.duracion() })
	
	method cancionLarga() = 
		album.find{ cancion => cancion.duracion() > 5 }
		
	/* Ordeno las canciones del album segun su duracion (de mayor a menor) */
	method ordenarAlbum() = 
		album.sortedBy{ cancion1, cancion2 => cancion1.duracion() < cancion2.duracion() }	
	
	/* Tambien me tengo que centrar en el metodo complejizar de la instancia */
	method complejizarCanciones(){
		album.forEach{ cancion => cancion.complejizar() }
	}
	
	/* Este utiliza diccionarios (hay que cambiar el album a la clase Diccionary) */
	method mostrarCancionYAutores(){
		album.forEach{ cancion, autor =>
			console.println(cancion.titulo() + " - " + autor.titulo() )
		}
	}

}


/* 
 * Query 1: Creo una banda y dos canciones y las agrego a su album
	const agapornis = new Banda(nombre="Agapornis")
	const todoCambio = new CancionMelodica(cantidadNotas = 3 , titulo = "Todo Cambio", fraseEstribillo = "De blanco y negro al color me converti")
	const jijiji = new CancionRock(notaMasRepetida = "FA#", titulo="Jijiji")

	agapornis.agregarCancion(todoCambio)
	agapornis.agregarCancion(jijiji)
*/
 
 
/* --------------------- Mensajes de coleccion --------------------- */

// Ver los metodos cancionesDificiles, titulosDelAlbum, duracionAlbum (ambos), cancionLarga,
// ordenarAlbum, complejizarCanciones
 
/* --------------------- Diccionario --------------------- */

// Se puede instanciar un diccionario y hacer cosas como lo siguiente:
// 	
// const todoCambio = new CancionMelodica(cantidadNotas = 3 , titulo = "Todo Cambio", fraseEstribillo = "De blanco y negro al color me converti")
// const camila = new Autor(nombre = "Camila")
//
// const album = new Diccionary()
// album.put(todoCambio,camila) 
 
 

 