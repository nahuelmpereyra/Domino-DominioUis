package ar.edu.unq.domino.Pizzas


import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.domino.TamanioPizzas.TamanioPromo

@Accessors
class Plato {

	Promocion promo
	TamanioPromo tamanio
	IngredientesExtras ingredientes

	new(Promocion promo, TamanioPromo tamanio, IngredientesExtras distribucion) {
		this.promo = promo
		this.tamanio = tamanio
		this.ingredientes = distribucion
	}

	def calcularPrecio() {
		this.promo.precioBase * precioTamanio + costoIngredientesExtras
	}

	def costoIngredientesExtras() {
		this.ingredientes.costo
	}

	def precioTamanio() {
		this.tamanio.precio
	}

	def agregarIngrediente(Ingrediente ingrediente, DistribucionPizza distribucion) {
		promo.agregarIngrediente(ingrediente, distribucion)
	}

}
