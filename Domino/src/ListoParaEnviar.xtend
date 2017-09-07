
class ListoParaEnviar extends EstadoDePedido{
	
	override proximo() {
		new Preparando
	}
	
	override previo() {
		new EnViaje
	}
	
}