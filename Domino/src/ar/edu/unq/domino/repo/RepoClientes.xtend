package ar.edu.unq.domino.repo

import ar.edu.unq.domino.sistema.Cliente
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RepoClientes {
	private static RepoClientes instance = null
	List<Cliente> clientes

private new(){
		clientes= newArrayList
		crearSiNoExiste(CrearCliente("Lucas", "Pier", "sarasa123", "Shamainco@gmail.com", "Av.Falsa 12345"))
	}
	
	def CrearCliente(String nombre, String nick, String password, String mail, String direccion) {
		new Cliente(nombre,nick,password,mail,direccion)
	}
	
	static def getInstance() {
		if (instance === null) {
			instance = new RepoClientes
		}
		instance
	}

	def getCliente(Cliente cliente) {
		val result = doGetCliente(cliente)
		if (result === null) {
			null
		} else {
			result.copy
		}
	}

	def doGetCliente(Cliente cliente) {
		clientes.findFirst[it.nick.equals(cliente.nick)]
		clientes.findFirst[it.email.equals(cliente.email)]
	}

	def crearSiNoExiste(Cliente cliente) {

		if (this.getCliente(cliente) === null) { // SI NO EXISTE el ingrediente en el array, getIngr devolvió null
			this.clientes.add(cliente) // lo guarda en el array
		}

	}

}
