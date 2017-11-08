package ar.edu.unq.domino.repo

import ar.edu.unq.domino.Pizzas.IngredientesExtras
import ar.edu.unq.domino.Pizzas.Promocion
import org.apache.commons.collections15.Predicate
import org.uqbar.commons.model.CollectionBasedRepo
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.exceptions.UserException

@Observable
class RepoPromociones extends CollectionBasedRepo<Promocion> {

	// ********************************************************
	// ** Altas y bajas
	// ********************************************************
	def void create(String pNombre, double pPrecio, IngredientesExtras extras) {
		this.create(new Promocion => [
			nombrePromo = pNombre
			precioBase = pPrecio
			ingredientesBase = extras
		])
	}

	override void validateCreate(Promocion promocion) {
		promocion.validar()
		validarPromocionesDuplicadas(promocion)
	}

	def validarPromocionesDuplicadas(Promocion promocion) {
		val nombre = promocion.nombrePromo
		if (!this.search(nombre).isEmpty) {
			throw new UserException("Ya existe una promoción con el nombre: " + nombre)
		}
	}

	def search(String nombre) {
		allInstances.filter[promocion|this.match(nombre, promocion.nombrePromo)].toList

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
		new Promocion
	}

	override getEntityType() {
		typeof(Promocion)
	}

	override def Predicate<Promocion> getCriterio(Promocion example) {
		null
	}

	def promociones() {
		allInstances
	}

}
