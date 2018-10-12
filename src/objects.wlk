class Nave {
	var velocidad = 0
	var direccion = 0
	
	method acelerar(cuanto){
		velocidad += cuanto
		velocidad = velocidad.min(100000)
	}
	
	method desacelerar(cuanto){
		velocidad -= cuanto
		velocidad = velocidad.max(0)
	}
	
	method irHaciaElSol(){
		direccion = 10
	}
	
	method alejarseDelSol(){
		direccion = -10
	}
	
	method alejarseUnPocoDelSol(){
		direccion -= 1
		direccion = direccion.max(-10)
	}
	
	method acercarseUnPocoDelSol(){
		direccion += 1
		direccion = direccion.min(10)
	}
	
	method ponerseParaleloAlSol(){
		direccion = 0
	}
	
	method recibirAmenaza()
		
	
}

class NaveBalisa inherits Nave {
	var color = ""
	
	method cambiarColorBaliza(col){
		color = col
	}
	
}

class NavePasajeros inherits Nave {
	var pasajeros = 0
	var comida = 0
	var bebida = 0
	
	method setPasajeros(pas){
		pasajeros = pas
	}
	
	method cargarComida(cuanto){
		comida += cuanto
	}
	
	method descargarComida(cuanto){
		comida -= cuanto
		comida = comida.max(0)
	}
	
		method cargarBebida(cuanto){
		bebida += cuanto
	}
	
	method descargarBebida(cuanto){
		bebida -= cuanto
		bebida = bebida.max(0)
	}
}

class NaveCombate inherits Nave {
	var invisibilidad = false
	var misilesDesplegados = false
	var mensajes = []
	
	method ponerseVisible(){
		invisibilidad = true
	}
	
	method ponerseInvisible(){
		invisibilidad = false
	}
	
	method estaInvisible(){
		return invisibilidad
	}
	
	method desplegarMisiles(){
		misilesDesplegados = true
	}
	
	method replegarMisiles(){
		misilesDesplegados = false
	}
	
	method misilesDesplegados(){
		return misilesDesplegados
	}
	
	method emitirMensaje(mens){
		mensajes.add(mens)
	}
	
	method mensajesEmitidos(){
		return mensajes
	}
	
	method primerMensajeEmitido(){
		 mensajes.first()
		}
		
	method ultimoMensajeEmitido(){
		mensajes.last()
	}
	
	method esEscueta(){
		return mensajes.all({c => c.mensajesEmitidos()<30})
	}
}

