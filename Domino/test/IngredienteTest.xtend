import org.junit.Test
import static org.junit.Assert.*

class IngredienteTest {

	Ingrediente ingrediente = new Ingrediente("Morron", 2.5)

	@Test
	def modificarPrecioIngrediente() {
		ingrediente.modificarPrecio(3.5)
		assertEquals(ingrediente.precio, 3.5, 0)
	}

	@Test
	def modificarNombreIngrediente() {
		ingrediente.modificarNombre("Morron Rojo")
		assertEquals(ingrediente.nombre, "Morron Rojo")
	}
}
