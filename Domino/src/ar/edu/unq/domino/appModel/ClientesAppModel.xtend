package ar.edu.unq.domino.appModel

import ar.edu.unq.domino.repo.RepoClientes
import ar.edu.unq.domino.sistema.Cliente
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class ClientesAppModel {
	
	Cliente exampleCliente = new Cliente
	List<Cliente> clientes
	Cliente clienteSeleccionado
	
	
	def void search() {
		clientes = repoClientes.search(exampleCliente.nick)
		
	}
	
	// ********************************************************
	// ** Acciones
	// ********************************************************
		def RepoClientes getRepoClientes() {
		ApplicationContext.instance.getSingleton(typeof(Cliente))
	}
	
		def void clearCliente() {
		exampleCliente = new Cliente
		clientes = newArrayList
		clienteSeleccionado = null
	}

	def void eliminarClientesSeleccionada() {
		getRepoClientes().delete(clienteSeleccionado)
		this.search()
		clienteSeleccionado = null
	}
	
}
