import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before
import static org.mockito.Mockito.*
import java.util.Date
import java.text.SimpleDateFormat
import org.mockito.Mock
import org.mockito.MockitoAnnotations

class PedidoTest {

	@Mock Cliente lucas
	@Mock Plato plato1

	Date fecha1
	SimpleDateFormat formateador
	String aclaracion1
	RetiroLocal envio1
	Delivery envioDelivery
	Pedido pedido
	Pedido pedidoDelivery

	@Before
	def void setUp() {
		MockitoAnnotations.initMocks(this)
		formateador = new SimpleDateFormat("dd-MM-yyyy");
		fecha1 = new Date();
		aclaracion1 = "Cliente regular"
		envio1 = new RetiroLocal
		envioDelivery = new Delivery("Boedo 500")
		when(lucas.nombre).thenReturn("Lucas")
		when(plato1.calcularPrecio).thenReturn(100)
		pedido = new Pedido(lucas, envio1)
		pedido.aclaracion = "Cliente regular"
		pedidoDelivery = new Pedido(lucas, envioDelivery)
	}

	@Test
	def inicializacionPedido() {
		/*
		 * Habr�a que corregir este test, ya que ma�ana va a fallar porque cambia la fecha.
		 */
		assertEquals(pedido.platos.size, 0)
		assertEquals(pedido.cliente.nombre, "Lucas")
		assertEquals(pedido.aclaracion, "Cliente regular")
		pedido.finalizarPedido
		assertEquals(pedido.fecha, "07/09/2017 00:07")
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
