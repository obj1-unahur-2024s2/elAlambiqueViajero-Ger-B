import paises.*

object luke {
    const property lugaresVisitados = []
    const property recuerdos = []
     
    method recuerdoDelUltimoLugar() = lugaresVisitados.last().recuerdo()

    method cuantosLugaresVisito() = lugaresVisitados.size()

    method cantidadDeRecuerdos() = recuerdos.size()

    method visitarLugar(destino, auto){
        if (auto.puedeViajar(destino)){
            auto.viajar()
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

    method viajar() {
        combustible = 0.max(combustible - 25)
        if(cantViajes == 2) 
            esRapido = not esRapido
        cantViajes = cantViajes + 1
    } 
}

object superChatarra {
    var municiones = 40
    var combustible = 100
    method combustible() = combustible

    var property esRapido = true 

    method puedeViajar(destino) = destino.condicionDeViaje() and municiones != 0

    method viajar() {
        municiones = 0.max(municiones - 15)
        //A menos munciones tiene, mas lijero, gasta menos combustible
        combustible = 0.max(combustible - municiones * 2) 
    }

}
object antiguallaBlindada {
    var gansters = 7
    var combustible = 100
    var property esRapido = true 

    method puedeViajar(destino) = destino.condicionDeViaje() and gansters > 5

    method viajar() {
        gansters = 0.max(gansters - 1)
        combustible = 0.max(combustible - 25)
        if(gansters == 6)
            esRapido = not esRapido
    }
}
object superConvertible {
    var property descapotado = true
    var property esRapido = true
    var combustible = 100
    
    method puedeViajar(destino) = destino.condicionDeViaje()

    method viajar() {
        if (descapotado)
            combustible = 0.max(combustible - 35)
        else
        // Es mas eficiente con el techo colocado
            combustible = 0.max(combustible - 15)
    }
}