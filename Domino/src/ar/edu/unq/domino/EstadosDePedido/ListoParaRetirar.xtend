package ar.edu.unq.domino.EstadosDePedido

import ar.edu.unq.domino.Pizzas.Pedido
import java.time.LocalDateTime

class ListoParaRetirar extends EstadoDePedido {

	new() {
		this.nombre = "listopararetirar"
	}

	override siguiente(Pedido pedido) {
		pedido.estado = this.proximo
		pedido.fechaFinPedido = LocalDateTime.now
	}

	override proximo() {
		new Entregado
	}

	override previo() {
		new Preparando
	}

}
