package ar.edu.unq.domino.repo

import ar.edu.unq.domino.Pizzas.Ingrediente
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RepoIngredientes {

	List<Ingrediente> ingredientes

	private static RepoIngredientes instance = null

	private new() {
		ingredientes = newArrayList
		createIfNotExists(createIngrediente("Jamon", 5.0))
		createIfNotExists(createIngrediente("Queso", 2.50))
		createIfNotExists(createIngrediente("Morron", 6.0))
		createIfNotExists(createIngrediente("Anana", 3.0))
		createIfNotExists(createIngrediente("Anchoa", 2.5))
	}

	def createIfNotExists(Ingrediente ingrediente) {
		val existe = this.getIngrediente(ingrediente) !== null
		if (!existe) {
			this.actualizarIngrediente(ingrediente)
		}
		existe
	}

	def createIngrediente(String unNombre, double unPrecio) {
		new Ingrediente => [
			nombre = unNombre
			precio = unPrecio
		]
	}

	static def getInstance() {
		if (instance === null) {
			instance = new RepoIngredientes
		}
		instance
	}

	def doGetIngrediente(Ingrediente ingrediente) {
		ingredientes.findFirst[it.nombre.equals(ingrediente.nombre)]
	}

	/** Genero una copia del objeto para no actualizar el que referencia el repo **/
	def getIngrediente(Ingrediente ingrediente) {
		val result = doGetIngrediente(ingrediente)
		if (result === null) {
			null
		} else {
			result.copy
		}
	}
	
	/** Genero una copia de los objetos para no actualizar el que referencia el repo **/
	def List<Ingrediente> getIngredientes() {
		ingredientes.map [ it.copy ].toList
	}

	def actualizarIngrediente(Ingrediente ingrediente) {

		if (ingrediente.nombre === null) {
			// es un alta
			ingredientes.add(ingrediente)
		} 
		/*
		else {
			// es una modificación
			val ingredientePosta = doGetIngrediente(ingrediente)
			ingredientePosta.reemplazarCon(ingrediente)
		}
		*/
	}

	def eliminarIngrediente(Ingrediente ingrediente) {
		ingredientes.remove(doGetIngrediente(ingrediente))
	}

}
