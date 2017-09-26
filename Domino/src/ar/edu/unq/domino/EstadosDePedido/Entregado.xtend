package ar.edu.unq.domino.EstadosDePedido

class Entregado extends EstadoDePedido {
	
	new(){
		this.nombre = "Entregado"
	}

	override proximo() {
		throw new RuntimeException("El pedido ya se encuentra entregado")
	}

	override previo() {
		throw new RuntimeException("El pedido ya se encuentra entregado")
	}
	
	override toString() {
		"Entregado"
	}

}