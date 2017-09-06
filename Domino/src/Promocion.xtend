import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Promocion {

	double precioBase
	String nombrePromo
	Distribucion distribucion

	new(String nombre, float precio, Distribucion distribucion) {

		this.nombrePromo = nombre
		this.precioBase = precio
		this.distribucion = distribucion
	}

	def agregarIngrediente(Ingrediente ingrediente, DistribucionPizza distribucion) {

		this.distribucion.agregarIngrediente(ingrediente, distribucion)

	}

	def quitarIngrediente(Ingrediente ingrediente) {
		this.distribucion.quitarIngrediente(ingrediente)

	}

	def editarNombre(String nombre) {
		this.nombrePromo = nombre
	}

	def editarPrecio(float precio) {
		this.precioBase = precio
	}
	
	def cambiarDistribucion(Ingrediente ingrediente, DistribucionPizza distribucion){
		this.distribucion.cambiarDistribucion(ingrediente,distribucion)
	}
	
	def listaDeIngredientes(){
		this.distribucion.listaDeIngredientes()
	}
	
	def cantidadDeIngredientes(){
		this.distribucion.listaDeIngredientes().size
	}

}
