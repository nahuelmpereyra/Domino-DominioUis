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

	def realizarPedido(Pedido pedido) {
		this.pedidos.add(pedido)
			}
		}
		