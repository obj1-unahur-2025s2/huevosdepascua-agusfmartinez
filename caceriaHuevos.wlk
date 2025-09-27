import chicos.*
import huevosDePascua.*

object caceria {
  const huevosEncontrados = []
  const huevosNoEncontrados = []

  method inicializarJuego() {
    flor.petalos(7)
    blisterHuevitos.huevitos(14)
    matrioshka.decoracion(flor)
    matrioshka.huevoEnSuInterior(blisterHuevitos)
    huevosNoEncontrados.addAll([matrioshka, huevoRepostero, conejo, huevoMixto])
    
  }

  method cantidadAEncontrar() {
    return huevosNoEncontrados.size()
  }

  method cuantosChocoBlanco(){
    return huevosNoEncontrados.count({h => h.chocolateBlanco()})
  }

  method aunNoFueEncontrado(huevo) {
    return huevosNoEncontrados.contains(huevo)
  }

  method encontrarHuevo(chico, huevo) {
    chico.comer(huevo)
    huevosNoEncontrados.remove(huevo)
    huevosEncontrados.add(huevo)    
  }

  method encontrarPrimerHuevo(chico) {
    self.encontrarHuevo(chico, huevosNoEncontrados.first())
    
  }

  method encontrarRestantes(chico) {
    huevosNoEncontrados.forEach({h => self.encontrarHuevo(chico, h)})    
  }

  method huevosFaltantesBlancos(){
    return huevosNoEncontrados.filter({h => h.chocolateBlanco()})
  }

  method huevosEncontradosBlancos() {
    return huevosEncontrados.filter({h => h.chocolateBlanco()})
  }

  method NoEncontradoMayorCalorias() {
    return huevosNoEncontrados.max({h => h.calorias()})
  }


}