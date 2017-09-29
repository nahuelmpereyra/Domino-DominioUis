package ar.edu.unq.domino.appModel

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class AppModelsSingleton {

	public val static instance = new AppModelsSingleton()

	MenuAppModel appModelMenu = new MenuAppModel()
	PedidosAppModel appModelPedidos = new PedidosAppModel()
	EstadosAppModel appModelEstados = new EstadosAppModel()
	TamaniosAppModel appModelTamanios = new TamaniosAppModel()

}
