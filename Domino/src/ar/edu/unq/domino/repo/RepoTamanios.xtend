package ar.edu.unq.domino.repo

import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.CollectionBasedRepo
import org.apache.commons.collections15.Predicate
import ar.edu.unq.domino.TamanioPizzas.TamanioPromo
import ar.edu.unq.domino.TamanioPizzas.Chica

@Observable
class RepoTamanios extends CollectionBasedRepo<TamanioPromo> {

	// ********************************************************
	// ** Altas y bajas
	// ********************************************************
	def create2(TamanioPromo tamanio) {
		this.create(tamanio)
		tamanio
	}

	def tamanios(){
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
		new Chica
	}

	override getEntityType() {
		typeof(TamanioPromo)
	}

	override def Predicate<TamanioPromo> getCriterio(TamanioPromo tamanio) {
		null
	}
	

}
