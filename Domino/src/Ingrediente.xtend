import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Ingrediente {

	String nombre
	double precio

	new(String nombre, double precio) {
		this.nombre = nombre
		this.precio = precio

	}

	def modificarPrecio(double i) {
		this.precio = i
	}

	def modificarNombre(String nombre) {
		this.nombre = nombre
	}
	

}
