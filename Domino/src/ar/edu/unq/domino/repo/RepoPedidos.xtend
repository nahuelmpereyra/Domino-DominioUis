package ar.edu.unq.domino.repo

import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.domino.Pizzas.Pedido
import java.util.List
import ar.edu.unq.domino.sistema.Cliente

@Accessors
class RepoPedidos {

	List<Pedido> pedidos

	private static RepoPedidos instance = null

	private new() {
		pedidos = newArrayList
	}

	def CrearPedido(Cliente cliente) {
		new Pedido(cliente)
	}

	def CrearPedidoNuevo(Pedido pedido) {

		pedido.setNumero(pedidos.size + 1)
		pedidos.add(pedido)
	}

	static def getInstance() {
		if (instance === null) {
			instance = new RepoPedidos
		}
		instance
	}

	def doGetPedido(int i) {
		pedidos.findFirst[it.numero.equals(i)]
	}

	def eliminarPedido(int i) {
		pedidos.remove(doGetPedido(i))
	}

}
