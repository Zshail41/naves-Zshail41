class Nave {

	var velocidad = 0
	var direccion = 0
	var property combustible = 0
	
	method direccion(){
		return direccion
	}

	method velocidad() {
		return velocidad
	}

	method acelerar(cuanto) {
		velocidad += cuanto
		velocidad = velocidad.min(100000)
	}

	method desacelerar(cuanto) {
		velocidad -= cuanto
		velocidad = velocidad.max(0)
	}

	method irHaciaElSol() {
		direccion = 10
	}

	method alejarseDelSol() {
		direccion = -10
	}

	method alejarseUnPocoDelSol() {
		direccion -= 1
		direccion = direccion.max(-10)
	}

	method acercarseUnPocoDelSol() {
		direccion += 1
		direccion = direccion.min(10)
	}

	method ponerseParaleloAlSol() {
		direccion = 0
	}

	method prepararViaje() {
		self.cargarCombustible(30000)
		self.acelerar(5000)
	}

	method cargarCombustible(cant) {
		combustible += cant
	}

	method descargarCombustible(cant) {
		combustible -= cant
		combustible = combustible.max(0)
	}

	method recibirAmenaza() {
		self.escapar()
		self.avisar()
	}

	method escapar()

	method avisar()

}

class NaveBaliza inherits Nave {

	var color

	constructor(col) {
		color = col
	}

	override method prepararViaje() {
		color = "verde"
		self.ponerseParaleloAlSol()
		super()
	}

	method cambiarColorBaliza(col) {
		color = col
	}

	method color() {
		return color
	}

	override method escapar() {
		self.irHaciaElSol()
	}

	override method avisar() {
		color = "rojo"
	}

}

class NavePasajeros inherits Nave {

	var pasajeros
	var comida = 0
	var bebida = 0

	constructor(cant) {
		pasajeros = cant
	}

	method cantidadPasajeros() {
		return pasajeros
	}

	method setPasajeros(pas) {
		pasajeros = pas
	}

	method comida() {
		return comida
	}

	method cargarComida(cuanto) {
		comida += cuanto
	}

	method descargarComida(cuanto) {
		comida -= cuanto
		comida = comida.max(0)
	}

	method bebida() {
		return bebida
	}

	method cargarBebida(cuanto) {
		bebida += cuanto
	}

	method descargarBebida(cuanto) {
		bebida -= cuanto
		bebida = bebida.max(0)
	}

	override method prepararViaje() {
		self.cargarComida(4 * pasajeros)
		self.cargarBebida(6 * pasajeros)
		self.acercarseUnPocoDelSol()
		super()
	}

	override method escapar() {
		self.acelerar(velocidad)
	}

	override method avisar() {
		comida -= pasajeros
		bebida -= (pasajeros * 2)
	}

}

class NaveCombate inherits Nave {

	var invisibilidad = false
	var misilesDesplegados = false
	var mensajes = []

	method ponerseVisible() {
		invisibilidad = true
	}

	method ponerseInvisible() {
		invisibilidad = false
	}

	method estaInvisible() {
		return invisibilidad
	}

	method desplegarMisiles() {
		misilesDesplegados = true
	}

	method replegarMisiles() {
		misilesDesplegados = false
	}

	method misilesDesplegados() {
		return misilesDesplegados
	}

	method emitirMensaje(mens) {
		mensajes.add(mens)
	}

	method cantidadMensajes() {
		return mensajes.size()
	}

	method mensajesEmitidos() {
		return mensajes
	}

	method primerMensajeEmitido() {
		return mensajes.first()
	}

	method ultimoMensajeEmitido() {
		return mensajes.last()
	}

	method esEscueta() {
		return mensajes.all({ c => c.mensajesEmitidos() < 30 })
	}

	override method prepararViaje() {
		self.ponerseVisible()
		self.replegarMisiles()
		self.acelerar(15000)
		self.emitirMensaje("Saliendo en mision")
		super()
	}

	override method escapar() {
		self.acercarseUnPocoDelSol()
		self.acercarseUnPocoDelSol()
		
	}
	
	override method avisar() {
		self.emitirMensaje("Amenaza recibida")
	}

}

