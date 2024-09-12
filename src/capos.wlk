import artefactos.*
import enemigos.*

/*
lista.tail()
lista.get(nro)
lista.head()
coleccion.isEmpty()

coleccion.min()
coleccion.max()

coleccion.min({})
coleccion.max({})

coleccion.remove(object)

coleccion.size()

coleccion.any({cosa => cosa.esGrande()})
coleccion.all({cosa => cosa.esGigante()}) //

coleccion.count({cosa => cosa.esGrande()}) //Cuenta cuantos elementos son grandes.

coleccion.map({cosa => cosa.relleno()}) //Una lista con el relleno de cada cosa.

coleccion.contains(cosa)

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

