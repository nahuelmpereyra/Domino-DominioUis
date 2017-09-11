package ar.edu.unq.domino.EstadosDePedido

import ar.edu.unq.domino.Pizzas.Pedido

class EnViaje extends EstadoDePedido {

	override siguiente(Pedido pedido) {
		pedido.estado = this.proximo()
	}

	override proximo() {
		new Entregado
	}

	override previo() {
		new ListoParaEnviar
	}

}
