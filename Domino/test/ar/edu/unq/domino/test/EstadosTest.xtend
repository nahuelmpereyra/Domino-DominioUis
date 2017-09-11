package ar.edu.unq.domino.test

import ar.edu.unq.domino.EstadosDePedido.Cancelado
import ar.edu.unq.domino.EstadosDePedido.EnViaje
import ar.edu.unq.domino.EstadosDePedido.Entregado
import ar.edu.unq.domino.EstadosDePedido.ListoParaEnviar
import ar.edu.unq.domino.EstadosDePedido.ListoParaRetirar
import ar.edu.unq.domino.EstadosDePedido.Preparando
import ar.edu.unq.domino.Pizzas.Pedido
import ar.edu.unq.domino.formasDeEnvio.Delivery
import ar.edu.unq.domino.formasDeEnvio.RetiroLocal
import ar.edu.unq.domino.sistema.Cliente
import org.junit.Before
import org.junit.Test
import org.mockito.Mock
import org.mockito.MockitoAnnotations

import static org.junit.Assert.*

class EstadosTest {

	Pedido pedidoLocal
	Pedido pedidoDelivery
	RetiroLocal retiroLocal
	Delivery retiroDelivery
	@Mock Cliente lucas
	@Mock Cliente martin

	@Before
	def void setUp() {
		MockitoAnnotations.initMocks(this)
		pedidoLocal = new Pedido(lucas)
		pedidoDelivery = new Pedido(martin)
		retiroLocal = new RetiroLocal()
		retiroDelivery = new Delivery()
		pedidoLocal.formaDeRetiro = retiroLocal
		pedidoDelivery.formaDeRetiro = retiroDelivery

	}

	@Test
	def void unPedidoLocalSePuedeCancelar() {
		assertTrue(pedidoLocal.estado instanceof Preparando)
		pedidoLocal.cancelar
		assertTrue(pedidoLocal.estado instanceof Cancelado)
	}

	@Test
	def void pedidoLocalDePreparandoAEstadoPrevio() {
		assertTrue(pedidoLocal.estado instanceof Preparando)
		pedidoLocal.estado.anterior(pedidoLocal)
		assertTrue(pedidoLocal.estado instanceof Preparando)
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

	@Test
	def void pedidoLocalDeEntregadoAEstadoPrevio() {
		pedidoLocal.estado.siguiente(pedidoLocal)
		pedidoLocal.estado.siguiente(pedidoLocal)
		assertTrue(pedidoLocal.estado instanceof Entregado)
		pedidoLocal.estado.anterior(pedidoLocal)
		assertTrue(pedidoLocal.estado instanceof Entregado)
	}

	@Test
	def void pedidoLocalDeEntregadoAEstadoSiguiente() {
		pedidoLocal.estado.siguiente(pedidoLocal)
		pedidoLocal.estado.siguiente(pedidoLocal)
		assertTrue(pedidoLocal.estado instanceof Entregado)
		pedidoLocal.estado.siguiente(pedidoLocal)
		assertTrue(pedidoLocal.estado instanceof Entregado)
	}

	@Test
	def void unPedidoDeliverySePuedeCancelar() {
		assertTrue(pedidoDelivery.estado instanceof Preparando)
		pedidoDelivery.cancelar
		assertTrue(pedidoDelivery.estado instanceof Cancelado)
	}

	@Test
	def void pedidoDeliveryDePreparandoAEstadoPrevio() {
		assertTrue(pedidoDelivery.estado instanceof Preparando)
		pedidoDelivery.estado.anterior(pedidoDelivery)
		assertTrue(pedidoDelivery.estado instanceof Preparando)
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
		pedidoDelivery.estado.siguiente(pedidoDelivery)
		pedidoDelivery.estado.siguiente(pedidoDelivery)
		assertTrue(pedidoDelivery.estado instanceof EnViaje)
		pedidoDelivery.estado.siguiente(pedidoDelivery)
		assertTrue(pedidoDelivery.estado instanceof Entregado)
	}

	@Test
	def void pedidoDeliveryDeEntregadoAEstadoPrevio() {
		pedidoDelivery.estado.siguiente(pedidoDelivery)
		pedidoDelivery.estado.siguiente(pedidoDelivery)
		pedidoDelivery.estado.siguiente(pedidoDelivery)
		assertTrue(pedidoDelivery.estado instanceof Entregado)
		pedidoDelivery.estado.anterior(pedidoDelivery)
		assertTrue(pedidoDelivery.estado instanceof Entregado)
	}

	@Test
	def void pedidoDeliveryDeEntregadoAEstadoSiguiente() {
		pedidoDelivery.estado.siguiente(pedidoDelivery)
		pedidoDelivery.estado.siguiente(pedidoDelivery)
		pedidoDelivery.estado.siguiente(pedidoDelivery)
		assertTrue(pedidoDelivery.estado instanceof Entregado)
		pedidoDelivery.estado.siguiente(pedidoDelivery)
		assertTrue(pedidoDelivery.estado instanceof Entregado)
	}

}
