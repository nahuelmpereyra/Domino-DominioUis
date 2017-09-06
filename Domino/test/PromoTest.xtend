import static org.junit.Assert.*
import org.junit.Test
import java.util.List
import org.junit.Test
import org.junit.Before
import static org.mockito.Mockito.*

class PromoTest {

	List<Ingrediente> ingredientesBase = newArrayList
	List<Distribucion> distribucionBase = newArrayList

	Ingrediente jamon = mock(Ingrediente)
	Ingrediente morron = mock(Ingrediente)
	Distribucion toda = mock(Distribucion)
	Distribucion mitadDerecha = mock(Distribucion)

	Promocion promo = new Promocion("Jamon Y Morrones", 50, ingredientesBase, distribucionBase)
	Ingrediente huevo = new Ingrediente("Huevo", 10)

	@Before
	def void setUp() {

		ingredientesBase.add(jamon)
		ingredientesBase.add(morron)
		distribucionBase.add(toda)
		distribucionBase.add(toda)
	}

	@Test
	def agregarUnIngredienteALaPromoTest() {

		assertEquals(promo.ingredientes.size, 2)
		promo.agregarIngrediente(huevo, mitadDerecha)
		assertEquals(promo.ingredientes.size, 3)
		assertEquals(promo.distribuciones.size, 3)

	}

	@Test
	def quitarUnIngredienteALaPromoTest() {
		promo.agregarIngrediente(huevo, mitadDerecha)
		assertEquals(promo.ingredientes.size, 3)
		promo.quitarIngrediente(huevo)
		assertEquals(promo.ingredientes.size, 2)
		assertEquals(promo.distribuciones.size, 2)

	}

}
