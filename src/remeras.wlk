
class Remeralisas{
	const talle = 0
	const colorOtros = null
	const colorBasico = null
	
	method modelo() = "Lisas"
	
	method costo(){
		if(32<= talle and talle<= 40 and colorBasico ){
			return	80 + self.CostoExtraTalleChico()
		}else{
			return	100 + self.CostoExtraTalleGrande()
		}
	}
	
	method CostoExtraTalleChico() =
		if(32<= talle and talle <= 40 and colorOtros ) 8
		else 0
		
	method CostoExtraTalleGrande() =
		if(32<= talle and talle<= 40 and colorOtros ) 10
		else 0
	
}


class RemerasBordadas inherits Remeralisas{
	
	const coloresUtilizados = 0
	
	override method modelo() = "Bordadas"
	
	override method costo() = super() + self.coloresUsados()
		
	method coloresUsados() = if(coloresUtilizados == 1) 20 else 40
	
	
}

class RemerasSublimadas inherits Remeralisas{
	
	const alto = 0
	const ancho = 0
	var property autorPide = 0
	
	override method modelo() = "Sublimadas"
	
	override method costo() = super() + self.costoSublimado()
	
	method costoSublimado() = alto * ancho * 0.5 + self.derechoDeAutor()

	method derechoDeAutor() = autorPide
	
	method loQuePideElAutor(pesos) = autorPide == pesos
}
