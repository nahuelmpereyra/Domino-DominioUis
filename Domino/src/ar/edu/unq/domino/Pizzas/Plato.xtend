package ar.edu.unq.domino.Pizzas

import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.domino.TamanioPizzas.TamanioPromo
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.Entity
import ar.edu.unq.domino.distribuciones.DistribucionPizza

@TransactionalAndObservable
@Accessors
class Plato extends Entity implements Cloneable{

	String nombre
	Promocion promo
	TamanioPromo tamanio
	IngredientesExtras ingredientesExtras
	double precio

	new(String nombre, Promocion promo, TamanioPromo tamanio, IngredientesExtras ingredientesExtras) {
		this.nombre = nombre
		this.promo = promo
		this.tamanio = tamanio
		this.ingredientesExtras = ingredientesExtras
	}
	
	new(){
		this.precio = 0.0 
	}

	def calcularPrecio() {
		this.precio = this.promo.precioBase * precioTamanio + costoIngredientesExtras
	}

	def costoIngredientesExtras() {
		this.ingredientesExtras.costo
	}

	def precioTamanio() {
		this.tamanio.precio
	}

	def agregarIngrediente(Ingrediente ingrediente, DistribucionPizza distribucion) {
		ingredientesExtras.agregarIngrediente(ingrediente, distribucion)
	}

}
