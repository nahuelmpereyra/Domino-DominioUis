package ar.edu.unq.domino.EstadosDePedido

class Entregado extends EstadoDePedido {
	
	new(){
		this.nombre = "Entregado"
	}

	override proximo() {
		this
	}

	override previo() {
		this
	}
	
	override toString() {
		"Entregado"
	}

}