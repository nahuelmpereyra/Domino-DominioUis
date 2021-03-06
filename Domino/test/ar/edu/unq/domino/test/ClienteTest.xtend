package ar.edu.unq.domino.test

import ar.edu.unq.domino.Pizzas.Pedido
import ar.edu.unq.domino.sistema.Cliente
import org.junit.Before
import org.junit.Test
import org.mockito.Mock
import org.mockito.MockitoAnnotations

import static org.junit.Assert.*

class ClienteTest {

	Cliente cliente
	@Mock Pedido pedido

	@Before
	def void setUp() {
		MockitoAnnotations.initMocks(this)
		cliente = new Cliente("Ramiro", "Shamainco", "pepe123", "shamainco@gmail.com", "Av.falsa123")
	}

	@Test
	def inicializacionCliente() {
		assertEquals(cliente.nombre, "Ramiro")
		assertEquals(cliente.historial.size, 0)
	}

	@Test
	def agregarPedido() {
		cliente.agregarPedido(pedido)
		assertTrue(cliente.historial.contains(pedido))
	}

}
