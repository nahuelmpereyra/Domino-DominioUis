package ar.edu.unq.domino.Pizzas

import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.domino.TamanioPizzas.TamanioPromo

@Accessors
class Plato {

	Promocion promo
	TamanioPromo tamanio
	IngredientesExtras ingredientesExtras

	new(Promocion promo, TamanioPromo tamanio, IngredientesExtras ingredientesExtras) {
		this.promo = promo
		this.tamanio = tamanio
		this.ingredientesExtras = ingredientesExtras
	}

	def calcularPrecio() {
		this.promo.precioBase * precioTamanio + costoIngredientesExtras
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
