import org.junit.Test

import static org.junit.Assert.*
import static org.mockito.Mockito.*

class SistemaTest {
	Cliente lucas = mock(Cliente)
 	Cliente ramiro = mock(Cliente)
	Sistema sistema= new Sistema


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
 
 /*
  * 
  * 	@Test
 	def alAgregarUnMenuEsteSeAgrega() {

 
 		assertEquals(sistema.menu.class, Menu)
 	}
 	Al crear el sistema ya tendria que venir con un menu y no depender de si lo agregan o no
  */
 	@Test
 	def alQuererRegistrar2ClientesConElMismoNickNoLoRegistra(){
 		
 		when(ramiro.email).thenReturn("shamainco@gmail.com")
 		when(lucas.email).thenReturn("lpier@gmail.com")
 		when(ramiro.nick).thenReturn("SHAMAINCO")
 		when(lucas.nick).thenReturn("SHAMAINCO")
 
 
 		assertNotEquals(Exception, sistema.registrarCliente(ramiro))
 	}
 	
 
}
