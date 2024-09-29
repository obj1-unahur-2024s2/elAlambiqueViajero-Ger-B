import recuerdos.*
object luke {
    const lugaresVisitados = []

    method lugaresVisitados() = lugaresVisitados.asList()
     
    method recuerdoDelUltimoLugar() = lugaresVisitados.last().recuerdo()

    method cuantosLugaresVisito() = lugaresVisitados.size()

    method visitarLugar(destino, auto){
        if (auto.puedeViajar(destino))
            auto.viajar(destino)
            lugaresVisitados.add(destino)
    }
}

object alambique {
    var property esRapido = true 
    var combustible = 100
    method combustible() = combustible
    
    method puedeViajar(destino) = destino.condicionDeViaje()

    method viajar(destino) {
        combustible = 0.max(combustible - 25)
    } 
}