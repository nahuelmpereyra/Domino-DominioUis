import java.sql.Timestamp
import java.text.SimpleDateFormat
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Pedido {
	Cliente cliente
	String fecha
	String aclaracion
	FormaDeEnvio formaDeEnvio
	List<Plato> platos
	Integer monto
	EstadoDePedido estado

	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/YYYY HH:mm");

	new(Cliente cliente, FormaDeEnvio formaDeEnvio) {
		this.cliente = cliente
		this.formaDeEnvio = formaDeEnvio
		this.aclaracion = ""
		this.platos = newArrayList
		this.monto = 0
		this.estado = new Preparando
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
		monto = precioFinal + formaDeEnvio.recargo
	}

	def finalizarPedido() {

		this.fecha = sdf.format(new Timestamp(System.currentTimeMillis()))
	}

}
