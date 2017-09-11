package ar.edu.unq.domino.sistema

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.domino.Pizzas.Pedido
import ar.edu.unq.domino.Pizzas.Menu

@Accessors
class Sistema {

	List<Cliente> clientes
	List<Pedido> pedidos
	Menu menu = new Menu

	new() {

		this.clientes = newArrayList
		this.pedidos = newArrayList
	// Segun el enunciado dice que tiene un unico menu, no una lista de menues-***Ver
	}

	def registrarCliente(Cliente cliente) throws Exception {
		if (clientes.stream.anyMatch[c|c.email == cliente.email]) {
			throw new Exception("el email " + cliente.email + " ya se encuentra registrado")
		} else if (clientes.stream.anyMatch[c|c.nick == cliente.nick]) {
			throw new Exception("El nick " + cliente.nick + " ya se encuentra registrado.")
		} else {
			clientes.add(cliente)

		}

	}

	def notificarPedidoEnViaje(Cliente cliente) {
		GMailSender.instance.sendMail(cliente.email, "Domino Pizza's Pedido En Viaje", "Estimado/a " + cliente.nombre +
			" el pedido que realizo ya se encuentra en viaje!. Muchas gracias por elegirnos!, Domino Pizza's")
	}

	def notificarPedidoDemorado(Cliente cliente) {
		GMailSender.instance.sendMail(cliente.email, "Domino Pizza's Pedido Demorado",
			"Mil disculpas " + cliente.nombre +
				" el pedido que realizo se encuentra demorado. Esperamos que sepa comprendernos, Domino Pizza's")

			}

		}
		