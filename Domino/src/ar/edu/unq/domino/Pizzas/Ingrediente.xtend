package ar.edu.unq.domino.Pizzas

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable



@TransactionalAndObservable
@Accessors
class Ingrediente implements Cloneable {

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
	
	
	//EXTENSION METHODS

	def modificarPrecio(int nuevoPrecio) {
		this.precio = nuevoPrecio
	}

	def modificarNombre(String nombre) {
		this.nombre = nombre
	}
	
	def copy() {
		super.clone as Ingrediente
	}
	
	def reemplazarCon(Ingrediente ingrediente) {
		nombre=ingrediente.nombre
		precio=ingrediente.precio
	}
	
	

	
	
	
	}


