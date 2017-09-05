import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before
import static org.mockito.Mockito.*
import java.util.Date
import java.text.SimpleDateFormat

class PedidoTest {

	Cliente lucas = mock(Cliente)
	Plato plato1 = mock(Plato)

	SimpleDateFormat formateador = new SimpleDateFormat("dd-MM-yyyy");
	Date fecha1 = new Date();
	String aclaracion1 = "Cliente regular"
	FormaDeEnvio envio1 = new RetiroLocal
	FormaDeEnvio envioDelivery = new Delivery("Boedo 500")

	Pedido pedido = new Pedido(lucas, fecha1, aclaracion1, envio1)
	Pedido pedidoDelivery = new Pedido(lucas, fecha1, aclaracion1, envioDelivery)

	@Before
	def void setUp() {
		when(lucas.nombre).thenReturn("Lucas")
		when(plato1.monto).thenReturn(100)
	}

	@Test
	def inicializacionPedido() {
		/*
		 * Habría que corregir este test, ya que mañana va a fallar porque cambia la fecha.
		 */
		assertEquals(pedido.platos.size, 0)
		assertEquals(pedido.cliente.nombre, "Lucas")
		assertEquals(pedido.aclaracion, "Cliente regular")
		assertEquals(formateador.format(pedido.fecha), "05-09-2017")
		assertTrue(pedido.estado instanceof Preparando)
	}

	@Test
	def agregarPlatoAPedido() {
		assertEquals(pedido.platos.size, 0)
		pedido.agregarPlato(plato1)
		assertEquals(pedido.platos.size, 1)
	}

	@Test
	def calcularMontoRetiroPorLocal() {
		pedido.agregarPlato(plato1)
		assertEquals(pedido.montoFinal, 100)
	}

	@Test
	def calcularMontoDelivery() {
		pedidoDelivery.agregarPlato(plato1)
		assertEquals(pedidoDelivery.montoFinal, 115)
	}

}
