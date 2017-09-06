import static org.mockito.Mockito.*
import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before
import org.mockito.Mock
import org.mockito.MockitoAnnotations

class PlatoTest {

	Plato plato
	Ingrediente cebolla
	@Mock Promocion promo
	@Mock Grande tamanio
	@Mock Distribucion distribucion

	@Before
	def void setUp() {
		MockitoAnnotations.initMocks(this)
		plato = new Plato(promo, tamanio, distribucion)
		cebolla = new Ingrediente("Cebolla", 10)
	}

	@Test
	def calcularPrecio() {
		when(promo.precioBase).thenReturn(70)
		when(tamanio.precio).thenReturn(1.doubleValue)
		assertTrue(plato.calcularPrecio == 70)
	}
}
