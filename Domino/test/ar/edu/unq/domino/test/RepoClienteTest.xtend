package ar.edu.unq.domino.test

import ar.edu.unq.domino.repo.RepoClientes
import ar.edu.unq.domino.sistema.Cliente
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class RepoClienteTest {
	
	RepoClientes repoCliente
	Cliente ramiro
	Cliente nahuel

@Before

def void init() {
	repoCliente= RepoClientes.instance

	ramiro = new Cliente("Ramiro", "Shamainco", "sarasa123", "Shamainco1@gmail.com", "Av.Falsa 123")
	nahuel = new Cliente("Nahuel", "Nahuelpm", "sarasa123", "Shamainco1@gmail.com", "Av.Falsa 1234")
}


@Test
def void ramiroEnLaListaIngredientes(){
	val resultado= repoCliente.getClientes
	repoCliente.	crearSiNoExiste(ramiro)
	Assert.assertTrue(resultado.contains(ramiro))
	
}

@Test
def void intentarCrearUnUsuarioConElMismoMail(){
	val resultado= repoCliente.getClientes
	repoCliente.crearSiNoExiste(ramiro)
	repoCliente.crearSiNoExiste(nahuel)
	Assert.assertFalse(resultado.contains(nahuel))
	
}



	
}