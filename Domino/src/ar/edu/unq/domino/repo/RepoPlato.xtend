package ar.edu.unq.domino.repo

import org.uqbar.commons.model.CollectionBasedRepo
import ar.edu.unq.domino.Pizzas.Plato
import org.uqbar.commons.model.annotations.Observable
import ar.edu.unq.domino.Pizzas.Promocion
import ar.edu.unq.domino.TamanioPizzas.TamanioPromo
import ar.edu.unq.domino.Pizzas.IngredientesExtras

//Creo el repo de Plato xq de alguna forma tengo q guardar el plato q agrego en AgregarPlato 

@Observable
class RepoPlato extends CollectionBasedRepo<Plato> {
	
	def void create(String pNombre, Promocion pPromo, TamanioPromo pTamanio, IngredientesExtras pIngredientesExtras){
		this.create(new Plato => [
			nombre = pNombre
			promo = pPromo
			tamanio = pTamanio
			ingredientesExtras = pIngredientesExtras	
		])
	}

	
	override protected getCriterio(Plato example) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override createExample() {
		new Plato("nuevo")
	}
	
	override getEntityType() {
		typeof(Plato)
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
	
/* 	def update(Promocion newPromo, TamanioPromo newTamanio, IngredientesExtras newIngr){
		
		promo = newPromo
		tamanio = newTamanio
		ingredientesExtras = newIngr
		
	}*/
	
	
}