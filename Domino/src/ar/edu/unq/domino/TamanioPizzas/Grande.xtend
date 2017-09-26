package ar.edu.unq.domino.TamanioPizzas

class Grande extends TamanioPromo {
	
	new(){
		this.nombre = "Grande"
	}


	override precio() {
		1
	}
	
	override toString() {
		"Grande"
	}
	
}
