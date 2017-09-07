import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before
import static org.mockito.Mockito.*
import org.mockito.Mock
import org.mockito.MockitoAnnotations
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter


class PedidoTest {

	@Mock Cliente lucas
	@Mock Plato plato1

	String aclaracion1
	RetiroLocal envio1
	Pedido pedido

	@Before
	def void setUp() {
		MockitoAnnotations.initMocks(this)
		aclaracion1 = "Cliente regular"
		envio1 = new RetiroLocal
		when(lucas.nombre).thenReturn("Lucas")
		when(plato1.calcularPrecio).thenReturn(100)
		pedido = new Pedido(lucas)
		pedido.aclaracion = "Cliente regular"
	}

	@Test
	def inicializacionFecha() {
		var DateTimeFormatter formateador = DateTimeFormatter.ofPattern("yyy/MM/dd HH:mm:ss")
		var now = LocalDateTime.now
		var ahora = formateador.format(now)
		assertEquals(pedido.fecha, ahora)
	}

	@Test
	def inicializacionPedido() {
		assertEquals(pedido.platos.size, 0)
		assertEquals(pedido.cliente.nombre, "Lucas")
		assertEquals(pedido.aclaracion, "Cliente regular")
		assertTrue(pedido.estado instanceof Preparando)
		assertEquals(pedido.montoFinal, 0)
	}

	@Test
	def agregarPlatoAPedido() {
		assertEquals(pedido.platos.size, 0)
		pedido.agregarPlato(plato1)
		assertEquals(pedido.platos.size, 1)
	}

	@Test
	def quitarPlatoAPedido() {
		pedido.agregarPlato(plato1)
		assertEquals(pedido.platos.size, 1)
		pedido.quitarPlato(plato1)
		assertEquals(pedido.platos.size, 0)
	}

	@Test
	def calculoPrecio(){
		when(plato1.calcularPrecio).thenReturn(70)
		pedido.agregarPlato(plato1)
		assertEquals(pedido.montoFinal, 70)
		
	}
	
	@Test
	def cancelarPedido(){
		pedido.cancelar
		assertEquals(pedido.estado.class, Cancelado)
	}



}
