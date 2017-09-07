class Preparando extends EstadoDePedido {
	
	override siguiente(Pedido pedido){
		pedido.estado = pedido.formaDeRetiro.proximoEstado
	}
	
	override proximo() {
	}
	
	override previo() {
		this
	}
	
	
}
