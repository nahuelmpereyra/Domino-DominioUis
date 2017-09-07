import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class EstadoDePedido  {
		
	
	def void siguiente(Pedido pedido){
	 	var estadoSiguiente = this.proximo()
	 	pedido.estado = estadoSiguiente
		  
			
	}
	def void anterior(Pedido pedido){
		var estadoAnterior = this.previo()
		pedido.estado = estadoAnterior
			  
	}
	
	def EstadoDePedido proximo()
	def EstadoDePedido previo()

}
