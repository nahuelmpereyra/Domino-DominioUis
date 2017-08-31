import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors

class Menu {
	
	List<Promocion> promociones = newArrayList
	
	def agregarPromo(Promocion promocion) {
		promociones.add(promocion)
	}
	
	def quitarPromo(Promocion promocion) {
		promociones.remove(promocion)
	}
	
}