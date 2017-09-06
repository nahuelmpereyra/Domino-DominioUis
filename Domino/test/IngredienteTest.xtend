import org.junit.Test
import static org.junit.Assert.*

class IngredienteTest {

	Ingrediente ingrediente = new Ingrediente("Morron", 3)

	@Test
	def modificarPrecioIngrediente() {
		ingrediente.modificarPrecio(4.intValue)
		assertEquals(ingrediente.precio, 4, 0)
	}

	@Test
	def modificarNombreIngrediente() {
		ingrediente.modificarNombre("Morron Rojo")
		assertEquals(ingrediente.nombre, "Morron Rojo")
	}
}
