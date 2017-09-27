package ar.edu.unq.domino.EstadosDePedido

import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.domino.Pizzas.Pedido
import org.uqbar.commons.model.exceptions.UserException

@Accessors
class Preparando extends EstadoDePedido {
	
	new(){
		this.nombre = "Preparando"
	}

	override siguiente(Pedido pedido) {
		pedido.estado = pedido.formaDeRetiro.proximoEstado
	}

	override proximo() {
	}

	override previo() {
		throw new UserException("El pedido ya se encuentra preparando")
	}
	
	override toString() {
		"Preparando"
	}

}
