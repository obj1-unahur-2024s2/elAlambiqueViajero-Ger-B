import paises.*

object luke {
    const property lugaresVisitados = []
    const property recuerdos = []
     
    method recuerdoDelUltimoLugar() = lugaresVisitados.last().recuerdo()

    method cuantosLugaresVisito() = lugaresVisitados.size()

    method cantidadDeRecuerdos() = recuerdos.size()

    method visitarLugar(destino, auto){
        if (auto.puedeViajar(destino)){
            auto.viajar(destino)
            lugaresVisitados.add(destino)
            if (self.cantidadDeRecuerdos() > 2){
                recuerdos.remove(recuerdos.filter({r => r != recuerdos.last()}).any())
                recuerdos.add(destino.recuerdo())
            }
        }
    }           
}

object alambique {
    var property esRapido = true 
    var combustible = 100
    var cantViajes = 0
    method combustible() = combustible
    
    method puedeViajar(destino) = destino.condicionDeViaje()

    method viajar(destino) {
        combustible = 0.max(combustible - 25)
        if(cantViajes > 2) 
            esRapido = not esRapido
        cantViajes = cantViajes + 1
    } 
}