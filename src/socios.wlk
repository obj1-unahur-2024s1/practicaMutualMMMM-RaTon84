import actividades.*

class Socio{
	const property actividades=[]
	const maximoDeActividades
	var property edad
	const property idiomas
	
	method esAdoradorDelSol(){
		return actividades.all({a=>a.sirveParaBroncearse()})
	}
	
	method actividadesEsforzadas(){
		return actividades.filter({a=>a.implicaEsfuerzo()})
	}
	
	method registrarActividad(actividad){
		if(actividades.size()>=maximoDeActividades){
			self.error("no se pueden registrar mas actividades")
		}
		actividades.add(actividad)
	}
	
	method leAtrae(actividad)
}

class SocioTranquilo inherits Socio{
	override method leAtrae(actividad){
		return actividad.diasDeActividad()>=4
	}
}

class SocioCoherente inherits Socio{
	override method leAtrae(actividad){
	return (self.esAdoradorDelSol() && actividad.sirveParaBroncearse()) 
		|| actividad.implicaEsfuerzo()	
	}
}

class SocioRelajado inherits Socio{
	override method leAtrae(actividad){
		return idiomas.any({i=>actividad.idiomas().contains(i)})
	}
}







