package ar.edu.unq.domino.appModel

import ar.edu.unq.domino.Pizzas.Pedido
import ar.edu.unq.domino.Pizzas.Plato
import ar.edu.unq.domino.repo.RepoPedidos
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class EditarPedidoAppModel {

	Pedido pedidoSeleccionado
	Plato platoSeleccionado

	new(Pedido pedido) {
		pedidoSeleccionado = pedido
	}

	def void eliminarPlatoSeleccionado() {
		getRepoPedidos().allInstances.findFirst[pedido|pedidoSeleccionado == pedido].quitarPlato(platoSeleccionado)
	}

	def RepoPedidos getRepoPedidos() {
		ApplicationContext.instance.getSingleton(typeof(Pedido))
	}

	def getFechaInicioTransformada() {
		var dias = pedidoSeleccionado.fecha.dayOfMonth
		var meses = pedidoSeleccionado.fecha.monthValue
		var anios = pedidoSeleccionado.fecha.year
		var hora = pedidoSeleccionado.fecha.hour
		var min = pedidoSeleccionado.fecha.minute
		var seg = pedidoSeleccionado.fecha.second
		var res = dias.toString + "/" + meses.toString + "/" + anios.toString + " " + hora.toString + ":" +
			min.toString + ":" + seg.toString
		res
	}
	
	def getFechaFinTransformada() {
		var dias = pedidoSeleccionado.fechaFinPedido.dayOfMonth
		var meses = pedidoSeleccionado.fechaFinPedido.monthValue
		var anios = pedidoSeleccionado.fechaFinPedido.year
		var hora = pedidoSeleccionado.fechaFinPedido.hour
		var min = pedidoSeleccionado.fechaFinPedido.minute
		var seg = pedidoSeleccionado.fechaFinPedido.second
		var res = dias.toString + "/" + meses.toString + "/" + anios.toString + " " + hora.toString + ":" +
			min.toString + ":" + seg.toString
		res
	}

}
