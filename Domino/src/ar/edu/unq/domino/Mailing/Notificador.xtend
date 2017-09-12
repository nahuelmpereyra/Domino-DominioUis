package ar.edu.unq.domino.Mailing

import ar.edu.unq.domino.Pizzas.Pedido
import java.util.Observable
import java.util.Observer
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Notificador extends GMailSender implements Observer {

	EstrategiaMail estrategiaMailing

	new(String username, String password) {
		super(username, password)
		estrategiaMailing = new MailEnViaje

	}

	def notificarPedidoEnViaje(Pedido pedido) {
		this.sendMail(pedido.cliente.email, "Domino Pizza's Pedido En Viaje", "Estimado/a " + pedido.cliente.nombre +
			" el pedido que realizo ya se encuentra en viaje!. Muchas gracias por elegirnos!, Domino Pizza's")
	}

	def notificarPedidoDemorado(Pedido pedido) {
		this.sendMail(pedido.cliente.email, "Domino Pizza's Pedido Demorado", "Mil disculpas " + pedido.cliente.nombre +
			" el pedido que realizo se encuentra demorado. Esperamos que sepa comprendernos, Domino Pizza's")

	}

	override update(Observable _pedido, Object arg1) {
		val pedido = _pedido as Pedido

		estrategiaMailing.notificar(pedido, this)

	}

}
