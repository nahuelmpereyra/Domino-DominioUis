package ar.edu.unq.domino.appModel

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable
import ar.edu.unq.domino.Pizzas.Ingrediente
import java.io.Serializable
import ar.edu.unq.domino.Pizzas.Promocion
import ar.edu.unq.domino.repo.RepoIngredientes
import ar.edu.unq.domino.repo.RepoPromociones

@Accessors
@Observable
class Buscador implements Serializable {

	Ingrediente exampleIngrediente = new Ingrediente
	List<Ingrediente> resultadosIngrediente
	Ingrediente ingredienteSeleccionado

	Promocion examplePromocion = new Promocion
	List<Promocion> resultadosPromocion
	Promocion promoSeleccionada

	def void search() {
		resultadosIngrediente = repoIngredientes.search(exampleIngrediente.nombre)
		resultadosPromocion = repoPromociones.search(examplePromocion.nombrePromo)
	}

	// ********************************************************
	// ** Acciones Ingrediente
	// ********************************************************
	def void clearIngrediente() {
		exampleIngrediente = new Ingrediente
		resultadosIngrediente = newArrayList
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

	// ********************************************************
	// ** Acciones Promocion
	// ********************************************************
	def void clear() {
		examplePromocion = new Promocion
		resultadosPromocion = newArrayList
		promoSeleccionada = null
	}

	def void eliminarPromocionSeleccionada() {
		getRepoPromociones().delete(promoSeleccionada)
		this.search()
		promoSeleccionada = null
	}

	def RepoPromociones getRepoPromociones() {
		ApplicationContext.instance.getSingleton(typeof(Promocion))
	}

}
