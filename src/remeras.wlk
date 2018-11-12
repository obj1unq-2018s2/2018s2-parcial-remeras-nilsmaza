
class Remeralisas{
	const property talle = 32
	const colorOtros = null
	const colorBasico = null
	const property color //
	
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
		if( talle > 40 and colorOtros ) 10
		else 0
	
	method esTalleChico(){   //
		return talle.between(32,40)
	}
	
	method esDeColorBasico(){	//
		return["blanco","negro","gris"].contains(color)
	}
	
	method porecentajeDeDescuento() = 2 ///
	
}



class RemerasBordadas inherits Remeralisas{
	
	const coloresUtilizados = 0
	
	override method modelo() = "Bordadas"
	
	override method costo() = super() + self.coloresUsados()
		
	method coloresUsados() = if(coloresUtilizados == 1) 20 else 40
	
	method  coloresUsados2() = 10 * coloresUtilizados.max{2} //
	
	override method porecentajeDeDescuento() = 2 ///
	
}

class RemerasSublimadas inherits Remeralisas{
	
	const alto 
	const ancho 
	var property autorPide = 0 //---------
	
	override method modelo() = "Sublimadas"
	
	override method costo() = super() + self.costoSublimado()
	
	method costoSublimado() = alto * ancho * 0.5

	method derechoDeAutor() = autorPide //------
	
	method loQuePideElAutor(pesos) = autorPide == pesos //---------
	
}

class RemerasSublimadasEmpresa inherits RemerasSublimadas{	//
	
	const property dibujoEmpresaQuePide
	
	override method costoSublimado() = super() + dibujoEmpresaQuePide.dibujoEmpresarial()
	
	override method porecentajeDeDescuento() = if(dibujoEmpresaQuePide !=null and dibujoEmpresaQuePide.tieneConvenio()) 20
												else super()

}

class PedidoEmpresa{
	
	const property dibujoEmpresarial
	const property tieneConvenio
	
}

