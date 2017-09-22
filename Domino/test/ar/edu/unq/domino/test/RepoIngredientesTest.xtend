package ar.edu.unq.domino.test

import ar.edu.unq.domino.Pizzas.Ingrediente
import org.junit.Before
import ar.edu.unq.domino.repo.RepoIngredientes
import org.junit.Test
import static org.junit.Assert.*

class RepoIngredientesTest{

	RepoIngredientes repoIngrediente
	Ingrediente jamon
	Ingrediente rucula

	@Before
	def void init() {
		repoIngrediente = RepoIngredientes.instance

		jamon = new Ingrediente("Jamon", 6.0)
		rucula = new Ingrediente("Rucula", 2.0)
	}
/*
	@Test
	def void ruculaEnLaListaIngredientes() {
		val resultado = repoIngrediente.getIngredientes
		repoIngrediente.createIfNotExists(rucula)
		assertTrue(resultado.contains(rucula))

	}

	@Test
	def void actualizarJamonEnLaListaIngredientes() {
		val resultado = repoIngrediente.getIngredientes
		assertTrue(resultado.get(0).nombre == "Jamon")
		assertTrue(resultado.get(0).precio == 5.0)
		repoIngrediente.createIfNotExists(jamon)
		assertTrue(resultado.get(0).precio == 6.0)

	}
	

	*/

}
