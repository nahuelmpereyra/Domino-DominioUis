package ar.edu.unq.domino.appModel

import ar.edu.unq.domino.Pizzas.Ingrediente
import ar.edu.unq.domino.Pizzas.Promocion
import ar.edu.unq.domino.repo.RepoIngredientes
import ar.edu.unq.domino.repo.RepoPromociones
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.utils.ObservableUtils

@Accessors
@Observable
class MenuAppModel {

	Promocion examplePromocion = new Promocion
	List<Promocion> promociones
	Promocion promoSeleccionada

	Ingrediente exampleIngrediente = new Ingrediente
	List<Ingrediente> ingredientes
	Ingrediente ingredienteSeleccionado

	def void search() {
		this.searchPromocion
		this.searchIngrediente
	}

	// ********************************************************
	// ** Acciones Promocion
	// ********************************************************
	def void searchPromocion() {
		promociones = repoPromociones.search(examplePromocion.nombrePromo)
		ObservableUtils.firePropertyChanged(this, "promociones")
	}

	def void clearPromocion() {
		examplePromocion = new Promocion
		promociones = newArrayList
		promoSeleccionada = null
	}

	def void eliminarPromocionSeleccionada() {
		repoPromociones.delete(promoSeleccionada)
		this.search
		promoSeleccionada = null
	}

	def RepoPromociones getRepoPromociones() {
		ApplicationContext.instance.getSingleton(typeof(Promocion))
	}

	// ********************************************************
	// ** Acciones Ingrediente
	// ********************************************************
	def void searchIngrediente() {
		ingredientes = repoIngredientes.search(exampleIngrediente.nombre)
		ObservableUtils.firePropertyChanged(this, "ingredientes")
	}

	def void clearIngrediente() {
		exampleIngrediente = new Ingrediente
		ingredientes = newArrayList
		ingredienteSeleccionado = null
	}

	def void eliminarIngredienteSeleccionado() {
		repoIngredientes.delete(ingredienteSeleccionado)
		this.search()
		ingredienteSeleccionado = null
	}

	def RepoIngredientes getRepoIngredientes() {
		ApplicationContext.instance.getSingleton(typeof(Ingrediente))
	}

}
