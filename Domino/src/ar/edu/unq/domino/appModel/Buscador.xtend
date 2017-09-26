package ar.edu.unq.domino.appModel

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable
import ar.edu.unq.domino.Pizzas.Ingrediente
import java.io.Serializable
import ar.edu.unq.domino.Pizzas.Promocion
import ar.edu.unq.domino.repo.RepoIngredientes
import ar.edu.unq.domino.repo.RepoPromociones
import ar.edu.unq.domino.repo.RepoPedidos
import ar.edu.unq.domino.Pizzas.Pedido
import ar.edu.unq.domino.sistema.Cliente
import ar.edu.unq.domino.repo.RepoClientes

@Accessors
@Observable
class Buscador implements Serializable {

	Ingrediente exampleIngrediente = new Ingrediente
	List<Ingrediente> resultadosIngrediente
	Ingrediente ingredienteSeleccionado

	Promocion examplePromocion = new Promocion
	List<Promocion> resultadosPromocion
	Promocion promoSeleccionada
	
	Pedido examplePedido= new Pedido
	List<Pedido> resultadosPedidosAbiertos
	List<Pedido> resultadosPedidosCerrados
	Pedido pedidoSeleccionado
	
	
	Cliente exampleCliente= new Cliente
	List<Cliente> resultadosCliente
	Cliente clienteSeleccionado

	def void search() {
		resultadosIngrediente = repoIngredientes.search(exampleIngrediente.nombre)
		resultadosPromocion = repoPromociones.search(examplePromocion.nombrePromo)
		resultadosCliente   = repoClientes.search(exampleCliente.nick)
		resultadosPedidosAbiertos   = repoPedidos.buscarPedidosAbiertos()
		resultadosPedidosCerrados= repoPedidos.buscarPedidosCerrados()
		
	}

	// ********************************************************
	// ** Acciones Ingrediente
	// ********************************************************
	def void clearIngrediente() {
		exampleIngrediente = new Ingrediente
		resultadosIngrediente = newArrayList
		ingredienteSeleccionado = null
	}

	def void eliminarIngredienteSeleccionado() {
		getRepoIngredientes().delete(ingredienteSeleccionado)
		this.search()
		ingredienteSeleccionado = null
	}

	def RepoIngredientes getRepoIngredientes() {
		ApplicationContext.instance.getSingleton(typeof(Ingrediente))
	}

	// ********************************************************
	// ** Acciones Promocion
	// ********************************************************
	def void clear() {
		examplePromocion = new Promocion
		resultadosPromocion = newArrayList
		promoSeleccionada = null
	}

	def void eliminarPromocionSeleccionada() {
		getRepoPromociones().delete(promoSeleccionada)
		this.search()
		promoSeleccionada = null
	}

	def RepoPromociones getRepoPromociones() {
		ApplicationContext.instance.getSingleton(typeof(Promocion))
	}
	
	// ********************************************************
	// ** Acciones Pedidos
	// ********************************************************

	def RepoPedidos getRepoPedidos() {
		ApplicationContext.instance.getSingleton(typeof(Pedido))
	}
	
		def void clearPedido() {
		examplePedido = new Pedido
		resultadosPedidosAbiertos = newArrayList
		resultadosPedidosCerrados = newArrayList
		pedidoSeleccionado = null
	}

	def void eliminarPedidoSeleccionada() {
		getRepoPedidos().delete(pedidoSeleccionado)
		this.search()
		pedidoSeleccionado = null
	}
	
	// ********************************************************
	// ** Acciones Clientes
	// ********************************************************
		def RepoClientes getRepoClientes() {
		ApplicationContext.instance.getSingleton(typeof(Cliente))
	}
	
		def void clearCliente() {
		exampleCliente = new Cliente
		resultadosCliente = newArrayList
		clienteSeleccionado = null
	}

	def void eliminarClientesSeleccionada() {
		getRepoClientes().delete(clienteSeleccionado)
		this.search()
		clienteSeleccionado = null
	}
}
