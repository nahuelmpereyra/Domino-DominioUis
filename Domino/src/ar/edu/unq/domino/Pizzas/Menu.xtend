package ar.edu.unq.domino.Pizzas

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class Menu {

	List<Promocion> promociones
	List<Ingrediente> ingredientes
	

	new() {
		promociones = newArrayList
		ingredientes = newArrayList
		
	}

	def agregarPromo(Promocion promocion) {
		promociones.add(promocion)
	}

	def quitarPromo(Promocion promocion) {
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
