package ar.edu.unq.domino.sistema

import java.util.Observer
import java.util.Observable
import ar.edu.unq.domino.Pizzas.Pedido

class Notificador extends GMailSender implements Observer {

	new(String username, String password) {
		super(username, password)
	}
	


	def notificarPedidoEnViaje(Cliente cliente) {
		this.sendMail(cliente.email, "Domino Pizza's Pedido En Viaje", "Estimado/a " + cliente.nombre +
			" el pedido que realizo ya se encuentra en viaje!. Muchas gracias por elegirnos!, Domino Pizza's")
	}

	def notificarPedidoDemorado(Cliente cliente) {
		this.sendMail(cliente.email, "Domino Pizza's Pedido Demorado",
			"Mil disculpas " + cliente.nombre +
				" el pedido que realizo se encuentra demorado. Esperamos que sepa comprendernos, Domino Pizza's")

			}
			
			override update(Observable arg0, Object arg1) {
				val pedido= arg0 as Pedido
				
				notificarPedidoEnViaje(pedido.cliente)
			}
			
}
