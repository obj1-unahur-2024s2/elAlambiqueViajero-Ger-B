import alambique.*
object paris {
    method recuerdo() = 'Torre Eiffel'
    method condicionDeViaje(auto) = auto.combustible() > 50 
}

object buenosAires {
    var property presidente = 'Milei'
    method recuerdo() = if(presidente == 'Milei') 'Mate sin yerba' else 'Mate con yerba'
    method condicionDeViaje(auto) = auto.esRapido()
}

object bagdad {
    const recuerdos = #{petroleoCrudo, armas, replicas, otraCosa}
    var epoca = 1300
    method epoca(anio){
        epoca = anio 
    } 
    method recuerdo() = recuerdos.find({r=>r.anio(epoca)})
    method condicionDeViaje(auto) = true
}

object vegas {
    var property paisConmemorado = buenosAires
    method recuerdo() = paisConmemorado.recuerdo()  
    method condicionDeViaje(auto) = paisConmemorado.condicionDeViaje(auto) 
}

object petroleoCrudo {
    method anio(epoca) = epoca.between(1200, 1500) 
}
object armas {
    method anio(epoca) = epoca.between(1500, 2000) 
}
object replicas {
    method anio(epoca) = epoca.between(2000, 2100) 
}
object otraCosa {
    method anio(epoca) = epoca > 2100 
}
