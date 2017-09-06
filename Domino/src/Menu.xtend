import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class Menu {

	List<Promocion> promociones
	List<Ingrediente> ingredientes
	List<Cliente> clientes

	new() {
		promociones = newArrayList
		ingredientes = newArrayList
		clientes = newArrayList
	}

	def agregarPromo(Promocion promocion) {
		promociones.add(promocion)
	}

	def quitarPromo(Promocion promocion) {
		promociones.remove(promocion)
	}

	def agregarIngrediente(Ingrediente ingrediente) {
		ingredientes.add(ingrediente)
	}

	def quitarIngrediente(Ingrediente ingrediente) {
		ingredientes.remove(ingrediente)
	}

	def registrarCliente(Cliente cliente) {
		if (clientes.stream.anyMatch[c|c.email == cliente.email]) {
			System.out.println("el email " + cliente.email + " ya se encuentra registrado")
		} else if (clientes.stream.anyMatch[c|c.nick == cliente.nick]) {
			System.out.println("El nick " + cliente.nick + " ya se encuentra registrado.")
		} 		else {
				clientes.add(cliente)

		}
	}

}
