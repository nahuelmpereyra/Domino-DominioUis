package ar.edu.unq.domino.test

import ar.edu.unq.domino.Pizzas.Ingrediente
import org.junit.Before
import ar.edu.unq.domino.repo.RepoIngredientes
import org.junit.Test
import org.junit.Assert

class RepoIngredientesTest {
	
	RepoIngredientes repoIngrediente
	Ingrediente jamon
	Ingrediente rucula

@Before

def void init() {
	repoIngrediente= RepoIngredientes.instance

	jamon = new Ingrediente("Jamon",6.0)
	rucula= new Ingrediente("Rucula",2.0)
}


@Test
def void ruculaEnLaListaIngredientes(){
	val resultado= repoIngrediente.getIngredientes
	repoIngrediente.crearSiNoExiste(rucula)
	Assert.assertTrue(resultado.contains(rucula))
	
}
/* @Test
No estaria ACTUALIZANDO el jamon (Chequear)
def void actualizarJamonEnLaListaIngredientes(){
	repoIngrediente.crearSiNoExiste(jamon)
	val resultado=repoIngrediente.getIngredientes
	
	Assert.assertTrue(resultado.contains(jamon))
	
}
 */

	
}