package ar.edu.unq.domino.appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class MenuAppModel {
	
	PromocionesAppModel appModelPromociones
	IngredientesAppModel appModelIngredientes
	PedidosAppModel appModelPedidos
	ClientesAppModel appModelClientes
	EstadosAppModel appModelEstados
	TamaniosAppModel appModelTamanios
	
	new() {
		this.appModelPromociones = AppModelsSingleton.instance.appModelPromociones
		this.appModelIngredientes = AppModelsSingleton.instance.appModelIngredientes
		this.appModelPedidos = AppModelsSingleton.instance.appModelPedidos
		this.appModelClientes = AppModelsSingleton.instance.appModelClientes
		this.appModelEstados = AppModelsSingleton.instance.appModelEstados
		this.appModelTamanios = AppModelsSingleton.instance.appModelTamanios
	}
	
	def search() {
		appModelPromociones.search
		appModelIngredientes.search
		appModelPedidos.search
		appModelClientes.search
		appModelEstados.search
		appModelTamanios.search
	}


}