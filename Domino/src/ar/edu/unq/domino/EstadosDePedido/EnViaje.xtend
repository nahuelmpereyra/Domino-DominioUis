package ar.edu.unq.domino.EstadosDePedido

import ar.edu.unq.domino.Mailing.GMailSender
import ar.edu.unq.domino.Pizzas.Pedido

class EnViaje extends EstadoDePedido {

	override siguiente(Pedido pedido) {
		super.siguiente(pedido)

		if (pedido.demoroMasDe30Minutos) {
//			GMailSender.config(new GMailSender("@gmail.com", "intercefaces2017"))
			GMailSender.instance.notificarPedidoDemorado(pedido)
		}
	}

	override proximo() {new Entregado}

	override previo() {new ListoParaEnviar}

}
