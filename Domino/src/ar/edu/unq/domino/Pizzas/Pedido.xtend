package ar.edu.unq.domino.Pizzas

import ar.edu.unq.domino.EstadosDePedido.Cancelado
import ar.edu.unq.domino.EstadosDePedido.EstadoDePedido
import ar.edu.unq.domino.EstadosDePedido.Preparando
import ar.edu.unq.domino.formasDeEnvio.FormaDeRetiro
import ar.edu.unq.domino.sistema.Cliente
import java.time.Duration
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@TransactionalAndObservable
@Accessors
class Pedido extends Entity implements Cloneable {

	int numero
	Cliente cliente
	//TODO: Cambiar a fecha
	String fecha
	String aclaracion
	List<Plato> platos
	EstadoDePedido estado
	FormaDeRetiro formaDeRetiro
	//TODO: ??? String?
	String tiempoEspera

	new(Cliente cliente) {

		this.cliente = cliente
		this.aclaracion = ""
		this.platos = newArrayList
		this.estado = new Preparando
		var DateTimeFormatter formateador = DateTimeFormatter.ofPattern("yyy/MM/dd HH:mm:ss")
		var LocalDateTime now = LocalDateTime.now
		fecha = formateador.format(now)
	}

	new() {
		this.platos = newArrayList
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
		var ahora = LocalDateTime.now
		var DateTimeFormatter formateador = DateTimeFormatter.ofPattern("yyy/MM/dd HH:mm:ss")
		var fechaPedido = LocalDateTime.parse(this.fecha, formateador)
		ahora.isAfter(fechaPedido.plusMinutes(30))
	}

	def setTiempoEspera() {
		var ahora = LocalDateTime.now
		var DateTimeFormatter formateador = DateTimeFormatter.ofPattern("yyy/MM/dd HH:mm:ss")
		var fechaPedido = LocalDateTime.parse(this.fecha, formateador)
		tiempoEspera = Duration.between(fechaPedido, ahora).toMinutes.toString + " mins" //TODO: Lógica de vista
	}
}
