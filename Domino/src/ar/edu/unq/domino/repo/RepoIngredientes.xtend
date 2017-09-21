package ar.edu.unq.domino.repo

import ar.edu.unq.domino.Pizzas.Ingrediente
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RepoIngredientes {
	
	List<Ingrediente> ingredientes
	
	private static RepoIngredientes instance = null
	
	private new(){
		ingredientes= newArrayList
	crearSiNoExiste(CrearIngrediente("Jamon",5.0))
	crearSiNoExiste(CrearIngrediente("Queso",2.50))
	crearSiNoExiste(CrearIngrediente("Morron",6.0))
	crearSiNoExiste(CrearIngrediente("Anana",3.0))
	crearSiNoExiste(CrearIngrediente("Anchoa",2.5))
	}
	
	def CrearIngrediente(String nombre, double precio) {
		new Ingrediente(nombre,precio)
	}
	
	def crearSiNoExiste(Ingrediente ingrediente) {
		
			if (this.getIngrediente(ingrediente) === null) { //SI NO EXISTE el ingrediente en el array, getIngr devolvió null
				this.ingredientes.add(ingrediente) // lo guarda en el array
			} else {
				actualizarIngrediente(ingrediente) //Si existe, lo actualiza
			}
			
		}
	
	//A esta altura ya sabemos que existe, q el parámetro tiene nombre (lo usé en doGetIng)
	def actualizarIngrediente(Ingrediente ingrediente) {
		
		val ingredienteAReemplazar = doGetIngrediente(ingrediente)
		ingredienteAReemplazar.reemplazarCon(ingrediente)
	}
	
	//devuelve ingrediente si existe, si no, duvuelve null
	def getIngrediente(Ingrediente ingrediente) {
		 val result= doGetIngrediente(ingrediente)
		 if (result === null){
		 	null
		 } else {
		 	result.copy
		 }
	}
	
	//Devuelve el primer ingrediente que encuentra en el array con pk ingrediente.nombre
	def doGetIngrediente(Ingrediente ingrediente){
		ingredientes.findFirst [it.nombre.equals(ingrediente.nombre)]
		}
	
	static def getInstance() {
		if (instance == null){
			instance =new RepoIngredientes
		}
		instance	
	}
	
}
