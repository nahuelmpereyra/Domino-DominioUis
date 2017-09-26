package ar.edu.unq.domino.TamanioPizzas

import org.uqbar.commons.model.Entity
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class TamanioPromo extends Entity implements Cloneable{

	String nombre
	
	def double precio()
}
