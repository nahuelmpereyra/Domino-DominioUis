package ar.edu.unq.domino.repo

import ar.edu.unq.domino.Pizzas.Ingrediente
import org.uqbar.commons.model.CollectionBasedRepo
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.exceptions.UserException
import org.apache.commons.collections15.Predicate
import ar.edu.unq.domino.distribuciones.DistribucionPizza
import ar.edu.unq.domino.distribuciones.MitadDerecha
import ar.edu.unq.domino.distribuciones.MitadIzquierda
import ar.edu.unq.domino.distribuciones.Toda

@Observable
class RepoDistribuciones extends CollectionBasedRepo<DistribucionPizza> {

	// ********************************************************
	// ** Altas y bajas
	// ********************************************************
	def createToda() {
		this.create(new Toda)

	}

	def createMitadDerecha() {
		this.create(new MitadDerecha)

	}

	def createMitadIzquierda() {
		this.create(new MitadIzquierda)

	}


	def search(String nombre) {
		allInstances.filter[distribuciones|this.match(nombre, distribuciones.nombre)].toList
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
		new Toda
	}

	override getEntityType() {
		typeof(DistribucionPizza)
	}

	override def Predicate<DistribucionPizza> getCriterio(DistribucionPizza example) {
		null
	}
	
	def distribuciones(){
		allInstances
	}

}
