package ar.edu.unq.domino.Pizzas

import ar.edu.unq.domino.distribuciones.DistribucionPizza
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class IngredienteConDistribucion {

	Ingrediente ingrediente
	DistribucionPizza distribucion
	
	new(Ingrediente ing, DistribucionPizza dist){
		ingrediente = ing
		distribucion = dist
	}
	
}