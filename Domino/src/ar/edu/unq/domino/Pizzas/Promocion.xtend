package ar.edu.unq.domino.Pizzas

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.exceptions.UserException
import org.uqbar.commons.model.Entity
import ar.edu.unq.domino.distribuciones.DistribucionPizza

@TransactionalAndObservable
@Accessors
class Promocion extends Entity implements Cloneable{

	double precioBase
	String nombrePromo
	IngredientesExtras ingredientesBase

	new(String nombre, double precio, IngredientesExtras distribucion) {

		this.nombrePromo = nombre
		this.precioBase = precio
		this.ingredientesBase = distribucion
	}
	
	new() {
		this.nombrePromo = null;
		this.precioBase = 0.0;
		//this.ingredientesBase = newArrayList
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
	
	def validar() {

		if (!this.ingresoNombre()) {
			throw new UserException("Debe ingresar nombre")
		}

	}

	def ingresoNombre() {
		nombrePromo !== null && !nombrePromo.trim().equals("")
	}
	

}
