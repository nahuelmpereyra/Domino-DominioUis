package ar.edu.unq.domino.Pizzas

import ar.edu.unq.domino.distribuciones.DistribucionPizza
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.exceptions.UserException

@TransactionalAndObservable
@Accessors
class Promocion extends Entity {

	String nombrePromo
	double precioBase
	IngredientesExtras ingredientesBase

	new(String nombre, double precio, IngredientesExtras distribucion) {

		this.nombrePromo = nombre
		this.precioBase = precio
		this.ingredientesBase = distribucion
	}

	new() {
		
		this.ingredientesBase = new IngredientesExtras
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

	def editarPrecio(double precio) {
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

	def validar() {

		if (!this.ingresoNombre()) {
			throw new UserException("Debe ingresar nombre")
		}
		else
		true

	}

	def ingresoNombre() {
		nombrePromo !== null && !nombrePromo.trim().equals("")
	}

}
