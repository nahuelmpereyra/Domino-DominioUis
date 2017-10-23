package ar.edu.unq.domino.repo

import ar.edu.unq.domino.sistema.Cliente
import org.apache.commons.collections15.Predicate
import org.uqbar.commons.model.CollectionBasedRepo
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.exceptions.UserException

@Observable
class RepoClientes extends CollectionBasedRepo<Cliente> {

	// ********************************************************
	// ** Altas y bajas
	// ********************************************************
	def void create(String cNombre, String cNick, String cPassword, String cEmail, String cDireccion) {
		this.create(new Cliente => [
			nombre = cNombre
			nick = cNick
			password = cPassword
			email = cEmail
			direccion = cDireccion
		])
	}
	
	def search(String user) {
		var nicks = searchNick(user)
		var emails = (searchEmail(user))
		nicks.addAll(emails)
		nicks
	}

	def searchNick(String nick) {
		allInstances.filter[cliente|this.match(nick, cliente.nick)].toList
	}
	
	def searchEmail(String email) {
		allInstances.filter[cliente|this.match(email, cliente.email)].toList
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

	override void validateCreate(Cliente cliente) {
		validarClientesDuplicados(cliente)
	}

	def validarClientesDuplicados(Cliente cliente) {
		val nick = cliente.nick
		val email = cliente.email
		if (!this.searchNick(nick).isEmpty) {
			throw new UserException("Ya existe un cliente con el nick: " + nick)
		}
		if (!this.searchEmail(email).isEmpty) {
			throw new UserException("Ya existe un cliente con el mail: " + email)
		}
	}

	override createExample() {
		new Cliente
	}

	override getEntityType() {
		typeof(Cliente)
	}

	override def Predicate<Cliente> getCriterio(Cliente example) {
		null
	}

}
