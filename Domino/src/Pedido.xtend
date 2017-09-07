import java.sql.Timestamp
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter


@Accessors
class Pedido {
	Cliente cliente
	String fecha
	String aclaracion
	List<Plato> platos
	Integer monto
	EstadoDePedido estado
	FormaDeRetiro formaDeRetiro

	new(Cliente cliente) {
		this.cliente = cliente
		this.aclaracion = ""
		this.platos = newArrayList
		this.monto = 0
		this.estado = new Preparando
		var DateTimeFormatter formateador = DateTimeFormatter.ofPattern("yyy/MM/dd HH:mm:ss")
		var LocalDateTime now = LocalDateTime.now
		fecha = formateador.format(now)
	}

	def agregarPlato(Plato plato) {
		platos.add(plato)
	}

	def quitarPlato(Plato plato) {
		platos.remove(plato)
	}

	def montoFinal() {
		var int precioFinal = 0
		for (Plato p : platos) {
			precioFinal += p.calcularPrecio.intValue()
		}
		monto = precioFinal
	}
	
	def cancelar() {
		estado = new Cancelado
	}
	
/*
	def finalizarPedido() {

		this.fecha = sdf.format(new Timestamp(System.currentTimeMillis()))
	}
 */
}
