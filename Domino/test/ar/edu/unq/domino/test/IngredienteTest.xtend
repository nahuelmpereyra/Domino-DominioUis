package ar.edu.unq.domino.test

import ar.edu.unq.domino.Pizzas.Ingrediente
import org.junit.Test

import static org.junit.Assert.*

class IngredienteTest {

	Ingrediente ingrediente = new Ingrediente("Morron", 3.0)

	@Test
	def modificarPrecioIngrediente() {
		ingrediente.modificarPrecio(4)
		assertEquals(ingrediente.precio, 4, 0)
	}

	@Test
	def modificarNombreIngrediente() {
		ingrediente.modificarNombre("Morron Rojo")
		assertEquals(ingrediente.nombre, "Morron Rojo")
	}
}
