package ar.edu.unq.domino.formasDeEnvio

import ar.edu.unq.domino.EstadosDePedido.EstadoDePedido

interface FormaDeRetiro {
	def EstadoDePedido proximoEstado()

	def double costoEnvio()

}
