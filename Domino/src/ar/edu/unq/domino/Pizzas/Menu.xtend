package ar.edu.unq.domino.Pizzas

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@TransactionalAndObservable
@Accessors
class Menu {

	List<Promocion> promociones
	List<Ingrediente> ingredientes

	new() {
		promociones = newArrayList
		ingredientes = newArrayList

	}

	def tienePromosDisponibles(){
		this.promociones.size>0
	}
	def agregarPromo(Promocion promocion) {
		promociones.add(promocion)
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

}
