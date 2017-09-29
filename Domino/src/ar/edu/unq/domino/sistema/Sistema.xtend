package ar.edu.unq.domino.sistema

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.domino.Pizzas.Pedido
import ar.edu.unq.domino.Pizzas.Menu
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import ar.edu.unq.domino.EstadosDePedido.Cancelado
import ar.edu.unq.domino.EstadosDePedido.Entregado

@TransactionalAndObservable
@Accessors
class Sistema {

	List<Cliente> clientes
	List<Pedido> pedidos
	Menu menu = new Menu

	new() {

		this.clientes = newArrayList
		this.pedidos = newArrayList
	}

	def registrarCliente(Cliente cliente) {
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

	def void cancelarPedido(Pedido pedido) {
		pedido.cancelar
	}

	def siguienteEstado(Pedido pedido) {
		pedido.estado.siguiente(pedido)
	}

	def anteriorEstado(Pedido pedido) {
		pedido.estado.anterior(pedido)
	}

	def pedidosCancelados() {
		var List<Pedido> pedidosCancelados = newArrayList
		for (Pedido p : pedidos) {
			if (p.estado instanceof Cancelado) {
				pedidosCancelados.add(p)
			}

		}
		pedidosCancelados
	}

	def pedidosEntregados() {
		var List<Pedido> pedidosEntregados = newArrayList
		for (Pedido p : pedidos) {
			if (p.estado instanceof Entregado) {
				pedidosEntregados.add(p)
			}

		}
		pedidosEntregados
	}

	def pedidosCerrados() {
		var List<Pedido> pedidosCerrados = pedidosCancelados
		for (Pedido p : pedidosEntregados) {
			pedidosCerrados.add(p)
		}
		pedidosCerrados
	}

	def promos() {
		menu.promociones
	}

	def ingredientes() {
		menu.ingredientes;
	}
}
