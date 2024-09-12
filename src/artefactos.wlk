object espada{
	var fueUsado = false

    method poder(personaje){
        //return if(fueUsado) poder else poder * 0.5
        //return poder * if(fueUsado) 0.5 else 1
        return personaje.poderBase() * self.factorPorUso()
    }

    method serUsado(){
        fueUsado = true
    }

    method factorPorUso(){
        return if(fueUsado) 0.5 else 1
        //return if(not fueUsado) 1 else 0.5
    }
}

object collar {
    var usos = 0

    method poder(personaje){
        return 3 + self.extraPorNivel(personaje)
    }

    method serUsado(){
        usos += 1
    }

    method extraPorNivel(personaje){
        return if(personaje.poderBase() > 6) usos else 0
    }

}

object armadura {
    //const poder = 6
    
    method poder(personaje){
        return 6
       //return poder
    }

    method serUsado(){
        //NO HACE NADA
    }

    
}

object libro {
    var hechizos = []
    
    method hechizos(_hechizos){
        hechizos = _hechizos
    }

    method poder(personaje){
        return if(self.quedanHechizos() ) self.hechizoActual().poderQueAporta(personaje) 
                else  0 
    }

    method quedanHechizos(){
        return not hechizos.isEmpty()
    }

    method serUsado(){

        hechizos.remove(self.hechizoActual())
        //NO HACE NADA
    }

    method hechizoActual(){
        return hechizos.head()
    }

}

object bendicion{
    method poderQueAporta(personaje){
        return 4
    }
}

object invisibilidad{
    method poderQueAporta(personaje){
        return personaje.poderBase()
    }
}

object invocacion{
    method poderQueAporta(personaje){
        return personaje.artefactoMasPoderosoEnMorada().poder(personaje)
    }
}
