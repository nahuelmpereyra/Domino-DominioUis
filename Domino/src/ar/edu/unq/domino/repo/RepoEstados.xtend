package ar.edu.unq.domino.repo

import ar.edu.unq.domino.EstadosDePedido.Cancelado
import ar.edu.unq.domino.EstadosDePedido.EnViaje
import ar.edu.unq.domino.EstadosDePedido.Entregado
import ar.edu.unq.domino.EstadosDePedido.EstadoDePedido
import ar.edu.unq.domino.EstadosDePedido.ListoParaEnviar
import ar.edu.unq.domino.EstadosDePedido.Preparando
import org.apache.commons.collections15.Predicate
import org.uqbar.commons.model.CollectionBasedRepo
import org.uqbar.commons.model.annotations.Observable

@Observable
class RepoEstados extends CollectionBasedRepo<EstadoDePedido> {

	// ********************************************************
	// ** Altas y bajas
	// ********************************************************
	def createCancelado() {
		this.create(new Cancelado)

	}

	def createEntregado() {
		this.create(new Entregado)

	}

	def createEnViaje() {
		this.create(new EnViaje)

	}

	def createListoParaEnviar() {
		this.create(new ListoParaEnviar)

	}

	def createPreparando() {
		this.create(new Preparando)
	}

	def estados() {
		allInstances
	}

	def search(String nombre) {
		allInstances.filter[tamanio|this.match(nombre, tamanio.toString)].toList
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
		new Preparando
	}

	override getEntityType() {
		typeof(EstadoDePedido)
	}

	override def Predicate<EstadoDePedido> getCriterio(EstadoDePedido estado) {
		null
	}

}
