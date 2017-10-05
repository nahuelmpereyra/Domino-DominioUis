package ar.edu.unq.domino.appModel

import ar.edu.unq.domino.Pizzas.Pedido
import ar.edu.unq.domino.Pizzas.Plato
import ar.edu.unq.domino.repo.RepoPedidos
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import ar.edu.unq.domino.TamanioPizzas.TamanioPromo
import ar.edu.unq.domino.distribuciones.DistribucionPizza
import ar.edu.unq.domino.repo.RepoDistribuciones
import ar.edu.unq.domino.repo.RepoTamanios
import ar.edu.unq.domino.Pizzas.Promocion
import java.util.List
import ar.edu.unq.domino.Pizzas.Ingrediente
import ar.edu.unq.domino.Pizzas.Menu
import java.util.Map
import org.uqbar.commons.model.utils.ObservableUtils

@Accessors
@TransactionalAndObservable

class PlatoAppModel {
	
	Plato platoSeleccionado
	Pedido pedidoSeleccionado
	
	List<Promocion> promociones
	Map<Ingrediente, DistribucionPizza> ingredientes
		
	new(Plato plato, Pedido pedido){
		platoSeleccionado = plato
		pedidoSeleccionado = pedido
		}
	
	def getPrecio(){
		platoSeleccionado.calcularPrecio()
	}
	
	//insert?
	//repo Plato?
	
	// ********************************************************
	// ** Acciones
	// ********************************************************	

    
	def getRepoTamanios() {
		ApplicationContext.instance.getSingleton(typeof(TamanioPromo)) as RepoTamanios
	}
	
	def getRepoDistribuciones() {
		ApplicationContext.instance.getSingleton(typeof(DistribucionPizza)) as RepoDistribuciones
	}
	
	def getRepoPedidos() {
		ApplicationContext.instance.getSingleton(typeof(Pedido)) as RepoPedidos
	}
	
}