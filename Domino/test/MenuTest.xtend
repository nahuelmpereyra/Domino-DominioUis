

import org.junit.Test
import static org.junit.Assert.*
import org.mockito.Mock

class MenuTest {

		Menu menu = new Menu		
		@Mock Promocion promo; 
		
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
	


	
}