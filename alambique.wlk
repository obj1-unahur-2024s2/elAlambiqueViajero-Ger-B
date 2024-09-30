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
    method municiones() = municiones

    var property esRapido = true 

    method puedeViajar(destino) = destino.condicionDeViaje() and municiones != 0

    method viajar() {
        combustible = 0.max(combustible - municiones) 
        //A menos munciones tiene, mas lijero, gasta menos combustible
        municiones = 0.max(municiones - 15)
    }

}
object antiguallaBlindada {
    var mafiosos = 7
    var combustible = 100
    var property esRapido = true 
    method combustible() = combustible 
    method mafiosos() = mafiosos 

    method puedeViajar(destino) = destino.condicionDeViaje() and mafiosos > 5

    method viajar() {
        mafiosos = 0.max(mafiosos - 1)
        combustible = 0.max(combustible - 25)
        if(mafiosos == 6)
            esRapido = not esRapido
    }
}
object superConvertible {
    var property descapotado = true
    const esRapido = not descapotado
    var combustible = 100
    method combustible() = combustible
    method esRapido() = esRapido

    method puedeViajar(destino) = destino.condicionDeViaje()

    method viajar() {
        if (descapotado)
            combustible = 0.max(combustible - 35)
        else
        // Es mas eficiente con el techo colocado
            combustible = 0.max(combustible - 15)
    }
}