package ar.edu.unq.domino.Pizzas

import ar.edu.unq.domino.distribuciones.DistribucionPizza
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.exceptions.UserException

@TransactionalAndObservable
@Accessors
class Promocion extends Entity {

	String nombrePromo
	double precioBase
	List<IngredienteConDistribucion> ingredientesBase
	
	new(String nombre, double precio, List<IngredienteConDistribucion> ingredientesBase) {

		this.nombrePromo = nombre
		this.precioBase = precio
		this.ingredientesBase = ingredientesBase
	}

	new() {
	}

	def agregarIngrediente(Ingrediente ingrediente, DistribucionPizza distribucion) {
		
		val ingredienteAAgregar = new IngredienteConDistribucion(ingrediente, distribucion)	
		this.ingredientesBase.add(ingredienteAAgregar)
	}

	def quitarIngrediente(Ingrediente ingrediente) {
		if (this.ingredientesBase.contains(ingrediente)) {
			this.ingredientesBase.remove(ingrediente)
		} else {
			throw new Exception("No se encuentra dicho ingrediente")
		}
		
	}

	def editarNombre(String nombre) {
		this.nombrePromo = nombre
	}

	def editarPrecio(double precio) {
		this.precioBase = precio
	}

//	def cambiarDistribucion(Ingrediente ingrediente, DistribucionPizza distribucion) {
//		this.ingredientesBase.cambiarDistribucion(ingrediente, distribucion)
//	}

	def listaDeIngredientes() {
		this.ingredientesBase
	}

	def cantidadDeIngredientes() {
		this.ingredientesBase.size
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
