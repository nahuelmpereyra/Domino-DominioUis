package ar.edu.unq.domino.formasDeEnvio

import ar.edu.unq.domino.EstadosDePedido.ListoParaRetirar
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@TransactionalAndObservable
class RetiroLocal implements FormaDeRetiro {

	override proximoEstado() {
		new ListoParaRetirar
	}

	override costoEnvio() {
		0.0
	}
	
	override esRetiro() {
		true
	}
	
	override esDelivery() {
		false
	}

}
