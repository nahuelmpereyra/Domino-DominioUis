package ar.edu.unq.domino.Pizzas

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import ar.edu.unq.domino.repo.RepoIngredientes


@TransactionalAndObservable
@Accessors
class Menu {

	List<Promocion> promociones
	List<Ingrediente> ingredientes
	Ingrediente ingredienteSeleccionado

	new() {
		promociones = newArrayList
		ingredientes = newArrayList

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
	
	def buscar() {
		ingredientes = RepoIngredientes.instance.getIngredientes()
	}
	


}
