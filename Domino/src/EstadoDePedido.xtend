import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class EstadoDePedido  {
		
	
	def void siguiente(Pedido pedido){
	 	pedido.estado = this.proximo()
		  
			
	}
	def void anterior(Pedido pedido){
		pedido.estado = this.previo()
			  
	}
	
	def EstadoDePedido proximo()
	def EstadoDePedido previo()

}
