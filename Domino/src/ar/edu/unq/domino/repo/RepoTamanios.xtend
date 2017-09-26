package ar.edu.unq.domino.repo

import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.CollectionBasedRepo
import org.apache.commons.collections15.Predicate
import ar.edu.unq.domino.TamanioPizzas.TamanioPromo
import ar.edu.unq.domino.TamanioPizzas.Chica
import ar.edu.unq.domino.TamanioPizzas.Grande
import ar.edu.unq.domino.TamanioPizzas.Porcion
import ar.edu.unq.domino.TamanioPizzas.Familiar

@Observable
class RepoTamanios extends CollectionBasedRepo<TamanioPromo> {

	// ********************************************************
	// ** Altas y bajas
	// ********************************************************
	def createChica() {
		this.create(new Chica)

	}

	def createFamiliar() {
		this.create(new Familiar)

	}

	def createGrande() {
		this.create(new Grande)

	}

	def createPorcion() {
		this.create(new Porcion)

	}

	def tamanios() {
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
