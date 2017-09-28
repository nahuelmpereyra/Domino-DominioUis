package ar.edu.unq.domino.EstadosDePedido

import ar.edu.unq.domino.Pizzas.Pedido
import ar.edu.unq.domino.Mailing.GMailSender

class ListoParaEnviar extends EstadoDePedido {

	new() {
		this.nombre = "Listo para enviar"
	}

	override siguiente(Pedido pedido) {
		super.siguiente(pedido)

		GMailSender.instance.notificarPedidoEnViaje(pedido)
	}

	override proximo() {
		new EnViaje
	}

	override previo() {
		new Preparando
	}

	override toString() {
		"Listo para enviar"
	}

}
