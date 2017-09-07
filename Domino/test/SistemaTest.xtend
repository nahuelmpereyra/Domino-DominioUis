import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before
import static org.mockito.Mockito.*

class SistemaTest {
	Menu menu= mock(Menu)
	Cliente lucas = mock(Cliente)
 	Cliente ramiro = mock(Cliente)
	Sistema sistema= new Sistema

	@Before
	def void setUp() {
	}

	@Test
	def inicializacionSistema() {
		
		
		
		assertEquals(sistema.clientes.size(),0)
		assertEquals(sistema.pedidos.size(),0)
			}

@Test
 	def registrarUnCliente() {

 		sistema.registrarCliente(ramiro)
 		assertEquals(sistema.clientes.size, 1)
 	}
 
 	@Test
 	def alAgregarUnMenuEsteSeAgrega() {
 
 		
 		sistema.agregarMenu(menu)
 
 		assertTrue(sistema.menu.contains(menu))
 	}
 /* 
 	@Test
 	def alQuererRegistrar2ClientesConElMismoNickNoLoRegistra() {
 		
 		when(ramiro.email).thenReturn("shamainco@gmail.com")
 		when(lucas.email).thenReturn("lpier@gmail.com")
 		when(ramiro.nick).thenReturn("SHAMAINCO")
 		when(lucas.nick).thenReturn("SHAMAINCO")
 
 		sistema.registrarCliente(ramiro)
 		sistema.registrarCliente(lucas)
 
 		assertEquals(sistema.clientes.size, 1)
 	}
 	*/
 
}
