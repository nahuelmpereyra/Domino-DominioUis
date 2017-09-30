package ar.edu.unq.domino.EstadosDePedido

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.exceptions.UserException

@TransactionalAndObservable
@Accessors
class Entregado extends EstadoDePedido {

	new() {
		this.nombre = "Entregado"
	}

	override proximo() {
		throw new UserException("El pedido ya se encuentra entregado")
	}

	override previo() {
		throw new UserException("El pedido ya se encuentra entregado")
	}
	
	override esCerrado() {
		true
	}

}
