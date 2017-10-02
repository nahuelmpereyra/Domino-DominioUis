package ar.edu.unq.domino.test

import ar.edu.unq.domino.EstadosDePedido.Cancelado
import ar.edu.unq.domino.EstadosDePedido.EnViaje
import ar.edu.unq.domino.EstadosDePedido.Entregado
import ar.edu.unq.domino.EstadosDePedido.ListoParaEnviar
import ar.edu.unq.domino.EstadosDePedido.ListoParaRetirar
import ar.edu.unq.domino.EstadosDePedido.Preparando
import ar.edu.unq.domino.Mailing.GMailSender
import ar.edu.unq.domino.Pizzas.Pedido
import ar.edu.unq.domino.formasDeEnvio.Delivery
import ar.edu.unq.domino.formasDeEnvio.RetiroLocal
import ar.edu.unq.domino.sistema.Cliente
import java.time.LocalDateTime
import org.junit.Before
import org.junit.Test
import org.mockito.Mock
import org.mockito.MockitoAnnotations
import org.uqbar.commons.model.exceptions.UserException

import static org.junit.Assert.*
import static org.mockito.Mockito.*

class EstadosTest {

	Pedido pedidoLocal
	Pedido pedidoDelivery
	RetiroLocal retiroLocal
	Delivery retiroDelivery
	@Mock Cliente lucas
	@Mock Cliente martin
	@Mock GMailSender notificador

	

	@Before
	def void setUp() {
		MockitoAnnotations.initMocks(this)
		pedidoLocal = new Pedido(martin)
		pedidoDelivery = new Pedido(lucas)
		retiroLocal = new RetiroLocal
		retiroDelivery = new Delivery
		pedidoLocal.formaDeRetiro = retiroLocal
		pedidoDelivery.formaDeRetiro = retiroDelivery 
		GMailSender.config(notificador)
		when(lucas.email).thenReturn("nahuelmpereyra@gmail.com")
		when(lucas.nombre).thenReturn("Nahuel")
		
	}

	@Test
	def void unPedidoLocalSePuedeCancelar() {
		assertTrue(pedidoLocal.estado instanceof Preparando)
		pedidoLocal.cancelar
		assertTrue(pedidoLocal.estado instanceof Cancelado)
	}

	@Test(expected = UserException)
	def void pedidoLocalDePreparandoAEstadoPrevio() {
		assertTrue(pedidoLocal.estado instanceof Preparando)
		pedidoLocal.estado.anterior(pedidoLocal)
	}

	@Test
	def void pedidoLocalDePreparandoAEstadoSiguiente() {
		assertTrue(pedidoLocal.estado instanceof Preparando)
		pedidoLocal.estado.siguiente(pedidoLocal)
		assertTrue(pedidoLocal.estado instanceof ListoParaRetirar)
	}

	@Test
	def void pedidoLocalDeListoParaRetirarAEstadoPrevio() {
		pedidoLocal.estado.siguiente(pedidoLocal)
		assertTrue(pedidoLocal.estado instanceof ListoParaRetirar)
		pedidoLocal.estado.anterior(pedidoLocal)
		assertTrue(pedidoLocal.estado instanceof Preparando)
	}

	@Test
	def void pedidoLocalDeListoParaRetirarAEstadoSiguiente() {
		pedidoLocal.estado.siguiente(pedidoLocal)
		assertTrue(pedidoLocal.estado instanceof ListoParaRetirar)
		pedidoLocal.estado.siguiente(pedidoLocal)
		assertTrue(pedidoLocal.estado instanceof Entregado)

	}

	@Test(expected = UserException)
	def void pedidoLocalDeEntregadoAEstadoPrevio() {
		pedidoLocal.estado.siguiente(pedidoLocal)
		pedidoLocal.estado.siguiente(pedidoLocal)
		assertTrue(pedidoLocal.estado instanceof Entregado)
		pedidoLocal.estado.anterior(pedidoLocal)
	}

	@Test(expected = UserException)
	def void pedidoLocalDeEntregadoAEstadoSiguiente() {
		pedidoLocal.estado.siguiente(pedidoLocal)
		pedidoLocal.estado.siguiente(pedidoLocal)
		assertTrue(pedidoLocal.estado instanceof Entregado)
		pedidoLocal.estado.siguiente(pedidoLocal)
	}

	@Test
	def void unPedidoDeliverySePuedeCancelar() {
		assertTrue(pedidoDelivery.estado instanceof Preparando)
		pedidoDelivery.cancelar
		assertTrue(pedidoDelivery.estado instanceof Cancelado)
	}

	@Test(expected = UserException)
	def void pedidoDeliveryDePreparandoAEstadoPrevio() {
		assertTrue(pedidoDelivery.estado instanceof Preparando)
		pedidoDelivery.estado.anterior(pedidoDelivery)
	}

	@Test
	def void pedidoDeliveryDePreparandoAEstadoSiguiente() {
		assertTrue(pedidoDelivery.estado instanceof Preparando)
		pedidoDelivery.estado.siguiente(pedidoDelivery)
		assertTrue(pedidoDelivery.estado instanceof ListoParaEnviar)
	}

	@Test
	def void pedidoDeliveryDeListoParaEnviarAEstadoPrevio() {
		pedidoDelivery.estado.siguiente(pedidoDelivery)
		assertTrue(pedidoDelivery.estado instanceof ListoParaEnviar)
		pedidoDelivery.estado.anterior(pedidoDelivery)
		assertTrue(pedidoDelivery.estado instanceof Preparando)
	}

	@Test
	def void pedidoDeliveryDeListoParaEnviarAEstadoSiguiente() {
	
		pedidoDelivery.estado.siguiente(pedidoDelivery)
		assertTrue(pedidoDelivery.estado instanceof ListoParaEnviar)
		pedidoDelivery.estado.siguiente(pedidoDelivery)
		assertTrue(pedidoDelivery.estado instanceof EnViaje)
		verify(notificador, times(1)).notificarPedidoEnViaje(pedidoDelivery)
		verify(notificador, times(0)).notificarPedidoDemorado(pedidoDelivery)
	}
	

	@Test
	def void pedidoDeliveryDeEnViajeAEstadoPrevio() {
		pedidoDelivery.estado.siguiente(pedidoDelivery)
		pedidoDelivery.estado.siguiente(pedidoDelivery)
		assertTrue(pedidoDelivery.estado instanceof EnViaje)
		pedidoDelivery.estado.anterior(pedidoDelivery)
		assertTrue(pedidoDelivery.estado instanceof ListoParaEnviar)
	}

	@Test
	def void pedidoDeliveryDeEnViajeAEstadoSiguiente() {
		var LocalDateTime delay = LocalDateTime.now.minusMinutes(45)	
		pedidoDelivery.estado.siguiente(pedidoDelivery)
		pedidoDelivery.estado.siguiente(pedidoDelivery)
		assertTrue(pedidoDelivery.estado instanceof EnViaje)
		pedidoDelivery.fecha = delay
		pedidoDelivery.estado.siguiente(pedidoDelivery)
//		println(pedidoDelivery.fecha)
//		println(pedidoDelivery.fechaFinPedido)
//		println(pedidoDelivery.tiempoEspera)
		verify(notificador, times(1)).notificarPedidoDemorado(pedidoDelivery)
		assertTrue(pedidoDelivery.estado instanceof Entregado)
		assertTrue(pedidoDelivery.demoroMasDe30Minutos)
	}

	@Test(expected = UserException)
	def void pedidoDeliveryDeEntregadoAEstadoPrevio() {
		pedidoDelivery.estado.siguiente(pedidoDelivery)
		pedidoDelivery.estado.siguiente(pedidoDelivery)
		pedidoDelivery.estado.siguiente(pedidoDelivery)
		assertTrue(pedidoDelivery.estado instanceof Entregado)
		pedidoDelivery.estado.anterior(pedidoDelivery)
	}

	@Test(expected = UserException)
	def void pedidoDeliveryDeEntregadoAEstadoSiguiente() {
		pedidoDelivery.estado.siguiente(pedidoDelivery)
		pedidoDelivery.estado.siguiente(pedidoDelivery)
		pedidoDelivery.estado.siguiente(pedidoDelivery)
		assertTrue(pedidoDelivery.estado instanceof Entregado)
		pedidoDelivery.estado.siguiente(pedidoDelivery)

	}

}
