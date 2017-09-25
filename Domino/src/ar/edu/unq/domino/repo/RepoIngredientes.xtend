package ar.edu.unq.domino.repo

import ar.edu.unq.domino.Pizzas.Ingrediente
import org.uqbar.commons.model.CollectionBasedRepo
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.exceptions.UserException
import org.apache.commons.collections15.Predicate

@Observable
class RepoIngredientes extends CollectionBasedRepo<Ingrediente>{

	// ********************************************************
	// ** Altas y bajas
	// ********************************************************
	def void create(String iNombre, double iPrecio) {
		this.create(new Ingrediente => [
			nombre = iNombre
			precio = iPrecio
		])
	}

	override void validateCreate(Ingrediente ingrediente) {
		ingrediente.validar()
		validarIngredientesDuplicados(ingrediente)
	}
	
	def validarIngredientesDuplicados(Ingrediente ingrediente) {
		val nombre = ingrediente.nombre
		if (!this.search(nombre).isEmpty) {
			throw new UserException("Ya existe un ingrediente con el nombre: " + nombre)
		}
	}


	def search(String nombre) {
		allInstances.filter[ingrediente|this.match(nombre, ingrediente.nombre)].toList
	}

	def match(Object expectedValue, Object realValue) {
		if (expectedValue === null) {
			return true
		}
		if (realValue === null) {
			return false
		}
		realValue.toString().toLowerCase().contains(expectedValue.toString().toLowerCase())
	}		



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	

	

//	def actualizarIngrediente(Ingrediente ingrediente) {
//
//		if (ingrediente.nombre === null) {
//			// es un alta
//			ingredientes.add(ingrediente)
//		} 
//		/*
//		else {
//			// es una modificación
//			val ingredientePosta = doGetIngrediente(ingrediente)
//			ingredientePosta.reemplazarCon(ingrediente)
//		}
//		*/
//	}

	

	override createExample() {
		new Ingrediente
	}
	
	override getEntityType() {
		typeof(Ingrediente)
	}
	
	override def Predicate<Ingrediente> getCriterio(Ingrediente example) {
		null
	}
	
	

}
