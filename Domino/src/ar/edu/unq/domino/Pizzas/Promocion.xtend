package ar.edu.unq.domino.Pizzas


import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Promocion {

	double precioBase
	String nombrePromo
	IngredientesExtras distribucion

	new(String nombre, double precio, IngredientesExtras distribucion) {

		this.nombrePromo = nombre
		this.precioBase = precio
		this.distribucion = distribucion
	}

	def agregarIngrediente(Ingrediente ingrediente, DistribucionPizza distribucion) {

		this.distribucion.agregarIngrediente(ingrediente, distribucion)

	}

	def quitarIngrediente(Ingrediente ingrediente) {
		this.distribucion.quitarIngrediente(ingrediente)

	}

	def editarNombre(String nombre) {
		this.nombrePromo = nombre
	}

	def editarPrecio(Integer precio) {
		this.precioBase = precio
	}

	def cambiarDistribucion(Ingrediente ingrediente, DistribucionPizza distribucion) {
		this.distribucion.cambiarDistribucion(ingrediente, distribucion)
	}

	def listaDeIngredientes() {
		this.distribucion.listaDeIngredientes()
	}

	def cantidadDeIngredientes() {
		this.distribucion.listaDeIngredientes().size
	}

}
