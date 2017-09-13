package ar.edu.unq.domino.test

import ar.edu.unq.domino.sistema.Cliente
import ar.edu.unq.domino.sistema.Sistema
import org.junit.Before
import org.junit.Test
import org.mockito.Mock
import org.mockito.MockitoAnnotations

import static org.junit.Assert.*
import static org.mockito.Mockito.*
import ar.edu.unq.domino.Pizzas.Pedido
import ar.edu.unq.domino.Pizzas.Plato
import ar.edu.unq.domino.formasDeEnvio.RetiroLocal
import ar.edu.unq.domino.EstadosDePedido.Entregado
import ar.edu.unq.domino.EstadosDePedido.Cancelado

class SistemaTest {
	@Mock Cliente lucas = mock(Cliente)
	@Mock Cliente ramiro = mock(Cliente)
	
	Sistema sistema
	
	@Mock Plato plato1
	@Mock Plato plato2

	String aclaracion1
	RetiroLocal envio1
	Pedido pedido
	Pedido pedido2

	@Before
	def void setUp() {
		MockitoAnnotations.initMocks(this)
		sistema = new Sistema
		MockitoAnnotations.initMocks(this)
		aclaracion1 = "Cliente regular"
		envio1 = new RetiroLocal
		when(lucas.nombre).thenReturn("Lucas")
		when(plato1.calcularPrecio).thenReturn(100.0)
		when(plato2.calcularPrecio).thenReturn(80.0)
		pedido = new Pedido(lucas)
		pedido.aclaracion = "Cliente regular"
		pedido.formaDeRetiro = new RetiroLocal
		pedido2 = new Pedido(lucas)
	}

	@Test
	def inicializacionSistema() {

		assertEquals(sistema.clientes.size(), 0)
		assertEquals(sistema.pedidos.size(), 0)
	}

	@Test
	def registrarUnCliente() {

		sistema.registrarCliente(ramiro)
		assertEquals(sistema.clientes.size, 1)
		assertTrue(sistema.clientes.contains(ramiro))
	}

	@Test(expected=Exception)
	def alQuererRegistrar2ClientesConElMismoNickNoLoRegistra() {

		when(ramiro.nick).thenReturn("SHAMAINCO")
		when(ramiro.email).thenReturn("shamainco@gmail.com")
		when(lucas.nick).thenReturn("SHAMAINCO")
		when(lucas.email).thenReturn("lpier@gmail.com")
		sistema.registrarCliente(ramiro)
		sistema.registrarCliente(lucas)
		assertEquals(sistema.clientes.size, 1)
		assertTrue(sistema.clientes.contains(ramiro))
		assertFalse(sistema.clientes.contains(lucas))
	}

	@Test(expected=Exception)
	def void alQuererRegistrar2ClientesConElMismoMailNoLoRegistra() {

		when(ramiro.nick).thenReturn("SHAMAINCO")
		when(ramiro.email).thenReturn("emailfalso@gmail.com")
		when(lucas.nick).thenReturn("LPIER")
		when(lucas.email).thenReturn("emailfalso@gmail.com")
		sistema.registrarCliente(lucas)
		sistema.registrarCliente(ramiro)
	}

	@Test 
	def registrarPedido(){
		sistema.realizarPedido(pedido)
		assertTrue(sistema.pedidos.contains(pedido))
	}
	
	@Test
	def cancelarPedido(){
		sistema.realizarPedido(pedido)
		sistema.cancelarPedido(pedido)
		assertTrue(pedido.estado instanceof Cancelado)
	}
	
	@Test
	def filtrarPedidosCancelados(){
		sistema.realizarPedido(pedido)
		assertEquals(sistema.pedidosCancelados.size, 0)
		sistema.cancelarPedido(pedido)
		assertEquals(sistema.pedidosCancelados.size, 1)
		assertTrue(sistema.pedidosCancelados.contains(pedido))
	}
	
	@Test
	def filtrarPedidosEntregados(){
		sistema.realizarPedido(pedido)
		assertEquals(sistema.pedidosEntregados.size, 0)
		pedido.estado = new Entregado
		assertEquals(sistema.pedidosEntregados.size, 1)
		assertTrue(sistema.pedidosEntregados.contains(pedido))
	}
	
		@Test
	def filtrarPedidosCerrados(){
		assertEquals(sistema.pedidosCerrados.size, 0)
		sistema.realizarPedido(pedido)
		sistema.realizarPedido(pedido2)
		sistema.cancelarPedido(pedido)
		pedido2.estado = new Entregado
		assertEquals(sistema.pedidosCerrados.size, 2)
		assertTrue(sistema.pedidosCerrados.contains(pedido))
		assertTrue(sistema.pedidosCerrados.contains(pedido2))
		
	}
	
}
