package ar.edu.unq.domino.test

import ar.edu.unq.domino.Pizzas.DistribucionPizza
import ar.edu.unq.domino.Pizzas.Ingrediente
import ar.edu.unq.domino.Pizzas.IngredientesExtras
import ar.edu.unq.domino.Pizzas.Promocion
import org.junit.Before
import org.junit.Test
import org.mockito.Mock
import org.mockito.MockitoAnnotations
import org.mockito.Spy

import static org.junit.Assert.*

class PromoTest {

	Promocion promo
	@Mock Ingrediente jamon
	@Mock Ingrediente morron
	@Spy IngredientesExtras distribucion

	@Before
	def void setUp() {
		MockitoAnnotations.initMocks(this)
		promo = new Promocion("Jamon", 50, distribucion)
	}

	@Test
	def listaDeIngredientes() {
		assertTrue(promo.listaDeIngredientes.isEmpty)
		promo.getIngredientesBase.agregarIngrediente(jamon, DistribucionPizza.Toda)
		assertTrue(promo.listaDeIngredientes.contains(jamon))
	}

	@Test
	def cantidadDeIngredientes() {
		assertEquals(promo.cantidadDeIngredientes, 0)
		promo.getIngredientesBase.agregarIngrediente(jamon, DistribucionPizza.Toda)
		assertEquals(promo.cantidadDeIngredientes, 1)
	}

	@Test
	def agregarUnIngredienteALaPromoTest() {
		assertEquals(promo.cantidadDeIngredientes, 0)
		promo.agregarIngrediente(jamon, DistribucionPizza.Toda)
		assertEquals(promo.cantidadDeIngredientes, 1)
		assertTrue(promo.listaDeIngredientes.contains(jamon))

	}

	@Test
	def quitarUnIngredienteALaPromoTest() {
		promo.agregarIngrediente(jamon, DistribucionPizza.MitadDerecha)
		promo.agregarIngrediente(morron, DistribucionPizza.MitadDerecha)
		assertEquals(promo.cantidadDeIngredientes, 2)
		promo.quitarIngrediente(jamon)
		assertEquals(promo.cantidadDeIngredientes, 1)
		assertFalse(promo.listaDeIngredientes.contains(jamon))

	}

	@Test(expected=Exception)
	def quitarUnIngredienteInvalidoALaPromoTest() {
		promo.quitarIngrediente(jamon)
	}

	@Test
	def editarNombrePromo() {
		promo.editarNombre("Jamon y Morron")
		assertEquals(promo.nombrePromo, "Jamon y Morron")
	}

	@Test
	def editarPrecio() {
		promo.editarPrecio(100)
		assertTrue(promo.precioBase == 100)
	}

}
