package ar.edu.unq.domino.EstadosDePedido

import ar.edu.unq.domino.EstadosDePedido.EstadoDePedido
import org.uqbar.commons.model.exceptions.UserException

class Cancelado extends EstadoDePedido {
	
	new(){
		this.nombre = "Cancelado"
	}

	override proximo() {
		throw new UserException("El pedido ya se encuentra cancelado")
	}

	override previo() {
		throw new UserException("El pedido ya se encuentra cancelado")
	}
	
	override toString() {
		"Cancelado"
	}

}

	

