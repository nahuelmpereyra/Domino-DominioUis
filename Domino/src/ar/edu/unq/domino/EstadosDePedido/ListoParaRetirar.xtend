package ar.edu.unq.domino.EstadosDePedido

import ar.edu.unq.domino.Pizzas.Pedido

class ListoParaRetirar extends EstadoDePedido {

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

}
