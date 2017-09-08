package ar.edu.unq.domino.EstadosDePedido

import ar.edu.unq.domino.EstadosDePedido.EstadoDePedido

class Cancelado extends EstadoDePedido {

	override proximo() {
		this
	}

	override previo() {
		this
	}

}
