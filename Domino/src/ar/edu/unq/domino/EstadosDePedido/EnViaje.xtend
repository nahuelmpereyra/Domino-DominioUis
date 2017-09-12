package ar.edu.unq.domino.EstadosDePedido

import ar.edu.unq.domino.Pizzas.Pedido
import ar.edu.unq.domino.Mailing.MailDemorado

class EnViaje extends EstadoDePedido {

	override siguiente(Pedido pedido) {
		pedido.notificador.estrategiaMailing = new MailDemorado()
		super.siguiente(pedido)
		pedido.changed()
		pedido.notifyObservers()
		
	}

	override proximo() {
		new Entregado
	}

	override previo() {
		new ListoParaEnviar
	}

}
