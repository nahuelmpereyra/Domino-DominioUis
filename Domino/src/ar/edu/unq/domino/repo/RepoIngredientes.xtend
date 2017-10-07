package ar.edu.unq.domino.repo

import ar.edu.unq.domino.Pizzas.Ingrediente
import java.util.List
import org.apache.commons.collections15.Predicate
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.CollectionBasedRepo
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.exceptions.UserException
import org.uqbar.commons.model.utils.ObservableUtils

@Observable
@Accessors
class RepoIngredientes extends CollectionBasedRepo<Ingrediente> {

	// ********************************************************
	// ** Altas y bajas
	// ********************************************************
	var List<Ingrediente> resultados

	def void create(String iNombre, double iPrecio) {
		this.create(new Ingrediente => [
			nombre = iNombre
			precio = iPrecio
		])
	}

	override void validateCreate(Ingrediente ingrediente) {
		ingrediente.validar()
		validarIngredientesDuplicados(ingrediente)
	}

	def validarIngredientesDuplicados(Ingrediente ingrediente) {
		val nombre = ingrediente.nombre
		if (!this.search(nombre).isEmpty) {
			throw new UserException("Ya existe un ingrediente con el nombre: " + nombre)
		}
	}

	def search(String nombre) {

		resultados = allInstances.filter[ingrediente|this.match(nombre, ingrediente.nombre)].toList
		ObservableUtils.firePropertyChanged(this, "resultados")
		resultados
	}

	def match(Object expectedValue, Object realValue) {
		if (expectedValue === null) {
			return true
		}
		if (realValue === null) {
			return false
		}
		realValue.toString().toLowerCase().equals(expectedValue.toString().toLowerCase())
	}

	override createExample() {
		new Ingrediente
	}

	override getEntityType() {
		typeof(Ingrediente)
	}

	override def Predicate<Ingrediente> getCriterio(Ingrediente example) {
		null
	}

	def ingredientes() {
		allInstances
	}

}