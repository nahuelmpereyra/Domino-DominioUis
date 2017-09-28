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
	Ingrediente ingredienteSeleccionado

	public static Menu instance

	static def instancia() { instance }

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
		ingredientes.add(ingrediente)
	}

	def quitarIngrediente(Ingrediente ingrediente) {
		ingredientes.remove(ingrediente)
	}

	def modificarPromo(Promocion promocion) {
		promociones.findFirst[p|p == promocion] => [
			editarNombre(promocion.nombrePromo)
			editarPrecio(promocion.precioBase)
		]
	}

}
