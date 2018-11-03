import remeras.*

class Empresa{
	
	var pedidos = []
	var sucursales=[]
	
	
	method registarPedido(pedido){pedidos.add(pedido)}
	method totalFacturado(){
		return pedidos.sum({pedido=>pedido.precio()})
	}
	method totalFacturadoDe(sucursal){
		return self.pedidosDeLasSucursales(sucursal).sum({pedidoSuc=>pedidoSuc.precio()})
	}
	
	method pedidosDeLasSucursales(sucursal){
		return return (pedidos.filter({pedido=>pedido.sucursal()==sucursal}))
	}
	
	method hacerQueFacturesLaSucursales(){
		pedidos.ForEach({sucursal=>self.totalFacturadoDe(sucursal)})
	}
	method sucursalQueMasFacturo(){
		return sucursales.max({})
	}
	method cuantosPedidoDe(color){
		return pedidos.count({pedido=>pedido.tipoDeRemera().colorDeRemera()==color})
	}
	method pedidoMasCaro(){
		return pedidos.max({pedido=>pedido.precio()})
	}
}

class Pedido{
	
	var property tipoDeRemera
	var property cantidadDeRemera
	var property sucursal
	
	method precio(){
		return tipoDeRemera.costo()*cantidadDeRemera*(sucursal.descuentos(self))
	}
	
	
}

class Sucursal {
	
	var property cantidadMinimaDeDescuento
	
	method descuentos(pedido){
		if(pedido.cantidadDeRemera()>cantidadMinimaDeDescuento)
		return pedido.tipoDeRemera().descuento()
		else return 1
	}

}