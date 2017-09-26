package ar.edu.unq.domino.formasDeEnvio

import ar.edu.unq.domino.EstadosDePedido.ListoParaEnviar
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@TransactionalAndObservable
class Delivery implements FormaDeRetiro {

	override proximoEstado() {
		new ListoParaEnviar
	}

	override costoEnvio() {
		15.0
	}

}
