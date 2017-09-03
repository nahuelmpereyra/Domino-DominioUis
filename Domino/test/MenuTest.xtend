

import org.junit.Test
import static org.junit.Assert.*
import org.mockito.Mock

class MenuTest {

		Menu menu = new Menu		
		@Mock Promocion promo; 
		@Mock Ingrediente ingrediente;
		@Mock Usuario usuario;
	@Test
	def agregarPromoAlMenu(){
		assertEquals(menu.promociones.size, 0)
		menu.agregarPromo(promo)
		assertEquals(menu.promociones.size, 1)	
	} 
	
	def quitarPromoDelMenu(){
		menu.agregarPromo(promo)
		assertEquals(menu.promociones.size, 1)
		menu.quitarPromo(promo)
		assertEquals(menu.promociones.size, 0)	
		
	}
	
	def agregarIngredienteAlMenu(){
		assertEquals(menu.ingredientes.size, 0)
		menu.agregarIngrediente(ingrediente)
		assertEquals(menu.ingredientes.size, 1)
		
		}
		
	def quitarIngredienteDelMenu(){
		menu.agregarIngrediente(ingrediente)
		assertEquals(menu.ingredientes.size,1)
		menu.quitarIngrediente(ingrediente)
		assertEquals(menu.ingredientes.size,0)
		
		}
		
	def agregarUnUsuarioAlMenu(){
		assertEquals(menu.usuarios.size, 0)
		menu.registrarUsuario(usuario)
		assertEquals(menu.usuarios.size, 1)
		
		}
	

	
}
