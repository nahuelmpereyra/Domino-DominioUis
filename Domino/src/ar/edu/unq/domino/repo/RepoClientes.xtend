package ar.edu.unq.domino.repo

import ar.edu.unq.domino.sistema.Cliente
import ar.edu.unq.domino.Pizzas.Pedido
import org.apache.commons.collections15.Predicate
import org.uqbar.commons.model.CollectionBasedRepo
import org.uqbar.commons.model.annotations.Observable

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

	//override void validateCreate(Pedido pedido) {
		//validarIngredientesDuplicados(ingrediente)
	//}


	

	def search(String nick) {
		allInstances.filter[cliente|this.match(nick, cliente.nick)].toList
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
		new Cliente
	}

	override getEntityType() {
		typeof(Cliente)
	}

	override def Predicate<Cliente> getCriterio(Cliente example) {
		null
	}
	

}

