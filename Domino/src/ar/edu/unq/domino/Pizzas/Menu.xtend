package ar.edu.unq.domino.Pizzas

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.utils.ObservableUtils

@TransactionalAndObservable
@Accessors
class Menu extends Entity {

	List<Promocion> promociones
	List<Ingrediente> ingredientes

	public static Menu instance

	static def config(Menu menu) {
		instance = menu
	}

	new() {
		promociones = newArrayList
		ingredientes = newArrayList

	}

	def agregarPromo(Promocion promocion) {
		promociones.add(promocion)
		ObservableUtils.firePropertyChanged(this, "promociones")
	}

	def void quitarPromo(Promocion promocion) {
		if (promociones.contains(promocion)) {
			promociones.remove(promocion)
		} else {
			throw new Exception("No se encuentra dicha promocion")
		}

	}

	def agregarIngrediente(Ingrediente ingrediente) {
		if(!ingredientes.exists[i | i.nombre == ingrediente.nombre])
		{
		ingredientes.add(ingrediente)
		ObservableUtils.firePropertyChanged(this, "ingredientes")
		}
		else this.modificarIngrediente(ingrediente)
	}

	def quitarIngrediente(Ingrediente ingrediente) {
		ingredientes.remove(ingrediente)
		ObservableUtils.firePropertyChanged(this, "ingredientes")
	}

	def modificarPromo(Promocion promocion) {
		promociones.findFirst[p|p == promocion] => [
			editarNombre(promocion.nombrePromo)
			editarPrecio(promocion.precioBase)
		]
		ObservableUtils.firePropertyChanged(this, "ingredientes")
	}
	
	def modificarIngrediente(Ingrediente ingrediente) {
		ingredientes.findFirst[i|i == ingrediente] => [
			modificarNombre(ingrediente.nombre)
			modificarPrecio(ingrediente.precio)
			ObservableUtils.firePropertyChanged(this, "ingredientes")
		]
	}

}
