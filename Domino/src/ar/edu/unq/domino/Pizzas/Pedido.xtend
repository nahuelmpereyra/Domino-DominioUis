package ar.edu.unq.domino.Pizzas

import ar.edu.unq.domino.EstadosDePedido.Cancelado
import ar.edu.unq.domino.EstadosDePedido.EstadoDePedido
import ar.edu.unq.domino.EstadosDePedido.Preparando
import ar.edu.unq.domino.formasDeEnvio.FormaDeRetiro
import ar.edu.unq.domino.sistema.Cliente
import java.time.Duration
import java.time.LocalDateTime
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@TransactionalAndObservable
@Accessors
class Pedido extends Entity implements Cloneable {

	int numero
	Cliente cliente
	LocalDateTime fecha
	String aclaracion
	List<Plato> platos
	EstadoDePedido estado
	FormaDeRetiro formaDeRetiro
	long tiempoEspera
	LocalDateTime fechaFinPedido
	

	new(Cliente cliente) {

		this.cliente = cliente
		this.aclaracion = ""
		this.platos = newArrayList
		this.estado = new Preparando
		fecha = LocalDateTime.now
	}

	new() {
		this.platos = newArrayList
		this.estado = new Preparando
		fecha = LocalDateTime.now
	}

	def void agregarPlato(Plato plato) {
		platos.add(plato)
	}

	def void quitarPlato(Plato plato) {
		platos.remove(plato)
	}

	def montoFinal() {
		var precioFinal = platos.stream.mapToDouble[plato | plato.calcularPrecio].sum
		precioFinal + formaDeRetiro.costoEnvio()
	}
	
	def esCerrado() {
		estado.esCerrado
	}

	def cancelar() {
		estado = new Cancelado
	}

	def demoroMasDe30Minutos() {
		tiempoDelPedido > 30
	}

//	def setTiempoEspera() {
//		tiempoEspera = Duration.between(this.fecha, this.fechaFinPedido).toMinutes
//	}
//	
	def tiempoDelPedido() {
		tiempoEspera = Duration.between(this.fecha, this.fechaFinPedido).toMinutes
	}
	
	
	def siguienteEstado() {
		
		this.estado.siguiente(this)
	}
	
	def anteriorEstado() {
			this.estado.anterior(this)
	}
	
	def setFechaDeFinPedido() {
		fechaFinPedido = LocalDateTime.now
	}
	
}
