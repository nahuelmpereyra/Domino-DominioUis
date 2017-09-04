

import org.junit.Test
import static org.junit.Assert.*
import org.mockito.Mock

class MenuTest {

		Menu menu = new Menu
		@Mock Promocion promo; 
		@Mock Ingrediente ingrediente;
		@Mock Usuario usuario;
		Promocion promo2 = new Promocion("Muzza", 70, newArrayList, newArrayList)

		
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


	
}
