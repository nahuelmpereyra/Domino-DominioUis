package ar.edu.unq.domino.repo

import ar.edu.unq.domino.Pizzas.Pedido
import ar.edu.unq.domino.formasDeEnvio.FormaDeRetiro
import ar.edu.unq.domino.sistema.Cliente
import org.apache.commons.collections15.Predicate
import org.uqbar.commons.model.CollectionBasedRepo
import org.uqbar.commons.model.annotations.Observable
import ar.edu.unq.domino.EstadosDePedido.Cancelado
import ar.edu.unq.domino.EstadosDePedido.Entregado
import ar.edu.unq.domino.EstadosDePedido.EstadoDePedido
import ar.edu.unq.domino.Pizzas.Plato

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
			esCerrado = 1
			estado= new Cancelado
		])
	}

	// override void validateCreate(Pedido pedido) {
	// validarIngredientesDuplicados(ingrediente)
	// }
	// def search(Boolean esCerrado) {
	// allInstances.filter[pedido|this.match(esCerrado, pedido.esCerrado)].toList
	// }
	def buscarPedidosCerrados() {
		allInstances.filter[pedido|this.match(1, pedido.esCerrado)].toList
	}

	def buscarPedidosAbiertos() {
		allInstances.filter[pedido|this.match(0, pedido.esCerrado)].toList
	}

	def match(Object expectedValue, Object realValue) {
		if (expectedValue === null) {
			return true
		}
		if (realValue === null) {
			return false
		}
		realValue.toString().toLowerCase().equals(expectedValue.toString().toLowerCase())
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

}
