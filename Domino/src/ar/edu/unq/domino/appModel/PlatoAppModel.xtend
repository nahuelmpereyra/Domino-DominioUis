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
import ar.edu.unq.domino.repo.RepoPlatos

@Accessors
@TransactionalAndObservable

class PlatoAppModel {
	
	Plato platoSeleccionado
		
	new(Plato plato){
		platoSeleccionado = plato
	}
	
	def getPrecio(){
		platoSeleccionado.calcularPrecio()
	}
	
	//insert?
	//repo Pizza?
	
	// ********************************************************
	// ** Acciones
	// ********************************************************	

	def getRepoPlatos() {
        ApplicationContext.instance.getSingleton(typeof(Plato)) as RepoPlatos
    }
    
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