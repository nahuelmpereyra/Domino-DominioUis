package ar.edu.unq.domino.EstadosDePedido

import org.uqbar.commons.model.exceptions.UserException

class Cancelado extends EstadoDePedido {

	new() {
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
	
	override esCerrado() {
		true
	}

}
