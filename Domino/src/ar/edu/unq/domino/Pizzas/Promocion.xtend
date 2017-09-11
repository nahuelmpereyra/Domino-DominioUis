package ar.edu.unq.domino.Pizzas

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Promocion {

	double precioBase
	String nombrePromo
	IngredientesExtras ingredientesBase

	new(String nombre, double precio, IngredientesExtras distribucion) {

		this.nombrePromo = nombre
		this.precioBase = precio
		this.ingredientesBase = distribucion
	}

	def agregarIngrediente(Ingrediente ingrediente, DistribucionPizza distribucion) {

		this.ingredientesBase.agregarIngrediente(ingrediente, distribucion)

	}

	def quitarIngrediente(Ingrediente ingrediente) {
		this.ingredientesBase.quitarIngrediente(ingrediente)

	}

	def editarNombre(String nombre) {
		this.nombrePromo = nombre
	}

	def editarPrecio(Integer precio) {
		this.precioBase = precio
	}

	def cambiarDistribucion(Ingrediente ingrediente, DistribucionPizza distribucion) {
		this.ingredientesBase.cambiarDistribucion(ingrediente, distribucion)
	}

	def listaDeIngredientes() {
		this.ingredientesBase.listaDeIngredientes()
	}

	def cantidadDeIngredientes() {
		this.ingredientesBase.listaDeIngredientes().size
	}

}
