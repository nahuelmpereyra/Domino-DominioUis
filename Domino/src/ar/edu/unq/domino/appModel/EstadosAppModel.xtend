package ar.edu.unq.domino.appModel

import ar.edu.unq.domino.EstadosDePedido.EstadoDePedido
import ar.edu.unq.domino.EstadosDePedido.Preparando
import ar.edu.unq.domino.repo.RepoEstados
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class EstadosAppModel {

	EstadoDePedido exampleEstado = new Preparando
	List<EstadoDePedido> estados
	EstadoDePedido estadoSeleccionado

	def void search() {
		estados = repoEstados.search(exampleEstado.nombre)

	}

	// ********************************************************
	// ** Acciones Estados
	// ********************************************************
	def void clearEstado() {
		exampleEstado = new Preparando
		estados = newArrayList
		estadoSeleccionado = null
	}

	def void eliminarEstadoSeleccionado() {
		getRepoEstados().delete(estadoSeleccionado)
		this.search()
		estadoSeleccionado = null
	}

	def RepoEstados getRepoEstados() {
		ApplicationContext.instance.getSingleton(typeof(EstadoDePedido))
	}

}
