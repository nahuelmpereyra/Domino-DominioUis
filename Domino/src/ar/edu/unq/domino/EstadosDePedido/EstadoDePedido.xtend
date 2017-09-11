package ar.edu.unq.domino.EstadosDePedido

import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.domino.Pizzas.Pedido

@Accessors
abstract class EstadoDePedido {

	def void siguiente(Pedido pedido) {
		pedido.estado = this.proximo()

	}

	def void anterior(Pedido pedido) {
		pedido.estado = this.previo()

	}

	def EstadoDePedido proximo()

	def EstadoDePedido previo()

}
