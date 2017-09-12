package ar.edu.unq.domino.test

import ar.edu.unq.domino.Pizzas.Ingrediente
import ar.edu.unq.domino.Pizzas.Menu
import ar.edu.unq.domino.Pizzas.Promocion
import org.junit.Before
import org.junit.Test
import org.mockito.Mock
import org.mockito.MockitoAnnotations

import static org.junit.Assert.*

class MenuTest {

	@Mock Promocion promo
	@Mock Ingrediente ingrediente

	Ingrediente ingred2
	Menu menu

	@Before
	def void setUp() {
		MockitoAnnotations.initMocks(this)
		menu = new Menu
		ingred2 = new Ingrediente("Jamon", 15)
	}

	@Test
	def agregarPromoAlMenu() {
		assertEquals(menu.promociones.size, 0)
		menu.agregarPromo(promo)
		assertEquals(menu.promociones.size, 1)
	}

	@Test
	def quitarPromoDelMenu() {
		menu.agregarPromo(promo)
		assertEquals(menu.promociones.size, 1)
		assertTrue(menu.promociones.contains(promo))
		menu.quitarPromo(promo)
		assertEquals(menu.promociones.size, 0)

	}

	@Test(expected = Exception)
	def quitarPromoInvalidaDelMenu(){
		menu.quitarPromo(promo)
	}

	 
	@Test
	def agregarIngredienteAlMenu() {
		assertEquals(menu.ingredientes.size, 0)
		menu.agregarIngrediente(ingrediente)
		assertEquals(menu.ingredientes.size, 1)

	}

	@Test
	def quitarIngredienteDelMenu() {
		menu.agregarIngrediente(ingrediente)
		assertEquals(menu.ingredientes.size, 1)
		menu.quitarIngrediente(ingrediente)
		assertEquals(menu.ingredientes.size, 0)

	}

}
