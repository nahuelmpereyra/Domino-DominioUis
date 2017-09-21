package ar.edu.unq.domino.EstadosDePedido

import ar.edu.unq.domino.Mailing.GMailSender
import ar.edu.unq.domino.Pizzas.Pedido

class ListoParaEnviar extends EstadoDePedido {


	override siguiente(Pedido pedido) {
		super.siguiente(pedido)
//		GMailSender.config(new GMailSender("@gmail.com", "intercefaces2017"))
		GMailSender.instance.notificarPedidoEnViaje(pedido)
	}
	
	override proximo() {
		new EnViaje
	}

	override previo() {
		new Preparando
	}

}
