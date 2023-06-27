import seres.*

class Territorio{
	
	const property seres =[]
	var property lembas=10  //property?
	var property tabaco=10	//property?
	
	method agregarSer(unSer){
		seres.add(unSer)
	}
	method eliminarSer(unSer){
		seres.remove(unSer)
	}	
	method seresTorpes(){
		
		return seres.filter( { ser => ser.habilidad() < 1000 } )
	}
	method seresInmortales(){
		
		return seres.filter(  { ser => ser.esInmortal()} )
	}
		
	method habilidadMaxDeInmortales(){
		
		return self.seresInmortales().max( {ser => ser.habilidad() } ).habilidad()
		
	}
	method promedioDehabilidad(){
		
		return seres.sum( { ser => ser.habilidad()} ) / seres.size()
	}
	
	method esSabio(){
		return seres.all( { ser => ser.habilidad() > 300 } )
	}
	method torneo(){
		seres.forEach( { ser => ser.adquirirExperiencia() } )
	}
	
	method epifania(){
		self.seresTorpes().forEach( { ser => ser.adquirirExperiencia()} )
	}
	
	method hayMortal(){
		return seres.any( { ser => not ser.esInmortal() } )
	}
	
	//parte 2
	
	method candidatosACapitan(){
		return  seres.filter( { ser => ser.habilidad().between(1000,3000) } )
	}
	
	method esElCapitan(){
				
		 if( self.candidatosACapitan().isEmpty())
			self.error("no hay candidato a capitan")
		
		 return self.candidatosACapitan().max( { ser => ser.habilidad() } )
		
	}
			
	
	method efectoSomnolencia(){
		seres.forEach{ ser => ser.suenioProfundo() }
	}
	method estaEnPaz(){
		return seres.all{ ser => ser.estaConformeCon(self) }
	}
	method consumoDeRecursos(){
		seres.forEach{ ser => ser.tomarRecursoDe(self) }
	}
	
	
	
	
}