import huevosDePascua.*

object ana {
  const huevosComidos = []

  method comer(huevo) {
    huevosComidos.add(huevo)
  }

  method estaEnfermo() {
    return self.consumioMas5000() || self.consumioChocoBlanco()
  }

  method consumioMas5000() {
    return huevosComidos.sum({h => h.calorias()})  > 5000
  }

  method consumioChocoBlanco() {
    return huevosComidos.any({h => h.chocolateBlanco()})
  }



}

object jose {
  var ultimoHuevoComido = huevoMixto

  method comer(huevo) {
    ultimoHuevoComido = huevo    
  }

  method estaEnfermo() {
    return ultimoHuevoComido.chocolateAmargo()
  }
}

object tito {
  
  method comer(huevo) {
    
  }

  method estaEnfermo() = false 
}