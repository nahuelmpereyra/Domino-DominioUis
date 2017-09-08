package ar.edu.unq.domino.sistema

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import ar.edu.unq.domino.Pizzas.Pedido

@Accessors
class Cliente {

	String nombre
	String nick
	String password
	String email
	String direccion
	List<Pedido> historial

	new(String nombre, String nick, String password, String email, String direccion) {
		this.nombre = nombre
		this.nick = nick
		this.password = password
		this.email = email
		this.direccion = direccion
		this.historial = newArrayList

	}

	def agregarPedido(Pedido pedido) {
		this.historial.add(pedido)
	}

}
