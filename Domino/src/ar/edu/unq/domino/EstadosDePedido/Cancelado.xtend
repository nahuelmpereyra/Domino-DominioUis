package ar.edu.unq.domino.EstadosDePedido

import ar.edu.unq.domino.EstadosDePedido.EstadoDePedido

class Cancelado extends EstadoDePedido {
	
	new(){
		this.nombre = "Cancelado"
	}

	override proximo() {
		throw new RuntimeException("El pedido ya se encuentra cancelado")
	}

	override previo() {
		throw new RuntimeException("El pedido ya se encuentra cancelado")
	}
	
	override toString() {
		"Cancelado"
	}

}

	

