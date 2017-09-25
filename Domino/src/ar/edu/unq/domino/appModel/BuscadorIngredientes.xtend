package ar.edu.unq.domino.appModel

import java.io.Serializable
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable
import ar.edu.unq.domino.Pizzas.Ingrediente
import ar.edu.unq.domino.repo.RepoIngredientes

@Accessors
@Observable
class BuscadorIngredientes implements Serializable {

	Ingrediente example = new Ingrediente
	List<Ingrediente> resultados
	Ingrediente ingredienteSeleccionado

	// ********************************************************
	// ** Acciones
	// ********************************************************
	def void search() {
		resultados = repoIngredientes.search(example.nombre)
	}

	def void clear() {
		example = new Ingrediente
		resultados = newArrayList
		ingredienteSeleccionado = null
	}

	def void eliminarIngredienteSeleccionado() {
		getRepoIngredientes().delete(ingredienteSeleccionado)
		this.search()
		ingredienteSeleccionado = null
	}

	def RepoIngredientes getRepoIngredientes() {
		ApplicationContext.instance.getSingleton(typeof(Ingrediente))
	}

}
