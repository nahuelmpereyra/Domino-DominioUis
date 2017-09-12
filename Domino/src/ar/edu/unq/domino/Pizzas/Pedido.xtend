package ar.edu.unq.domino.Pizzas

import ar.edu.unq.domino.EstadosDePedido.Cancelado
import ar.edu.unq.domino.EstadosDePedido.EstadoDePedido
import ar.edu.unq.domino.EstadosDePedido.Preparando
import ar.edu.unq.domino.formasDeEnvio.FormaDeRetiro
import ar.edu.unq.domino.sistema.Cliente
import ar.edu.unq.domino.sistema.Notificador
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter
import java.util.List
import java.util.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Pedido  extends Observable {
	Cliente cliente
	String fecha
	String aclaracion
	List<Plato> platos
	double monto
	EstadoDePedido estado
	FormaDeRetiro formaDeRetiro

	new(Cliente cliente) {
		this.cliente = cliente
		this.aclaracion = ""
		this.platos = newArrayList
		this.monto = 0.0
		this.estado = new Preparando
		var DateTimeFormatter formateador = DateTimeFormatter.ofPattern("yyy/MM/dd HH:mm:ss")
		var LocalDateTime now = LocalDateTime.now
		fecha = formateador.format(now)
		this.addObserver(new Notificador("ciu.dominos.pizza@gmail.com","interfaces2017"))
		
	}

	def void agregarPlato(Plato plato) {
		platos.add(plato)
	}

	def void quitarPlato(Plato plato) {
		platos.remove(plato)
	}

	def montoFinal() {
		var double precioFinal = 0.0
		for (Plato p : platos) {
			precioFinal += p.calcularPrecio.intValue()
		}
		monto = precioFinal + formaDeRetiro.costoEnvio()
	}

	def cancelar() {
		estado = new Cancelado
	}

	def demoroMasDe30Minutos() {
		var ahora = LocalDateTime.now
		var DateTimeFormatter formateador = DateTimeFormatter.ofPattern("yyy/MM/dd HH:mm:ss")
		var fechaPedido = LocalDateTime.parse(this.fecha, formateador)
		ahora.isAfter(fechaPedido.plusMinutes(30))
	}

	def changed(){
		setChanged
	}
}
