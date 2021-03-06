package ar.edu.unq.domino.Pizzas

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.exceptions.UserException

@TransactionalAndObservable
@Accessors
class Ingrediente extends Entity {

	String nombre
	double precio

	new(String nombre, double precio) {
		this.nombre = nombre
		this.precio = precio
	}

	new() {
		this.nombre = null;
		this.precio = 0.0;
	}

	// EXTENSION METHODS
	
	def modificarPrecio(double nuevoPrecio) {
		this.precio = nuevoPrecio
	}

	def modificarNombre(String nombre) {
		this.nombre = nombre
	}

	def validar() {

		if (!this.ingresoNombre) {
			throw new UserException("Debe ingresar nombre")
		}
		else true

	}

	def ingresoNombre() {
		nombre !== null && !nombre.trim().equals("")
	}
	
}
