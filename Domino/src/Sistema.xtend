

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Sistema {
	

	List<Cliente> clientes
	List<Pedido> pedidos
	List<Menu> menu
	new() {

		this.clientes= newArrayList
		this.pedidos= newArrayList
		this.menu= newArrayList
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
	
	def agregarMenu(Menu menu) {
		this.menu.add(menu)
	}
	
}