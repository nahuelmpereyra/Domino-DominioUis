import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Ingrediente {

	String nombre
	Integer precio

	new(String nombre, int precio) {
		this.nombre = nombre
		this.precio = precio

	}

	def modificarPrecio(int nuevoPrecio) {
		this.precio = nuevoPrecio
	}

	def modificarNombre(String nombre) {
		this.nombre = nombre
	}

}
