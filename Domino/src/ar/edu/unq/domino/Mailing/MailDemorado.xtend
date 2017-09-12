package ar.edu.unq.domino.Mailing

import ar.edu.unq.domino.Pizzas.Pedido

class MailDemorado implements EstrategiaMail {
	
	override notificar(Pedido pedido, Notificador notificador) {
		
		if(pedido.demoroMasDe30Minutos){
			
		
		notificador.notificarPedidoDemorado(pedido)
		}
		
		
		
	}
	
}
