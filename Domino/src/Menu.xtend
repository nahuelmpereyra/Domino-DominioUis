import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List



@Accessors

class Menu {
	
	List<Promocion> promociones
	List<Ingrediente> ingredientes
	List<Usuario> usuarios
	
	new(){
		promociones = newArrayList
		ingredientes = newArrayList
		usuarios = newArrayList
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
	
	def registrarUsuario(Usuario usuario) {
		usuarios.add(usuario);
	}
}