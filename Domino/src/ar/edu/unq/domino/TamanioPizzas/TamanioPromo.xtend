package ar.edu.unq.domino.TamanioPizzas

import org.uqbar.commons.model.Entity
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@TransactionalAndObservable
@Accessors
abstract class TamanioPromo extends Entity implements Cloneable{

	String nombre
	
	def double precio()
}
