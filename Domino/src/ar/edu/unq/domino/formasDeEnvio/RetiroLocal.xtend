package ar.edu.unq.domino.formasDeEnvio

import ar.edu.unq.domino.EstadosDePedido.ListoParaRetirar

class RetiroLocal implements FormaDeRetiro {

	override proximoEstado() {
		new ListoParaRetirar
	}

	override costoEnvio() {
		0.0
	}

}
