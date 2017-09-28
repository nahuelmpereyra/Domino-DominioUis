package ar.edu.unq.domino.repo

import ar.edu.unq.domino.Pizzas.Ingrediente
import ar.edu.unq.domino.Pizzas.Menu
import ar.edu.unq.domino.Pizzas.Promocion
import java.util.List
import org.apache.commons.collections15.Predicate
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.CollectionBasedRepo
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.utils.ObservableUtils

@Observable
@Accessors
class RepoMenu extends CollectionBasedRepo<Menu> {

	def void create(List<Promocion> mPromociones, List<Ingrediente> mIngredientes) {
		this.create(Menu.instance)
	}

	override def Predicate<Menu> getCriterio(Menu example) {
		null
	}

	override createExample() {
		new Menu
	}

	override getEntityType() {
		typeof(Menu)
	}

	def agregarPromo(Promocion promocion) {
		allInstances.get(0).agregarPromo(promocion)
		ObservableUtils.firePropertyChanged(this.allInstances.get(0), "promociones")
	}

	def editarPromo(Promocion promocion) {
		allInstances.get(0).modificarPromo(promocion)
	}

}
