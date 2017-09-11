package ar.edu.unq.domino.EstadosDePedido

import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.domino.Pizzas.Pedido

@Accessors
class Preparando extends EstadoDePedido {

	override siguiente(Pedido pedido) {
		pedido.estado = pedido.formaDeRetiro.proximoEstado
	}

	override proximo() {
	}

	override previo() {
		this
	}

}
