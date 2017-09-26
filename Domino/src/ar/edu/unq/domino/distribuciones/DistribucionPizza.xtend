package ar.edu.unq.domino.distribuciones

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@TransactionalAndObservable
@Accessors
abstract class DistribucionPizza extends Entity implements Cloneable{
	
	String nombre

}

