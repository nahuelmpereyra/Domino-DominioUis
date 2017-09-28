package ar.edu.unq.domino.appModel

import ar.edu.unq.domino.Pizzas.Ingrediente
import java.util.List
import ar.edu.unq.domino.repo.RepoIngredientes
import org.uqbar.commons.applicationContext.ApplicationContext
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class IngredientesAppModel {
	
	Ingrediente exampleIngrediente = new Ingrediente
	List<Ingrediente> ingredientes
	Ingrediente ingredienteSeleccionado
	
	
	def void search() {
		ingredientes = repoIngredientes.search(exampleIngrediente.nombre)
		
	}
	
	// ********************************************************
	// ** Acciones
	// ********************************************************
	def void clearIngrediente() {
		exampleIngrediente = new Ingrediente
		ingredientes = newArrayList
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