package ar.edu.unq.domino.Mailing

import ar.edu.unq.domino.Pizzas.Pedido

interface EstrategiaMail {
	
	def void notificar(Pedido pedido, Notificador notificador)
	
}
