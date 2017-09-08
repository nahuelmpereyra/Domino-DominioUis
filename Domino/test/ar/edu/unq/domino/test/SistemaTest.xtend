package ar.edu.unq.domino.test

import ar.edu.unq.domino.sistema.Cliente
import ar.edu.unq.domino.sistema.Sistema
import org.junit.Before
import org.junit.Test
import org.mockito.Mock
import org.mockito.MockitoAnnotations

import static org.junit.Assert.*
import static org.mockito.Mockito.*
import ar.edu.unq.domino.sistema.GMailSender

class SistemaTest {
	@Mock Cliente lucas = mock(Cliente)
	@Mock Cliente ramiro = mock(Cliente)
	Sistema sistema

	@Before
	def void setUp() {
		MockitoAnnotations.initMocks(this)
		sistema = new Sistema
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

	/*
	 * 
	 * 	@Test
	 * 	def alAgregarUnMenuEsteSeAgrega() {

	 * 
	 * 		assertEquals(sistema.menu.class, Menu)
	 * 	}
	 * 	Al crear el sistema ya tendria que venir con un menu y no depender de si lo agregan o no
	 */
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
	def void notificarUnPedidoEnViaje() {
		GMailSender.config(new GMailSender("ciu.dominos.pizza@gmail.com", "interfaces2017"))
		when(ramiro.email).thenReturn("shamainco@gmail.com")

		sistema.notificarPedidoEnViaje(ramiro)
	}

	@Test
	def void notificarUnPedidoDemorado() {
		GMailSender.config(new GMailSender("ciu.dominos.pizza@gmail.com", "interfaces2017"))
		when(ramiro.email).thenReturn("shamainco@gmail.com")

		sistema.notificarPedidoDemorado(ramiro)
	}

}
