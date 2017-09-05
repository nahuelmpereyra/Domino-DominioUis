

import static org.junit.Assert.*
import org.mockito.Mock
import java.util.List
import org.junit.Test
import org.junit.Before


class PromoTest {
	

	List<Ingrediente> ingredientesBase = newArrayList
	List<Distribucion> distribucionBase = newArrayList
	
	@Mock Ingrediente jamon
	@Mock Ingrediente morron
	@Mock Ingrediente huevo
	@Mock Distribucion toda
	@Mock Distribucion mitadDerecha
	Promocion promo
	
	@Before	
	def void setUp (){
	
		ingredientesBase.add(jamon)
		ingredientesBase.add(morron)
		distribucionBase.add(toda)
		distribucionBase.add(toda)
		promo = new Promocion ("Jamon Y Morrones", 50, ingredientesBase, distribucionBase )
	}
	
	@Test
	def agregarUnIngredienteALaPromoTest(){
				
		promo.agregarIngrediente(huevo, mitadDerecha)
		
		assertEquals(3, promo.ingredientes.size)
		assertEquals(3, promo.distribuciones.size)
		
	}
	
	@Test
	def quitarUnIngredienteALaPromoTest(){
		
		
		promo.quitarIngrediente(morron)
		
		assertEquals(1, promo.ingredientes.size())
		assertEquals(1, promo.distribuciones.size())
		
	}
	
	
	
}