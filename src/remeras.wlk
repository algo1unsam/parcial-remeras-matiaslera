import empresa.*

class RemerasLisas {
	
	var property valorBaseMenor=80
	var property valorBaseMayor= 100
	var property talle
	var property colorDeRemera 
	var property coloresBasico =[]
	//var property coloresRestante = []
	
	method agregarColorBasico(color){coloresBasico.add(color)}
	//method agregarColorRestante(color){coloresRestante.add(color)}
	
	method costo(){
		if(self.esBasicoEl(colorDeRemera))
		return self.costoConColorBasico()
		else return self.costoSinColorBasico()
	}
	
	method costoConColorBasico(){
		 if (talle>=32 && talle<=40)
		return valorBaseMenor
		else  (talle>=41 && talle<=48)
		return valorBaseMayor
	}
	method costoSinColorBasico(){
		if(talle>=32 && talle<=40)
		return valorBaseMenor*1.1
		else  (talle>=41 && talle<=48)
		return valorBaseMayor*1.1
	}
	
	method esBasicoEl(color){
		return coloresBasico.contains(color)
	}
	
	method descuento(){
		return 0.9
	}
}

class RemeraBordada inherits RemerasLisas {
	
	var property cantColores
	
	method costoDeBordado(){
		if(cantColores>0 && cantColores<3)
		return 20
		else return cantColores *10
	}
	
override method costo(){
		return super() + self.costoDeBordado()
	}
	
override method descuento(){
		return 1
	}
}

class RemeraSubliminada inherits RemerasLisas{
	
	var property alto
	var property ancho
	var property precioDerechoDeAutor
	var property marcaComercialConConvenio=false
	
	method superficieRemera(){
		return alto *ancho
	}
	method costoDeSubliminar(){
		return self.superficieRemera() * 0.50
	}
	
override method costo(){
	return super()+ self.costoDeSubliminar()+precioDerechoDeAutor
}	
override method descuento(){
		if (marcaComercialConConvenio)
		return 0.8
		else return 0.9
	}

}

class Colores {
	
}