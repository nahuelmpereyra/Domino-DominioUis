package ar.edu.unq.domino.formasDeEnvio

import ar.edu.unq.domino.EstadosDePedido.ListoParaEnviar

class Delivery implements FormaDeRetiro {
	
	override proximoEstado() {
		new ListoParaEnviar
	}
	
	override costoEnvio() {
		15.0
	}


}
