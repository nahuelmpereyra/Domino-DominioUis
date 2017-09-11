package ar.edu.unq.domino.EstadosDePedido

class ListoParaEnviar extends EstadoDePedido {

	override proximo() {
		new EnViaje
	}

	override previo() {
		new Preparando
	}

}
