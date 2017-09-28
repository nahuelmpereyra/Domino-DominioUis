package ar.edu.unq.domino.appModel

import ar.edu.unq.domino.Pizzas.Promocion
import java.util.List
import ar.edu.unq.domino.repo.RepoPromociones
import org.uqbar.commons.applicationContext.ApplicationContext
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class PromocionesAppModel {
	
	Promocion examplePromocion = new Promocion
	List<Promocion> promociones
	Promocion promoSeleccionada
	
		def void search() {
		promociones = repoPromociones.search(examplePromocion.nombrePromo)	
	}
	
	
	// ********************************************************
	// ** Acciones
	// ********************************************************
	def void clearPromocion() {
		examplePromocion = new Promocion
		promociones = newArrayList
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