package ar.edu.unq.domino.Pizzas

import ar.edu.unq.domino.EstadosDePedido.Cancelado
import ar.edu.unq.domino.EstadosDePedido.EstadoDePedido
import ar.edu.unq.domino.EstadosDePedido.Preparando
import ar.edu.unq.domino.formasDeEnvio.FormaDeRetiro
import ar.edu.unq.domino.sistema.Cliente
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.Entity

@TransactionalAndObservable
@Accessors
class Pedido extends Entity implements Cloneable {

	int numero
	Cliente cliente
	String fecha
	String aclaracion
	List<Plato> platos
	double monto
	EstadoDePedido estado
	FormaDeRetiro formaDeRetiro
	int esCerrado
	LocalDateTime tiempoEspera

	new(Cliente cliente) {

		this.cliente = cliente
		this.aclaracion = ""
		this.platos = newArrayList
		this.monto = montoFinal()
		this.estado = new Preparando
		var DateTimeFormatter formateador = DateTimeFormatter.ofPattern("yyy/MM/dd HH:mm:ss")
		var LocalDateTime now = LocalDateTime.now
		fecha = formateador.format(now)
	}

	new() {
		this.platos = newArrayList
		this.monto = 0
		this.estado = new Preparando
		var DateTimeFormatter formateador = DateTimeFormatter.ofPattern("yyy/MM/dd HH:mm:ss")
		var LocalDateTime now = LocalDateTime.now
		fecha = formateador.format(now)

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
		this.esCerrado = 1

	}

	def demoroMasDe30Minutos() {
		var ahora = LocalDateTime.now
		var DateTimeFormatter formateador = DateTimeFormatter.ofPattern("yyy/MM/dd HH:mm:ss")
		var fechaPedido = LocalDateTime.parse(this.fecha, formateador)
		ahora.isAfter(fechaPedido.plusMinutes(30))
	}

	def setTiempoEspera() {
		var ahora = LocalDateTime.now
		var DateTimeFormatter formateador = DateTimeFormatter.ofPattern("yyy/MM/dd HH:mm:ss")
		var fechaPedido = LocalDateTime.parse(this.fecha, formateador)
		tiempoEspera = ahora.minusMinutes(fechaPedido.minute)
	}

// def esCerrado () {
// return this.estado == Entregado || this.estado == Cancelado
// }
}
