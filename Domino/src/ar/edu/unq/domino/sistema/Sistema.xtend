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

	new(Menu menu) { //el menú debe estar ya creado con las promos, si no de donde va a pedir cosas el cliente?

		this.clientes = newArrayList
		this.pedidos = newArrayList
		this.menu = menu
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
	
	def puedeRealizarPedido(){
		if (!this.menu.tienePromosDisponibles){
			throw new Exception("No es posible realizar un pedido en este momento") 
		} else {true} // esto me suena a miedo al booleano pero si no me lo toma como void
	}

	def realizarPedido(Pedido pedido) {
		if (this.puedeRealizarPedido()){
		this.pedidos.add(pedido)}
	}

	def cancelarPedido(Pedido pedido) {
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

}
