package ar.edu.unq.domino.EstadosDePedido

import ar.edu.unq.domino.Pizzas.Pedido

class ListoParaRetirar extends EstadoDePedido {

	new() {
		this.nombre = "Listo para retirar"
	}

	override siguiente(Pedido pedido) {
		pedido.estado = this.proximo
		pedido.esCerrado = 1
		pedido.setTiempoEspera()
	}

	override proximo() {
		new Entregado

	}

	override previo() {
		new Preparando
	}

	override toString() {
		"Listo para retirar"
	}

}
