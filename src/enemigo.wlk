object erethia{
    const habitantes = #{ archibaldo, astra, caterina}

    method poderoso(personaje){
        return habitantes.all({habitante => personaje.puedeVencer(habitante)})
    }

    method conquistables(personaje){
        return self.vencibles(personaje).map({habitante => habitante.casa()}).asSet()
    }

/*
    MAP -> SIEMPRE SIEMRPE DEVUELVE UNA LISTA!!!!
    ->#{ archibaldo, astra, caterina} -> MAP -> [astra, caterina].asSet()
    -#{4, 4} ->#{4} No devuelve un set porque la transformación es 1 a 1 y un set no lo puede asegurar porque elimina repetidos!!!
*/

    method vencibles(personaje){
        return habitantes.filter({habitante => personaje.puedeVencer(habitante)})
    }
    
}

object palacioDeMarmol{}
object fortalezaDeAcero{}

object torreDeMarfil{}

object archibaldo{
    const property casa = palacioDeMarmol
    
    method poderDePelea(){
        return 16
    }
}

object caterina{
    const property casa = fortalezaDeAcero
    
    method poderDePelea(){
        return 28
    }
}

object astra{
    const property casa = torreDeMarfil
    
    method poderDePelea(){
        return 14
    }
}
