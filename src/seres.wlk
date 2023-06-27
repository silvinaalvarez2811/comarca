

class SerHablante{
	
	
	method esInmortal()
	method habilidad()
	method adquirirExperiencia()
	method suenioProfundo()
	method estaConformeCon(unTerritorio)
	method tomarRecursoDe(unTerritorio)
}


class Elfo inherits SerHablante{
	var cancionesQueSabe = 20
	
	
	override method esInmortal()= true
	
	method cancionesQueSabe()=cancionesQueSabe
	method cancionesQueSabe(unNumero){
		cancionesQueSabe = 1.max(cancionesQueSabe + unNumero)
	}// se considera el numero 0 positivo? interpreté mal el enunciado?
	
	override method habilidad(){
		if(cancionesQueSabe <=60){
			return 180
		}else{
			return cancionesQueSabe * 3
		}
	}
	override method adquirirExperiencia(){
		cancionesQueSabe = cancionesQueSabe * 2
	}
	override method suenioProfundo(){
		cancionesQueSabe = 0.max(cancionesQueSabe-10)
	}
	override method estaConformeCon(unTerritorio){
		return unTerritorio.lembas() >= 8
	}
	
	// esta muy mal no poner mensaje de error?
	override method tomarRecursoDe(unTerritorio){
		unTerritorio.lembas(0.max(unTerritorio.lembas()-3))
		cancionesQueSabe += 15
	}
}

class ElfoSilvano inherits Elfo{
	
	override method habilidad(){
		return super() + 400
	}
	
}


class Hobbit inherits SerHablante{
	var property amigos =40					//está mal ponerlo como property?
	var property historiasEscuchadas = 6	//está mal ponerlo como property?
 
	
	
	override method esInmortal(){
		return amigos >= 20
	}
		
	override method habilidad(){
		if(amigos < 60){
			 return historiasEscuchadas * 100
		}else{
			return historiasEscuchadas * 50
		}
	}
	override method adquirirExperiencia(){
		amigos +=8
	}
	method organizarFiesta(){
		amigos += 5
		historiasEscuchadas  += 5
	}
	override method suenioProfundo(){
		amigos = 0.max(amigos - 3)
	}
	override method estaConformeCon(unTerritorio){
		 return unTerritorio.seres().filter{  ser => ser.habilidad() > self.habilidad() }.size() <=2
		//yo lo hice confuso..pero funciona
	}
	override method tomarRecursoDe(unTerritorio){
		unTerritorio.tabaco(0.max(unTerritorio.tabaco()-4))  // está muy mal no poner mensaje de error??
		amigos += 7							
		historiasEscuchadas +=7
	}
	
}

class Enano inherits SerHablante{
	var property ira =200   // esta mal que sea property?
	
	override method habilidad(){
		return ira * 2
		
	}
	override method adquirirExperiencia(){
		ira += 300
	}
	override method esInmortal(){return  false}
	
	override method suenioProfundo(){
		ira = 0.max(ira - 50)
	}
	override method estaConformeCon(unTerritorio){
		return unTerritorio.seresTorpes().size() <= 1
	}
	override method tomarRecursoDe(unTerritorio){}
	
	method equilibrarse(){
		if( self.habilidad() <= 700 ){
			self.adquirirExperiencia()
		}else{
			self.suenioProfundo()
		}
	}
	
}

class EnanoHerrero inherits Enano{
	var property espadasFabricadas = 3
		
	override method habilidad(){
		return espadasFabricadas * 100
		
	}
	override method adquirirExperiencia(){
		super()
		espadasFabricadas ++
	}
	
}

class EnanoFurioso inherits Enano{
	var property topeDeHabilidad =2000
	
	override method habilidad(){
		return super().min(topeDeHabilidad)
	}
}



class EnanoMinero inherits Enano{
	const property escondites=[]
	
	method construirEscondite(unNido){
		escondites.add(unNido)
	}
	
	override method adquirirExperiencia(){
		super()
		self.construirEscondite(new Escondite())
	}
	
	override method suenioProfundo(){
		if(escondites.size() > 2){
			escondites.forEach({ esc => esc.candados(esc.candados()+1) })
		}else {
			super()
		}
	}
	override method ira(){
		
		return super() + self.valorTotalEscondites()
	}
		
	method valorTotalEscondites(){
		return escondites.sum( { esc => esc.valor() } )
		
		
	}
	method cantidadDeCandados(){
		return escondites.map( { esc => esc.candados() } ).first() 
	}
	// lo hice para el test,para saber si se agrega un candado al territorio para sueño profundo
}

class Escondite{
	var property candados = 5     	//property?
	var property oro = 3			//property?
	
	
	method valor(){
		return (oro * candados) + 20
	}
}
















