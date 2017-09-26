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
import ar.edu.unq.domino.EstadosDePedido.Cancelado
import ar.edu.unq.domino.Pizzas.Plato
import ar.edu.unq.domino.repo.RepoPlatos
import ar.edu.unq.domino.EstadosDePedido.EstadoDePedido
import ar.edu.unq.domino.EstadosDePedido.Preparando
import ar.edu.unq.domino.repo.RepoEstados
import ar.edu.unq.domino.TamanioPizzas.TamanioPromo
import ar.edu.unq.domino.TamanioPizzas.Chica
import ar.edu.unq.domino.repo.RepoTamanios

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
	
	Plato examplePlato = new Plato
	List<Plato> resultadosPlato
	Plato platoSeleccionado
	
	EstadoDePedido exampleEstado = new Preparando
	List<EstadoDePedido> resultadosEstado
	EstadoDePedido estadoSeleccionado
	
	TamanioPromo exampleTamanio = new Chica
	List<TamanioPromo> resultadosTamanio
	TamanioPromo tamanioSeleccionado
	

	def void search() {
		resultadosIngrediente = repoIngredientes.search(exampleIngrediente.nombre)
		resultadosPromocion = repoPromociones.search(examplePromocion.nombrePromo)
		resultadosCliente   = repoClientes.search(exampleCliente.nick)
		resultadosPedidosAbiertos   = repoPedidos.buscarPedidosAbiertos()
		resultadosPedidosCerrados= repoPedidos.buscarPedidosCerrados()
		resultadosPlato = repoPlatos.search(examplePlato.nombre)
		resultadosEstado = repoEstados.search(exampleEstado.nombre)
		resultadosTamanio = repoTamanios.search(exampleTamanio.nombre)
		
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
	def void clearPromocion() {
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
	
	def cancelarPedido() {
		pedidoSeleccionado.estado = new Cancelado
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
	
	// ********************************************************
	// ** Acciones Plato
	// ********************************************************
	def void clearPlato() {
		examplePlato = new Plato
		resultadosPlato = newArrayList
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
	
	// ********************************************************
	// ** Acciones Estados
	// ********************************************************
	def void clearEstado() {
		exampleEstado = new Preparando
		resultadosEstado = newArrayList
		estadoSeleccionado = null
	}

	def void eliminarEstadoSeleccionado() {
		getRepoEstados().delete(estadoSeleccionado)
		this.search()
		estadoSeleccionado = null
	}

	def RepoEstados getRepoEstados() {
		ApplicationContext.instance.getSingleton(typeof(EstadoDePedido))
	}
	
	// ********************************************************
	// ** Acciones Tamanios
	// ********************************************************
	def void clearTamanio() {
		exampleTamanio = new Chica
		resultadosTamanio = newArrayList
		tamanioSeleccionado = null
	}

	def void eliminarTamanioSeleccionado() {
		getRepoTamanios().delete(tamanioSeleccionado)
		this.search()
		tamanioSeleccionado = null
	}

	def RepoTamanios getRepoTamanios() {
		ApplicationContext.instance.getSingleton(typeof(TamanioPromo))
	}
	
}
