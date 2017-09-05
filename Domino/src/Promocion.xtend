import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Promocion {

	List<Ingrediente> ingredientes = newArrayList
	List<Distribucion> distribuciones = newArrayList
	double precioBase
	String nombrePromo

	new(String nombre, float precio, List<Ingrediente> ingredientesBase, List<Distribucion> distribucionBase) {

		ingredientes = ingredientesBase
		distribuciones = distribucionBase
		precioBase = precio
		nombrePromo = nombre
	}

	def void agregarIngrediente(Ingrediente ingrediente, Distribucion distribucion) {

		ingredientes.add(ingrediente)
		distribuciones.add(distribucion)
		precioBase += ingrediente.precio

	}

	def quitarIngrediente(Ingrediente ingrediente) {
		distribuciones.remove(ingredientes.indexOf(ingrediente))
		ingredientes.remove(ingrediente)
		precioBase -= ingrediente.precio

	}

	def editarNombre(String nombre) {
		this.nombrePromo = nombre
	}

	def editarPrecio(float precio) {
		this.precioBase = precio
	}

}
