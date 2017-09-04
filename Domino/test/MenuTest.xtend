

import org.junit.Test
import static org.junit.Assert.*
import org.mockito.Mock

class MenuTest {

		Menu menu = new Menu
		@Mock Promocion promo; 
		@Mock Ingrediente ingrediente;
		@Mock Usuario usuario;
		Promocion promo2 = new Promocion("Muzza", 70, newArrayList, newArrayList)
		Ingrediente ingred2 = new Ingrediente("Jamon", 15)

		
	@Test
	def agregarPromoAlMenu(){
		assertEquals(menu.promociones.size, 0)
		menu.agregarPromo(promo)
		assertEquals(menu.promociones.size, 1)	
	} 
	
	@Test
	def quitarPromoDelMenu(){
		menu.agregarPromo(promo)
		assertEquals(menu.promociones.size, 1)
		menu.quitarPromo(promo)
		assertEquals(menu.promociones.size, 0)	
		
	}
	
	@Test
	def agregarIngredienteAlMenu(){
		assertEquals(menu.ingredientes.size, 0)
		menu.agregarIngrediente(ingrediente)
		assertEquals(menu.ingredientes.size, 1)
		
		}
		
	@Test	
	def quitarIngredienteDelMenu(){
		menu.agregarIngrediente(ingrediente)
		assertEquals(menu.ingredientes.size,1)
		menu.quitarIngrediente(ingrediente)
		assertEquals(menu.ingredientes.size,0)
		
		}
		
	@Test	
	def agregarUnUsuarioAlMenu(){
		assertEquals(menu.usuarios.size, 0)
		menu.registrarUsuario(usuario)
		assertEquals(menu.usuarios.size, 1)
		
		}
		
 	@Test	
	def editarNombreAUnaPromoEnElMenu(){
		menu.agregarPromo(promo2)
		assertEquals(menu.promociones.get(0).nombrePromo, "Muzza")
		promo2.editarNombre("Muzzarella")
		assertEquals(menu.promociones.get(0).nombrePromo, "Muzzarella")
	}
	
	@Test
	def editarPrecioAUnaPromoEnElMenu(){
		menu.agregarPromo(promo2)
		assertTrue(menu.promociones.get(0).precioBase == 70)
		promo2.editarPrecio(80)
		assertTrue(menu.promociones.get(0).precioBase == 80)
	}

	@Test
	def agregarIngredienteAUnaPromoEnElMenu(){
		menu.agregarPromo(promo2)
		assertEquals(menu.promociones.get(0).ingredientes.size(), 0)
		promo2.agregarIngrediente(ingred2, Distribucion.Toda)
		assertEquals(menu.promociones.get(0).ingredientes.size(), 1)	
	}
	
	@Test
	def alAgregarUnIngredienteAUnaPromoEnElMenuElPrecioSeActualiza(){
		menu.agregarPromo(promo2)
		assertTrue(menu.promociones.get(0).precioBase == 70)
		promo2.agregarIngrediente(ingred2, Distribucion.Toda)
		assertTrue(menu.promociones.get(0).precioBase == 85)
	}	
	
		@Test
	def quitarIngredienteAUnaPromoEnElMenu(){
		menu.agregarPromo(promo2)
		promo2.agregarIngrediente(ingred2, Distribucion.Toda)
		assertEquals(menu.promociones.get(0).ingredientes.size(), 1)
		promo2.quitarIngrediente(ingred2)
		assertEquals(menu.promociones.get(0).ingredientes.size(), 0)
	}
	
	@Test
	def alQuitarUnIngredienteAUnaPromoEnElMenuElPrecioSeActualiza(){
		menu.agregarPromo(promo2)
		promo2.agregarIngrediente(ingred2, Distribucion.Toda)
		assertTrue(menu.promociones.get(0).precioBase == 85)
		promo2.quitarIngrediente(ingred2)
		assertTrue(menu.promociones.get(0).precioBase == 70)
	}	
	

}
