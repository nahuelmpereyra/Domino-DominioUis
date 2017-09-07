class ListoParaRetirar extends EstadoDePedido{
	
	override siguiente(Pedido pedido){
		pedido.estado = this.proximo
	}
	
	override proximo() {
		new Entregado
	}
	
	override previo() {
		new Preparando
	}
	
	
}
