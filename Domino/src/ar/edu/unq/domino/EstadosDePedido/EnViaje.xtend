package ar.edu.unq.domino.EstadosDePedido

import ar.edu.unq.domino.Mailing.GMailSender
import ar.edu.unq.domino.Pizzas.Pedido

class EnViaje extends EstadoDePedido {

	new() {
		this.nombre = "En viaje"
	}

	override siguiente(Pedido pedido) {
		super.siguiente(pedido)

		if (pedido.demoroMasDe30Minutos) {
//			GMailSender.config(new GMailSender("@gmail.com", "intercefaces2017"))
			GMailSender.instance.notificarPedidoDemorado(pedido)

		}
		pedido.esCerrado = 1
		pedido.setTiempoEspera()
	}

	override proximo() { new Entregado }

	override previo() { new ListoParaEnviar }

	override toString() {
		"En viaje"
	}

}
