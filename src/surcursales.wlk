import remeras.*

class Surcursal {
	
	const remerasQueVende = []
	const descApartirDe  = 0
	const property lugar = null
	var property pedido = null
	const convenio = null
	var property listaDeVentas = []
	
	method precioBase() = pedido.remera().costo()
	
	method precio() =
		if(descApartirDe > 0 and descApartirDe < pedido.cantidad() ) 
			self.precioBase() * (self.AplicarDescuento())  * pedido.cantidad()
				else self.precioBase() * pedido.cantidad()
	
	method tieneLaRemera() = remerasQueVende.contains{pedido.remera().modelo()}
	
	method AplicarDescuento() = if(self.tieneLaRemera()) self.siEsRemeraBor() and self.siEsRemeraSub()
								else 1
	
	method siEsRemeraBor() = if(pedido.remera().modelo() == "Bordadas" ) 0.2 else 1
	
	method siEsRemeraSub() = if(pedido.remera().modelo() == "Sublimadas" and convenio and pedido.derechoAutor() > 0) 0.20 else 1
	
	method vendio() = listaDeVentas.add( pedido =new Pedido(factura = self.precio())  )
	
}

class Registro inherits Surcursal{
	
	var property surcursales = []
	
	
	method agregarPedido(surcursal) = surcursales.add(surcursal)
	
//	method facturado() = surcursales.sum{elem => elem.vendio()}
	
}
object comercio{
	
	const property surcursales = #{} 
	
	method registrarPedido(pedido) = pedido.surcursal().registraPedido(pedido) ///
	
	// method registrarPedidos(pedido) = pedidosRecibidos.add(new Pedido(remeraModelo = modelo))
	
	method totalFacturado() = surcursales.sum({pedido => pedido.precio()})
	
	method pedidos() = surcursales.flatMap{sur => sur.pedidos()}
	
	method totalFacturado2() = self.pedidos().sum{ pedido => pedido.precio() }
	
	method pedidosRemerasColor(color) = surcursales.count{sur => sur.modeloRemera()} 
	
}





class Pedido{
	
	const property remera = null
	const property cantidad = 0
	const property derechoDeAutor = 0
	const property factura = 0
	
	
	
}

class Pedido2{ //
	
	const property remeraModelo
	const property cantRemeras
	const sucursal
	
	method precioBase() = remeraModelo.costo() * cantRemeras
	
	method precio() = if(self.aplicarDescuento()) self.precioBase() - self.descuento()
					  else self.precioBase()
	
	method descuento() = self.precioBase() * (remeraModelo.porcentajeDescuento())
	
	method aplicarDescuento() = cantRemeras >= sucursal
	
	}
