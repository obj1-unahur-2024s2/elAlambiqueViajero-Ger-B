import alambique.*
import paises.*


object inscripcion {
	const property aceptados = []
	const property rechazados = [] 

	method inscribir(auto) {
		if(self.verifica(auto))
			aceptados.add(auto)
		else
			rechazados.add(auto)
	}

	method verifica(auto) = auto.puedeViajar(carrera.locacion())

	method replanificacion(destino) {
		carrera.locacion(destino)
	}
	method reInscribir() {
		const aux = []
		aux.addAll(aceptados)
		aux.addAll(rechazados)
		aceptados.clear()
		rechazados.clear()
		aux.forEach({a => self.inscribir(a)})
	}
}

object carrera {
	var property locacion = buenosAires
}