object huevoRepostero {

    method chocolateBlanco() = true
    method chocolateAmargo() = false
    method calorias() = 750 

}

object huevoMixto {
    method caloriasChocoBlanco() = 500
    method caloriasChocoLeche() = 400
    method calorias() = self.caloriasChocoBlanco() + self.caloriasChocoLeche()
    method chocolateBlanco() = true
    method chocolateAmargo() = false
    
}

object conejo {
    var property peso = 10
    method chocolateBlanco() = false
    method chocolateAmargo() = true
    
    method calorias() = self.peso() * 10

}

object blisterHuevitos {
    var property huevitos = 3

    method calorias() = huevitos * 100 + huevitos.div(5) * 150 
    method chocolateBlanco() = huevitos >= 5
    method chocolateAmargo() = false
    
}

object matrioshka {
    var property huevoEnSuInterior = huevoMixto
    var property decoracion = flor 

    method calorias() = 3000 + huevoEnSuInterior.calorias() + decoracion.caloriasDeco()
    method chocolateBlanco() = huevoEnSuInterior.chocolateBlanco()
    method chocolateAmargo() = true
    

}

object flor {
    var property petalos = 5 
    method caloriasDeco() = petalos * 100
}

object arbol {
    method caloriasDeco() = 150
}
