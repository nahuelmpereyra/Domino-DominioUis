import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before


class ClienteTest {

	
	Cliente cliente= new Cliente("Ramiro","Shamainco","pepe123","shamainco@gmail.com","Av.falsa123")

	@Before
	def void setUp() {
	}

	@Test
	def inicializacionCliente() {
		
		
		assertEquals(cliente.nombre, "Ramiro")
		assertEquals(cliente.historial.size,0)
			}


}
