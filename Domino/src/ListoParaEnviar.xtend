
class ListoParaEnviar extends EstadoDePedido{
	
	override proximo() {
		new EnViaje
	}
	
	override previo() {
		new Preparando
	}
	
	
}