package ar.edu.unq.domino.test

import ar.edu.unq.domino.EstadosDePedido.Cancelado
import ar.edu.unq.domino.EstadosDePedido.Preparando
import ar.edu.unq.domino.Pizzas.Pedido
import ar.edu.unq.domino.Pizzas.Plato
import ar.edu.unq.domino.formasDeEnvio.Delivery
import ar.edu.unq.domino.formasDeEnvio.RetiroLocal
import ar.edu.unq.domino.sistema.Cliente
import java.time.LocalDateTime
import org.junit.Before
import org.junit.Test
import org.mockito.Mock
import org.mockito.MockitoAnnotations

import static org.junit.Assert.*
import static org.mockito.Mockito.*

class PedidoTest {

	@Mock Cliente lucas
	@Mock Plato plato1
	@Mock Plato plato2	

	String aclaracion1
	Pedido pedido

	@Before
	def void setUp() {
		MockitoAnnotations.initMocks(this)
		aclaracion1 = "Cliente regular"
		when(lucas.nombre).thenReturn("Lucas")
		when(plato1.calcularPrecio).thenReturn(100.0)
		when(plato2.calcularPrecio).thenReturn(80.0)
		pedido = new Pedido(lucas, "Con morrones", new RetiroLocal)
		pedido.aclaracion = "Cliente regular"
	}


	@Test
	def inicializacionPedido() {
		assertEquals(pedido.platos.size, 0)
		assertEquals(pedido.cliente.nombre, "Lucas")
		assertEquals(pedido.aclaracion, "Cliente regular")
		assertTrue(pedido.estado instanceof Preparando)
		assertTrue(pedido.montoFinal == 0.0)
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
	def calculoPrecioRetiraLocal() {
		pedido.agregarPlato(plato1)
		assertTrue(pedido.montoFinal == 100.0)
	}

	@Test
	def calculoPrecioDelivery() {
		pedido.agregarPlato(plato1)
		pedido.agregarPlato(plato2)
		pedido.formaDeRetiro = new Delivery("Boedo 45845454")
		assertTrue(pedido.montoFinal == 195.0)
	}

	@Test
	def cancelarPedido() {
		pedido.cancelar
		assertEquals(pedido.estado.class, Cancelado)
	}

	@Test
	def pedidoConTiempoDeDemoraSinExceder() {
		var fechaDelPedido = LocalDateTime.now
		pedido.fechaFinPedido = fechaDelPedido
		assertFalse(pedido.demoroMasDe30Minutos())
	}

	@Test
	def pedidoConTiempoDeDemoraExcedido() {
		var fechaDelPedido = LocalDateTime.now.minusMinutes(45)
		pedido.fecha = fechaDelPedido
		pedido.siguienteEstado
		pedido.siguienteEstado
		assertTrue(pedido.demoroMasDe30Minutos())
		
	}
	

}
