package ar.edu.unq.domino.EstadosDePedido

import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.domino.Pizzas.Pedido
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@TransactionalAndObservable
@Accessors
abstract class EstadoDePedido extends Entity implements Cloneable{
	
	String nombre

	def void siguiente(Pedido pedido) {
		pedido.estado = this.proximo()

	}

	def void anterior(Pedido pedido) {
		pedido.estado = this.previo()

	}

	def EstadoDePedido proximo()

	def EstadoDePedido previo()

}
