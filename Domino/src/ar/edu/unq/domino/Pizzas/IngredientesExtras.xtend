package ar.edu.unq.domino.Pizzas

import ar.edu.unq.domino.distribuciones.DistribucionPizza
import java.util.ArrayList
import java.util.LinkedHashMap
import java.util.Map
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class IngredientesExtras {
	
	
	Map<Ingrediente, DistribucionPizza> ingredientes = new LinkedHashMap<Ingrediente, DistribucionPizza>();

	def void agregarIngrediente(Ingrediente ingrediente, DistribucionPizza distribucion) {
		this.ingredientes.put(ingrediente, distribucion)
	}

	def void quitarIngrediente(Ingrediente ingrediente) {
		if (this.ingredientes.containsKey(ingrediente)) {
			this.ingredientes.remove(ingrediente)
		} else {
			throw new Exception("No se encuentra dicho ingrediente")
		}
		

	}

	def void cambiarDistribucion(Ingrediente ingrediente, DistribucionPizza distribucion) {
		this.ingredientes.replace(ingrediente, distribucion)
	}

	def listaDeIngredientes() {
		var listaDeIngredientes = new ArrayList<Ingrediente>()
		listaDeIngredientes.addAll(this.ingredientes.keySet())
		listaDeIngredientes
	}

	def costo() {
		var double res = 0

		for (Ingrediente i : ingredientes.keySet) {
			res += i.precio
		}
		res
	}

}


