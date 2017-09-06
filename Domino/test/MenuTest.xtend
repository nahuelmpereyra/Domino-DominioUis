import org.junit.Test
import static org.junit.Assert.*
import static org.mockito.Mockito.*

class MenuTest {
	Cliente lucas = mock(Cliente)
	Cliente ramiro = mock(Cliente)
	Promocion promo = mock(Promocion)
	Ingrediente ingrediente = mock(Ingrediente)

	Menu menu = new Menu
	Promocion promo2 = new Promocion("Muzza", 70, newArrayList, newArrayList)
	Ingrediente ingred2 = new Ingrediente("Jamon", 15)

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

	@Test
	def editarNombreAUnaPromoEnElMenu() {
		menu.agregarPromo(promo2)
		assertEquals(menu.promociones.get(0).nombrePromo, "Muzza")
		promo2.editarNombre("Muzzarella")
		assertEquals(menu.promociones.get(0).nombrePromo, "Muzzarella")
	}

	@Test
	def editarPrecioAUnaPromoEnElMenu() {
		menu.agregarPromo(promo2)
		assertTrue(menu.promociones.get(0).precioBase == 70)
		promo2.editarPrecio(80)
		assertTrue(menu.promociones.get(0).precioBase == 80)
	}

	@Test
	def agregarIngredienteAUnaPromoEnElMenu() {
		menu.agregarPromo(promo2)
		assertEquals(menu.promociones.get(0).ingredientes.size(), 0)
		promo2.agregarIngrediente(ingred2, DistribucionPizza.Toda)
		assertEquals(menu.promociones.get(0).ingredientes.size(), 1)
	}

	@Test
	def alAgregarUnIngredienteAUnaPromoEnElMenuElPrecioSeActualiza() {
		menu.agregarPromo(promo2)
		assertTrue(menu.promociones.get(0).precioBase == 70)
		promo2.agregarIngrediente(ingred2, DistribucionPizza.Toda)
		assertTrue(menu.promociones.get(0).precioBase == 85)
	}

	@Test
	def quitarIngredienteAUnaPromoEnElMenu() {
		menu.agregarPromo(promo2)
		promo2.agregarIngrediente(ingred2, DistribucionPizza.Toda)
		assertEquals(menu.promociones.get(0).ingredientes.size(), 1)
		promo2.quitarIngrediente(ingred2)
		assertEquals(menu.promociones.get(0).ingredientes.size(), 0)
	}

	@Test
	def alQuitarUnIngredienteAUnaPromoEnElMenuElPrecioSeActualiza() {
		menu.agregarPromo(promo2)
		promo2.agregarIngrediente(ingred2, DistribucionPizza.Toda)
		assertTrue(menu.promociones.get(0).precioBase == 85)
		promo2.quitarIngrediente(ingred2)
		assertTrue(menu.promociones.get(0).precioBase == 70)
	}

	/* 
	 * 	@Test
	 * 	def editarDistribucionDeIngredienteAUnaPromoEnElMenu(){
	 * 		menu.agregarPromo(promo2)
	 * 		promo2.agregarIngrediente(ingred2, Distribucion.Toda)
	 * 		assertEquals(menu.promociones.get(0).ingredientes.get(0), Distribucion.Toda)
	 * 		promo2.ingredientes.get(0).editarDistribucion(Distribucion.MitadIzquierda)
	 * 		assertEquals(menu.promociones.get(0).ingredientes.get(0), Distribucion.MitadIzquierda)
	 * 	}
	 * 	
	 */
	@Test
	def registrarUnCliente() {

		menu.registrarCliente(ramiro)
		assertEquals(menu.clientes.size, 1)
	}

	@Test
	def alQuererRegistrar2ClientesConElMismoMailNoLoRegistra() {

		when(ramiro.email).thenReturn("shamainco@gmail.com")
		when(lucas.email).thenReturn("shamainco@gmail.com")

		menu.registrarCliente(ramiro)
		menu.registrarCliente(lucas)

		assertEquals(menu.clientes.size, 1)
	}

	@Test
	def alQuererRegistrar2ClientesConElMismoNickNoLoRegistra() {
		
		when(ramiro.email).thenReturn("shamainco@gmail.com")
		when(lucas.email).thenReturn("lpier@gmail.com")
		when(ramiro.nick).thenReturn("SHAMAINCO")
		when(lucas.nick).thenReturn("SHAMAINCO")

		menu.registrarCliente(ramiro)
		menu.registrarCliente(lucas)

		assertEquals(menu.clientes.size, 1)
	}
}
