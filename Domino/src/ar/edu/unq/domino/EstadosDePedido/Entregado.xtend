package ar.edu.unq.domino.EstadosDePedido

import org.uqbar.commons.model.exceptions.UserException

class Entregado extends EstadoDePedido {
	
	new(){
		this.nombre = "Entregado"
	}

	override proximo() {
		throw new UserException("El pedido ya se encuentra entregado")
	}

	override previo() {
		throw new UserException("El pedido ya se encuentra entregado")
	}
	
	override toString() {
		"Entregado"
	}

}