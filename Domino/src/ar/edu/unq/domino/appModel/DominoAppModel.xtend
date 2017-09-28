package ar.edu.unq.domino.appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class DominoAppModel {

	MenuAppModel appModelMenu
	PedidosAppModel appModelPedidos
	ClientesAppModel appModelClientes
	EstadosAppModel appModelEstados
	TamaniosAppModel appModelTamanios

	new() {
		this.appModelMenu = AppModelsSingleton.instance.appModelMenu
		this.appModelPedidos = AppModelsSingleton.instance.appModelPedidos
		this.appModelClientes = AppModelsSingleton.instance.appModelClientes
		this.appModelEstados = AppModelsSingleton.instance.appModelEstados
		this.appModelTamanios = AppModelsSingleton.instance.appModelTamanios
	}

	def search() {
		appModelMenu.search
		appModelPedidos.search
		appModelClientes.search
		appModelEstados.search
		appModelTamanios.search
	}

}
