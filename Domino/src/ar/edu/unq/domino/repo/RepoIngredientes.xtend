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
		val existe =this.getIngrediente(ingrediente) != null
			if (!existe) {
				this.actualizarIngrediente(ingrediente)
			}
			
		}
	
	def actualizarIngrediente(Ingrediente ingrediente) {
		if (ingrediente.nombre != null){
			ingredientes.add(ingrediente)
		} else {
			val ingredientePosta= doGetIngrediente(ingrediente)
			ingredientePosta.reemplazarCon(ingrediente)
		}
	}
	
	
	def getIngrediente(Ingrediente ingrediente) {
		 val result= doGetIngrediente(ingrediente)
		 if (result == null){
		 	null
		 } else {
		 	result.copy
		 }
	}
	
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
