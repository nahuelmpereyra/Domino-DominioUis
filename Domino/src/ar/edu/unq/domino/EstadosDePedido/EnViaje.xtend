package ar.edu.unq.domino.EstadosDePedido

import ar.edu.unq.domino.Mailing.GMailSender
import ar.edu.unq.domino.Pizzas.Pedido

class EnViaje extends EstadoDePedido {

	new() {
		this.nombre = "En viaje"
	}

	override siguiente(Pedido pedido) {
		super.siguiente(pedido)
		pedido.setFechaDeFinPedido()
		pedido.setTiempoEspera()
		if (pedido.demoroMasDe30Minutos) {
		
			GMailSender.instance.notificarPedidoDemorado(pedido)

		}
	}

	override proximo() { new Entregado }

	override previo() { new ListoParaEnviar }

	override toString() {
		"En viaje"
	}

}
