package ar.edu.unq.domino.appModel

import ar.edu.unq.domino.EstadosDePedido.Cancelado
import ar.edu.unq.domino.Pizzas.Pedido
import ar.edu.unq.domino.repo.RepoPedidos
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable
import ar.edu.unq.domino.Pizzas.Plato
import ar.edu.unq.domino.repo.RepoPlatos

@Accessors
@Observable
class PedidosAppModel {
	
	Pedido examplePedido = new Pedido
	List<Pedido> pedidosAbiertos
	List<Pedido> pedidosCerrados
	Pedido pedidoSeleccionado
	Plato examplePlato = new Plato
	List<Plato> platos
	Plato platoSeleccionado
	
	
	def void search() {
		pedidosAbiertos = repoPedidos.buscarPedidosAbiertos()
		pedidosCerrados = repoPedidos.buscarPedidosCerrados()
		platos = repoPlatos.search(examplePlato.nombre)
	}
	
	
	// ********************************************************
	// ** Acciones Pedidos
	// ********************************************************

	def RepoPedidos getRepoPedidos() {
		ApplicationContext.instance.getSingleton(typeof(Pedido))
	}
	
		def void clearPedido() {
		examplePedido = new Pedido
		pedidosAbiertos = newArrayList
		pedidosCerrados = newArrayList
		pedidoSeleccionado = null
	}

	def void eliminarPedidoSeleccionada() {
		getRepoPedidos().delete(pedidoSeleccionado)
		this.search()
		pedidoSeleccionado = null
	}
	
	def cancelarPedido() {
		pedidoSeleccionado.cancelar
	}
	
	// ********************************************************
	// ** Acciones Platos
	// ********************************************************
	
	def void clearPlato() {
		examplePlato = new Plato
		platos = newArrayList
		platoSeleccionado = null
	}

	def void eliminarPlatoSeleccionado() {
		getRepoPlatos().delete(platoSeleccionado)
		this.search()
		platoSeleccionado = null
	}

	def RepoPlatos getRepoPlatos() {
		ApplicationContext.instance.getSingleton(typeof(Plato))
	}
	
}