import static org.junit.Assert.*
import org.junit.Test

class FormaEnvioTest {

	FormaDeEnvio envioDelivery = new Delivery("Calle Falsa 123")
	FormaDeEnvio envioRetiroPorLocal = new RetiroLocal

	@Test
	def elRecargoDeUnDeliveryEsDe15Pesos() {
		assertEquals(envioDelivery.recargo, 15)
	}

	@Test
	def elRetirarPorElLocalNoTieneRecargo() {
		assertEquals(envioRetiroPorLocal.recargo, 0)
	}

}
