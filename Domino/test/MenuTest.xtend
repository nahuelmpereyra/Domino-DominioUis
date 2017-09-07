import org.junit.Test
import static org.junit.Assert.*
import org.junit.Before
import org.mockito.Mock
import org.mockito.MockitoAnnotations

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
		menu.quitarPromo(promo)
		assertEquals(menu.promociones.size, 0)

	}

	/*
	 * @Test(expected=Exception)
	 * def quitarPromoInvalidaDelMenu() {
	 * 	menu.quitarPromo(promo)

	 * }
	 */
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
