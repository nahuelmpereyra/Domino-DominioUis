import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Map
import java.util.HashMap
import java.util.ArrayList

@Accessors
class Distribucion {
	
	Map<Ingrediente, DistribucionPizza> ingredientes = new HashMap<Ingrediente, DistribucionPizza>();



def void agregarIngrediente(Ingrediente ingrediente, DistribucionPizza distribucion){
	this.ingredientes.put(ingrediente,distribucion)
}

def void quitarIngrediente(Ingrediente ingrediente){
	if (this.ingredientes.containsKey(ingrediente)){
		this.ingredientes.remove(ingrediente)
	}
	else{
		throw new Exception("No se encuentra dicho ingrediente")
	}
	
}

def void cambiarDistribucion(Ingrediente ingrediente, DistribucionPizza distribucion){
	this.ingredientes.replace(ingrediente,distribucion)
}
	
	def listaDeIngredientes() {
		var listaDeIngredientes	= new ArrayList<Ingrediente>()
		listaDeIngredientes.addAll(this.ingredientes.keySet())
		listaDeIngredientes
	}




}