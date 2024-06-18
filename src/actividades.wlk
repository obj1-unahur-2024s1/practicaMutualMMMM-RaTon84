class Actividad{
	const property idiomas = [] //strings
	
	/*method initialize(){
		if(idiomas.isEmpty()){
			self.error("debe ingresar al menos un idioma")
		}
	}*/
	method idiomas(lista){
		idiomas.add(lista)
	}	
	method sirveParaBroncearse()
	method implicaEsfuerzo()	
	method diasDeActividad()
	
	method esInteresante(){
		return idiomas.size()>1
	}
	
	method esRecomendadaPara(socio){
		return self.esInteresante() 
			&& socio.leAtrae(self) 
			&& !socio.actividades().contains(self)
	}
}

class ViajesDePlaya inherits Actividad{
	const largoDePlaya //mts
	
	override method diasDeActividad(){
		return largoDePlaya/500
	}
	
	override method implicaEsfuerzo(){
		return largoDePlaya>1200
	}
	override method sirveParaBroncearse(){
		return true
	}
}

class ExcursionACiudad inherits Actividad{
	const cantidadDeAtracciones
	
	override method diasDeActividad(){
		return cantidadDeAtracciones/2
	}
	
	override method implicaEsfuerzo(){
		return cantidadDeAtracciones>=5 && cantidadDeAtracciones<=8
	}
	override method sirveParaBroncearse(){
		return false
	}
	override method esInteresante(){
		return (super() || cantidadDeAtracciones==5)
	}
}

class ExcursionACiudadTropical inherits ExcursionACiudad{
	override method diasDeActividad(){
		return super()+1
	}
	override method sirveParaBroncearse(){
		return true
	}
}

class SalidaDeTrekking inherits Actividad{
	const kilometrosDeSenderos
	const diasDeSol
	
	override method diasDeActividad(){
		return kilometrosDeSenderos/50
	}
	
	override method implicaEsfuerzo(){
		return kilometrosDeSenderos>80
	}
	override method sirveParaBroncearse(){
		return diasDeSol>200 || (diasDeSol>100 && diasDeSol<200 && kilometrosDeSenderos>120)
	}
	override method esInteresante(){
		return super() && diasDeSol>140
	}
}

class ClasesDeGimnasia inherits Actividad{
	method initialize(){
		if(idiomas==["español"]){
			self.error("solo se permiten en español")
		}
	}
	override method diasDeActividad(){
		return 1
	}
	
	override method implicaEsfuerzo(){
		return true
	}
	override method sirveParaBroncearse(){
		return false
	}
	override method esRecomendadaPara(socio){
		return socio.edad()>=20 && socio.edad()<=30
	}
}

class TallerLiterario inherits Actividad{
	const libros = []
	
	override method idiomas(){
		return libros.map({l=>l.idioma()}).asSet().asList()
	}
	
	override method diasDeActividad(){
		return libros.size()+1
	}
	
	override method implicaEsfuerzo(){
		return libros.any({l=>l.cantidadDePaginas()>500}) 
			|| (libros.all({l=>l.nombreAutor()==libros.fisrt().nombreAutor()}))
	}
	
	override method sirveParaBroncearse(){
		return false
	}
	
	override method esRecomendadaPara(socio){
		return socio.idiomas().size()>1
	}
}

class Libro{
	const property idioma
	const property cantidadDePaginas
	const property nombreAutor
}

/* 
class ViajesInteresantes inherits Viajes{
	
	override method diasDeActividad(){
		return 1
	}
	
	override method implicaEsfuerzo(){
		return 1
	}
	override method sirveParaBroncearse(){
		return 1
	}
}*/