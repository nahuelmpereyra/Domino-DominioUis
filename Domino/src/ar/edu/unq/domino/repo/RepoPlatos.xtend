package ar.edu.unq.domino.repo

import org.uqbar.commons.model.CollectionBasedRepo
import org.uqbar.commons.model.annotations.Observable
import ar.edu.unq.domino.Pizzas.Plato
import ar.edu.unq.domino.Pizzas.IngredientesExtras
import ar.edu.unq.domino.Pizzas.Promocion
import ar.edu.unq.domino.TamanioPizzas.TamanioPromo

@Observable
class RepoPlatos extends CollectionBasedRepo<Plato> {
	
	//////
	///Creación de Platos
	/////
	
	def void create(String pNombre, Promocion pPromo, TamanioPromo pTamanio, IngredientesExtras pIngredientesExtras) {
		this.create(new Plato => [
			nombre = pNombre
			promo = pPromo
			tamanio = pTamanio
			ingredientesExtras = pIngredientesExtras
		])
	}
	
	def search(String nombre) {
		allInstances.filter[plato|this.match(nombre, plato.nombre)].toList
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
	
	override protected getCriterio(Plato example) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override createExample() {
		new Plato
	}
	
	override getEntityType() {
		typeof(Plato)
	}
	
}