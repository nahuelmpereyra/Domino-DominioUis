
class Delivery implements FormaDeEnvio{
	
	String direccion
	
	new(String direccion) {
		this.direccion = direccion
	}
	
	override recargo() {
		15
	}
	
}