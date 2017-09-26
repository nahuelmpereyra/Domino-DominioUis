package ar.edu.unq.domino.test

import ar.edu.unq.domino.Pizzas.DistribucionPizza
import ar.edu.unq.domino.Pizzas.Ingrediente
import ar.edu.unq.domino.Pizzas.IngredientesExtras
import ar.edu.unq.domino.Pizzas.Plato
import ar.edu.unq.domino.Pizzas.Promocion
import ar.edu.unq.domino.TamanioPizzas.Grande
import org.junit.Before
import org.junit.Test
import org.mockito.Mock
import org.mockito.MockitoAnnotations

import static org.junit.Assert.*
import static org.mockito.Mockito.*

class PlatoTest {

	Plato plato
	Ingrediente cebolla
	@Mock Promocion promo
	@Mock Grande tamanio
	IngredientesExtras ingredientesExtra
	DistribucionPizza distribucion

	@Before
	def void setUp() {
		MockitoAnnotations.initMocks(this)
		ingredientesExtra = new IngredientesExtras
		distribucion = DistribucionPizza.Toda
		plato = new Plato("Muzzarella", promo, tamanio, ingredientesExtra)
		cebolla = new Ingrediente("Cebolla", 10.0)
	}

	@Test
	def calcularPrecio() {
		when(promo.precioBase).thenReturn(70.0)
		when(tamanio.precio).thenReturn(1.0)
		assertTrue(plato.calcularPrecio == 70.0)
	}

	@Test
	def calcularPrecioConIngredientes() {
		var promo2 = new Promocion("promo2", 70, ingredientesExtra)
		var plato2 = new Plato("Cebolla", promo2, tamanio, ingredientesExtra)
		when(tamanio.precio).thenReturn(1.25)
		plato2.agregarIngrediente(cebolla, distribucion)
		assertEquals(plato2.calcularPrecio, 97.5, 0)
	}

}
