package ar.edu.unq.domino.EstadosDePedido

import ar.edu.unq.domino.Pizzas.Pedido
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.exceptions.UserException

@TransactionalAndObservable
@Accessors
class Preparando extends EstadoDePedido {

	new() {
		this.nombre = "preparando"
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
