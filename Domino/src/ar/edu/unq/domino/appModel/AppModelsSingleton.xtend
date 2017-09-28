package ar.edu.unq.domino.appModel

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class AppModelsSingleton {
	
	public val static instance = new AppModelsSingleton()
	
	IngredientesAppModel appModelIngredientes = new IngredientesAppModel()
	PromocionesAppModel appModelPromociones = new PromocionesAppModel()
	PedidosAppModel appModelPedidos = new PedidosAppModel()
	ClientesAppModel appModelClientes = new ClientesAppModel()
	EstadosAppModel appModelEstados = new EstadosAppModel()
	TamaniosAppModel appModelTamanios = new TamaniosAppModel()
	
}