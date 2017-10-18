package ar.edu.unq.domino.repo

import ar.edu.unq.domino.Pizzas.Pedido
import ar.edu.unq.domino.formasDeEnvio.FormaDeRetiro
import ar.edu.unq.domino.sistema.Cliente
import org.apache.commons.collections15.Predicate
import org.uqbar.commons.model.CollectionBasedRepo
import org.uqbar.commons.model.annotations.Observable
import ar.edu.unq.domino.EstadosDePedido.Cancelado

@Observable
class RepoPedidos extends CollectionBasedRepo<Pedido> {

	// ********************************************************
	// ** Altas y bajas
	// ********************************************************
	def void create(Cliente pCliente, FormaDeRetiro pFormaDeRetiro, String pAclaracion) {
		this.create(new Pedido => [
			cliente = pCliente
			formaDeRetiro = pFormaDeRetiro
			aclaracion = pAclaracion
			numero = allInstances.size + 1
		])
	}

	def void create2(Cliente pCliente, FormaDeRetiro pFormaDeRetiro, String pAclaracion) {
		this.create(new Pedido => [
			cliente = pCliente
			formaDeRetiro = pFormaDeRetiro
			aclaracion = pAclaracion
			numero = allInstances.size + 1
			estado = new Cancelado
		])
	}

	def buscarPedidosCerrados() {
		allInstances.filter[pedido|pedido.esCerrado].toList
	}

	def buscarPedidosAbiertos() {
		allInstances.filter[pedido|!pedido.esCerrado].toList
	}


	override createExample() {
		new Pedido
	}

	override getEntityType() {
		typeof(Pedido)
	}

	override def Predicate<Pedido> getCriterio(Pedido example) {
		null
	}
	
	def buscarPorEstado(String estado) {
		allInstances.filter[pedido|pedido.estado.nombre == estado].toList
	}

}
