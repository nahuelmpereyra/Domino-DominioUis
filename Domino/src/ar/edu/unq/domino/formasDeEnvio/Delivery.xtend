package ar.edu.unq.domino.formasDeEnvio

import ar.edu.unq.domino.EstadosDePedido.ListoParaEnviar
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@TransactionalAndObservable
@Accessors
class Delivery implements FormaDeRetiro {

	String direccion
	
	new(String direccion){
		this.direccion = direccion
	}
	override proximoEstado() {
		new ListoParaEnviar
	}

	override costoEnvio() {
		15.0
	}
	
	override esRetiro() {
		false
	}
	
	override esDelivery() {
		true
	}

}
