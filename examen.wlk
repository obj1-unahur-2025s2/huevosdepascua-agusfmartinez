object huevoRepostero {
    method chocolateBlanco() = true
    method chocolateAmargo() = false

    method calorias() = 750
}

object huevoMixto {
    method chocolateBlanco() = true
    method chocolateAmargo() = false

    method caloriasChocoBlanco() = 500
    method caloriasChocoAmargo() = 400

    method calorias() = self.caloriasChocoBlanco() + self.caloriasChocoAmargo()  
}

object conejo {
    var property peso = 1
    method chocolateBlanco() = false
    method chocolateAmargo() = true

    method calorias() = peso * 10

}

object blisterHuevitos {
    var property huevitos = 10
    method chocolateBlanco() = huevitos >= 5
    method chocolateAmargo() = true

    method calorias() = huevitos * 100 + huevitos.div(5) *150

}

object matrioshka {
    var property huevoInterior = huevoRepostero
    var property decoracion = flor
    method chocolateBlanco() = false
    method chocolateAmargo() = true

    method calorias() = 3000 + huevoInterior.calorias() + decoracion.calorias()

}

object flor {
    var property petalos = 5

    method calorias() = petalos * 100
}

object arbol {

    method calorias() = 150
}

object ana {
    const huevosComidos = []

    method comerHuevo(huevo) {
        huevosComidos.add(huevo)    
    }

    method consumio5000Calorias() {
        return huevosComidos.count({h => h.calorias()}) > 5000
    }

    method consumioChocoBlanco() {
        return huevosComidos.any({h => h.chocoBlanco()})
    }

    method estaEnfermo(){
        return self.consumio5000Calorias() or self.consumioChocoBlanco()
    }
}

object jose {
    var property ultimoHuevoComido = 0

    method comerHuevo(huevo) {
        ultimoHuevoComido = huevo
    }

    method estaEnfermo(){
        return self.ultimoHuevoComido().chocolateAmargo()
    }

}

object tito {
    var property ultimoHuevoComido = 0

    method comerHuevo(huevo) {
        ultimoHuevoComido = huevo
    }

    method estaEnfermo(){
        return false
    }

}


object caceria {
    const huevosEncontrados = []
    const huevosNoEncontrados = [huevoMixto, conejo, blisterHuevitos, matrioshka]

    method faltanEncontrar() {
        return huevosNoEncontrados.size()
    }

    method huevoNoEncontrado(huevo){
        return huevosNoEncontrados.contains(huevo)
    }

    method encontrarHuevo(chico,huevo){
        if(!chico.estaEnfermo()) {
            chico.comerHuevo(huevo)
            huevosNoEncontrados.remove(huevo)
            huevosEncontrados.add(huevo)
        }
    }

    method encontrarPrimerHuevo(chico){
        self.encontrarHuevo(chico, huevosNoEncontrados.first())
    }

    method encontrarTodosLosHuevos(chico) {
        huevosNoEncontrados.forEach({h => self.encontrarHuevo(chico,h)})
        
    }

    method encontrarLosDeChocoBlanco() {
        return huevosNoEncontrados.filter({h => h.chocolateBlanco()})
    }

    method encontrarElDeMasCalorias(){
        return huevosNoEncontrados.max({h => h.calorias()})
    }
    

    




}