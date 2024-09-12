import artefactos.*
import enemigos.*

/*
lista.head() //Devuelve el primer elemento de la lista.
lista.last()  //Devuelve el último elemento de una lista
lista.get(nro) //Devuelve el nro elemento dado (de 0 a size - 1), debe haber al menos nro elementos.
lista.reverse() //Devuelve una lista con los elementos invertidos de la original.

coleccion.asSet() / asList() //Devuelve una nueva colección pero como un conjunto o una lista (el orden de conjunto a lista no tiene reglas establecidas).
coleccion.clear() //Elimina todas las referecias de una colección (la vacía)

coleccion.copy() //Devuelve una copia de la lista.

coleccion.add(object) // agrega el elemento a la colección dada, en el casod e una lista lo agrega al final, si es un conjunto y ya estaba simplemente queda como está
coleccion.remove(object) // quita 1 una aparición del objeto de la colección si existiese (si no está no hace nada), si hay más de 1 queda una menos.

coleccion.addAll(coleccion) //Agrega todos los elementos de una colección dada.
coleccion.removeAll(coleccion) //Quita todos los elementos de una colección dada 1 vez.

coleccion.contains(cosa) // Indica si existe el objeto en la colección dada al menos 1 vez.

coleccion.isEmpty() //Indica si una colección está vacía, es equivalente a "coleccion.size() > 0".

coleccion.size() // consulta el tamaño de la colección

coleccion.count({cosa => cosa.esGrande()}) //Cuenta cuantos elementos son grandes (consulta booleana)!

coleccion.any({cosa => cosa.esGrande()}) //Consulta si existe algún objeto que cumpla la caracteristicad dada (consulta booleana).
coleccion.all({cosa => cosa.esGigante()}) //Consulta si todos los objetos que cumplen la caracteristicad dada (consulta booleana).

coleccion.min() // el objeto que es el máximo para objetos "ordenables".
coleccion.max() // el objeto que es el mínimo para objetos "ordenables".

coleccion.min({objeto => objeto.caracteristicaOrdenable()}) // el objeto que es el maximo según la carácteristica ordenable, no da el valor máximo si no el objeto!
coleccion.max({objeto => objeto.caracteristicaOrdenable()}) // el objeto que es el mínimo según la carácteristica ordenable, no da el valor mínimo si no el objeto!

coleccion.find({cosa => cosa.esRosa()}) // encuentra y devuelve la "primer" cosa rosa.

coleccion.anyOne() //Devuelve cualquier elemento de la colección (NO DEBE ESTÁR VACÍA).

occurrencesOf(object) //Indica la cantidad de veces que aparece un objeto dado.

coleccion.map({cosa => cosa.relleno()}) // Transforma una colección en un lista 1 a 1 con la caracteristica / consulta dada (una lista con el relleno de cada cosa).

coleccion.forEach({cosa => cosa.hacer()}) //Realiza las ordene con cada elemento de la colección (si se usa para consulta es un mal uso!).

https://www.wollok.org/documentation/language/#wollok.lang.Collection
*/

object castillo {
	const property artefactos = #{}
	//castillo.artefactos().size() // X X X NOOOO por fuera del dueño.

	method artefactoMasPoderoso(personaje){
		return artefactos.max({artefacto => artefacto.poder(personaje)})
	}

	method nroArtefactos(){
		return artefactos.size()
	}

	method estaVacio(){
		return artefactos.isEmpty()
	}

	//X castillo.artefactos().clear() X
	//method vaciarCastillo(){
	//	artefactos.clear() // ✓  ✓  ✓
	//}

	method agregarArtefacto(artefacto){
		artefactos.add(artefacto)	
	}

	method agregarArtefactos(_artefactos) {
		artefactos.addAll(_artefactos)		
	}
	
}

object rolando {
	const property artefactos = #{}
	var property capacidad = 2
	const casa = castillo
	const property historia = []
	var poderBase = 5

	method tieneArmaFatal(enemigo){
		return artefactos.any({artefacto => artefacto.poder(self) > enemigo.poderDePelea()})
	}

	method armaFatal(enemigo){
		return artefactos.find({artefacto => artefacto.poder(self) > enemigo.poderDePelea()})
	}

	method poderBase(_poderBase){ //Se agregó para el diseño de los test.
		poderBase = _poderBase
	}

	method puedeVencer(enemigo){
		return self.poderDePelea() > enemigo.poderDePelea()
	}

	method artefactoMasPoderosoEnMorada(){
		return casa.artefactoMasPoderoso(self)
	}

	method luchar(){
		self.usarArtefactos()
		poderBase += 1
	}

	method usarArtefactos(){
		artefactos.forEach({artefacto => artefacto.serUsado() })
	}

	method poderBase(){
		return poderBase
	} 

	method poderArtefactos(){
		return artefactos.sum({artefacto => artefacto.poder(self)})
	}

	method poderDePelea(){
		return poderBase + self.poderArtefactos()
	}

	method encontrar(artefacto) {
		if(artefactos.size() < capacidad) {
			artefactos.add(artefacto)
		}
		historia.add(artefacto)
	}
	
	method volverACasa() {
		casa.agregarArtefactos(artefactos)
		artefactos.clear()
	}	
	
	method posesiones() {
		return self.artefactos() + casa.artefactos()
	}
	
	method posee(artefacto) {
		return self.posesiones().contains(artefacto)	
	}
		
}

