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
		this.sendMail(pedido.cliente.email, "Domino Pizza's: Pedido en viaje", "Estimado/a " + pedido.cliente.nombre +
			", el pedido que realizo ya se encuentra en viaje.\n\nMuchas gracias por elegirnos!\n\nDomino Pizza's")
	}

	def notificarPedidoDemorado(Pedido pedido) {
		this.sendMail(pedido.cliente.email, "Domino Pizza's: Pedido demorado", "Mil disculpas " + pedido.cliente.nombre +
			", el pedido que realizo se encuentra demorado, esperamos que sepa comprendernos.\n\nDomino Pizza's")

	}

	override update(Observable _pedido, Object arg1) {
		val pedido = _pedido as Pedido

		estrategiaMailing.notificar(pedido, this)

	}

}
