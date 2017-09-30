package ar.edu.unq.domino.appModel

import ar.edu.unq.domino.Pizzas.Pedido
import ar.edu.unq.domino.Pizzas.Plato
import ar.edu.unq.domino.repo.RepoPedidos
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable

class EditarPedidoAppModel {
	
	Pedido pedidoSeleccionado
	Plato platoSeleccionado
	
	new(Pedido pedido) {
		pedidoSeleccionado=pedido
	}
	
	def void eliminarPlatoSeleccionado() {
		getRepoPedidos().allInstances.findFirst[pedido|pedidoSeleccionado == pedido].quitarPlato(platoSeleccionado)
	}
	
		def RepoPedidos getRepoPedidos() {
		ApplicationContext.instance.getSingleton(typeof(Pedido))
	}
	
}