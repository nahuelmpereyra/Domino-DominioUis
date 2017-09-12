package ar.edu.unq.domino.Mailing

import ar.edu.unq.domino.Pizzas.Pedido

class MailEnViaje implements EstrategiaMail {
	
	
	
	override notificar(Pedido pedido, Notificador notificador) {
		
		notificador.notificarPedidoEnViaje(pedido)
	}
	
}
