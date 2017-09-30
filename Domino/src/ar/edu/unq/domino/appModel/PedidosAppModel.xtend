package ar.edu.unq.domino.appModel

import ar.edu.unq.domino.Pizzas.Pedido
import ar.edu.unq.domino.repo.RepoPedidos
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class PedidosAppModel {

	Pedido examplePedidoAbierto = new Pedido
	List<Pedido> pedidosAbiertos
	Pedido pedidoAbiertoSeleccionado

	Pedido examplePedidoCerrado = new Pedido
	List<Pedido> pedidosCerrados
	Pedido pedidoCerradoSeleccionado

	def void search() {
		pedidosAbiertos = repoPedidos.buscarPedidosAbiertos()
		pedidosCerrados = repoPedidos.buscarPedidosCerrados()
	}

	// ********************************************************
	// ** Acciones Pedidos
	// ********************************************************
	def RepoPedidos getRepoPedidos() {
		ApplicationContext.instance.getSingleton(typeof(Pedido))
	}

	def cancelarPedido() {
		pedidoAbiertoSeleccionado.cancelar
	}

}
