package ar.edu.unq.domino.EstadosDePedido

import ar.edu.unq.domino.Pizzas.Pedido

class ListoParaEnviar extends EstadoDePedido {


	override siguiente(Pedido pedido) {
		super.siguiente(pedido)
		pedido.changed()
		pedido.notifyObservers()
		
	}
	
	override proximo() {
		new EnViaje
	}

	override previo() {
		new Preparando
	}

}
