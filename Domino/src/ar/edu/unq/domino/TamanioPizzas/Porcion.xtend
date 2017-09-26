package ar.edu.unq.domino.TamanioPizzas

class Porcion extends TamanioPromo {
	
	new(){
		this.nombre = "Porcion"
	}

	override precio() {
		0.125
	}

	override toString() {
		"Porcion"
	}
}
