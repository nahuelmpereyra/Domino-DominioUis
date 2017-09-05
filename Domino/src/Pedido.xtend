import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.Date

@Accessors
class Pedido {
	Cliente cliente
	Date fecha
	String aclaracion
	FormaDeEnvio formaDeEnvio
	List<Plato> platos
	EstadoDePedido estado

	new(Cliente cliente, Date fecha, String aclaracion, FormaDeEnvio envio) {
		this.cliente = cliente
		this.fecha = fecha
		this.aclaracion = aclaracion
		this.formaDeEnvio = envio
		this.platos = newArrayList
		this.estado = new Preparando
	}

	def agregarPlato(Plato plato) {
		platos.add(plato)
	}

	def montoFinal() {
		var monto = 0
		for (Plato p : platos) {
			monto += p.monto + formaDeEnvio.recargo
		}
		return monto
	}

}
