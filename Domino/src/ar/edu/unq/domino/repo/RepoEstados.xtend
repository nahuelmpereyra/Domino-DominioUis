package ar.edu.unq.domino.repo

import org.uqbar.commons.model.annotations.Observable
import ar.edu.unq.domino.EstadosDePedido.EstadoDePedido
import org.uqbar.commons.model.CollectionBasedRepo
import ar.edu.unq.domino.EstadosDePedido.Preparando
import org.apache.commons.collections15.Predicate

@Observable
class RepoEstados extends CollectionBasedRepo<EstadoDePedido> {

	// ********************************************************
	// ** Altas y bajas
	// ********************************************************
	def create2(EstadoDePedido estado) {
		this.create(estado)
		estado
	}

	def estados(){
		allInstances
	}
	
	def search(String nombre) {
		allInstances.filter[estado|this.match(nombre, estado.toString)].toList
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

