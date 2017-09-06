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
	Integer monto
	EstadoDePedido estado

	new(Cliente cliente) {
		this.cliente = cliente
		this.fecha = fecha
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
		monto = precioFinal
	}

}
