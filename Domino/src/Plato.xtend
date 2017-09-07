import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Plato {

	Promocion promo
	TamanioPromo tamanio
	Distribucion ingredientes

	new(Promocion promo, TamanioPromo tamanio, Distribucion distribucion) {
		this.promo = promo
		this.tamanio = tamanio
		this.ingredientes = distribucion
	}

	def calcularPrecio() {
		(this.promo.precioBase * precioTamanio + costoIngredientesExtras).intValue
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
