package ar.edu.unq.domino.appModel

import ar.edu.unq.domino.TamanioPizzas.Chica
import ar.edu.unq.domino.TamanioPizzas.TamanioPromo
import ar.edu.unq.domino.repo.RepoTamanios
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class TamaniosAppModel {
	
	TamanioPromo exampleTamanio = new Chica
	List<TamanioPromo> tamanios
	TamanioPromo tamanioSeleccionado
	
	
	def void search() {
		tamanios = repoTamanios.search(exampleTamanio.nombre)
		
	}
	
	// ********************************************************
	// ** Acciones
	// ********************************************************
	def void clearTamanio() {
		exampleTamanio = new Chica
		tamanios = newArrayList
		tamanioSeleccionado = null
	}

	def void eliminarTamanioSeleccionado() {
		getRepoTamanios().delete(tamanioSeleccionado)
		this.search()
		tamanioSeleccionado = null
	}

	def RepoTamanios getRepoTamanios() {
		ApplicationContext.instance.getSingleton(typeof(TamanioPromo))
	}
	
}