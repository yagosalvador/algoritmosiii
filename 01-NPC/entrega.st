!classDefinition: #CarolinaLaCurandera category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #CarolinaLaCurandera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CarolinaLaCurandera class' category: 'Ejercicio1-PNJ-Episodio2'!
CarolinaLaCurandera class
	instanceVariableNames: 'frases frasesDeJugadorPrometedor cantidadDeInteraccionesPorJugador listaDeJugadoresPrometedores'!

!CarolinaLaCurandera class methodsFor: 'as yet unclassified' stamp: 'YS 10/4/2021 17:23:07'!
influenciarPersonaje: nombrePersonaje
	"comment stating purpose of message"

	PuebloRiverwood agregarUnJugadorPrometedor: nombrePersonaje. 
	self reiniciarInteraccion: 	nombrePersonaje. 
	TreborElGuardiaDeSkyrim reiniciarInteraccion: nombrePersonaje.! !

!CarolinaLaCurandera class methodsFor: 'as yet unclassified' stamp: 'YS 10/4/2021 17:28:05'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frases := #('¿Estás enfermo forastero?' 'Ah, solo quieres conversar' 'Cuando tengas una aflicción, ven a verme' ).
	frasesDeJugadorPrometedor := #('Salud aventurero!!' 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme' ).
	cantidadDeInteraccionesPorJugador := ((Dictionary new) add: (#Hamilton->0); yourself).
	listaDeJugadoresPrometedores := ((OrderedCollection new) add: #Hamilton; yourself).! !

!CarolinaLaCurandera class methodsFor: 'as yet unclassified' stamp: 'YS 10/4/2021 16:00:43'!
interactuarCon:unPersonajeJugadorAInteractuar
	self recordarInteraccion: unPersonajeJugadorAInteractuar .
	^ self responderSegunCantidadDeInteracciones: unPersonajeJugadorAInteractuar ! !

!CarolinaLaCurandera class methodsFor: 'as yet unclassified' stamp: 'YS 10/4/2021 16:00:54'!
olvidar
	cantidadDeInteraccionesPorJugador := Dictionary new.! !

!CarolinaLaCurandera class methodsFor: 'as yet unclassified' stamp: 'YS 10/4/2021 16:01:07'!
recordarInteraccion:unPersonajeJugadorAlInteractuar
	|cantidadDeInteracciones|
	cantidadDeInteracciones := cantidadDeInteraccionesPorJugador  at: unPersonajeJugadorAlInteractuar  ifAbsent:[ 0].
	cantidadDeInteraccionesPorJugador  at:unPersonajeJugadorAlInteractuar  put:cantidadDeInteracciones  +1 .! !

!CarolinaLaCurandera class methodsFor: 'as yet unclassified' stamp: 'YS 10/4/2021 16:17:31'!
reiniciarInteraccion: unPersonaje
	"comment stating purpose of message"
	
	cantidadDeInteraccionesPorJugador  at:unPersonaje  put:0 .! !

!CarolinaLaCurandera class methodsFor: 'as yet unclassified' stamp: 'YS 10/4/2021 17:24:08'!
responderSegunCantidadDeInteracciones:unPersonajeJugadorAlInterctuar
	|cantidadDeInteracciones frase|
	listaDeJugadoresPrometedores := PuebloRiverwood jugadoresPrometedores.
	cantidadDeInteracciones := cantidadDeInteraccionesPorJugador at:unPersonajeJugadorAlInterctuar.
	(listaDeJugadoresPrometedores includes:unPersonajeJugadorAlInterctuar) ifTrue:[frase:= frasesDeJugadorPrometedor at: (cantidadDeInteracciones min: frasesDeJugadorPrometedor size)] ifFalse: [frase:= frases at: (cantidadDeInteracciones min: frases size)]. 
	(cantidadDeInteracciones = frases size) ifTrue: [self influenciarPersonaje: unPersonajeJugadorAlInterctuar ] ifFalse: [].
	^frase! !


!classDefinition: #PruebasInteracionesConCarolinaLaCurandera category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConCarolinaLaCurandera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConCarolinaLaCurandera class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConCarolinaLaCurandera class
	instanceVariableNames: ''!

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:36'!
test01CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:37'!
test02CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Ah, solo quieres conversar'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:49:16'!
test03CuandoLaCuranderaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Cuando tengas una aflicción, ven a verme'.! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:11'!
test04LaCuranderaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:18'!
test05LaCuranderaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:32'!
test06CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |	
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Salud aventurero!!'.
! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:39'!
test07CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme'.
! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:50:52'!
test08CuandoLaCuranderaTerminaSuRepertorioDeFrasesConUnPersonajeCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedor
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert isTrue: (self esVistoPorElPuebloComoPrometedor: self hamilton).! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/30/2021 19:09:06'!
test09CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaSuHiloDeDialogoConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Salud aventurero!!'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/30/2021 19:08:45'!
test10CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaElHiloDeDialogoDelGuardiaConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	

	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Bienvenido aventurero!!'. ! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'YS 10/4/2021 16:05:28'!
carolinaLaCurandera
	^CarolinaLaCurandera ! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'YS 10/4/2021 16:05:35'!
hamilton
	^#Hamilton! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'YS 10/4/2021 16:05:44'!
tirion
	^#Tirion! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:52:20'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'YS 10/4/2021 16:12:45'!
esVistoPorElPuebloComoPrometedor: unPersonaje
	|listaPersonajesPrometedores|
	listaPersonajesPrometedores := PuebloRiverwood jugadoresPrometedores.
	
	^(listaPersonajesPrometedores includes: unPersonaje )! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'YS 10/4/2021 16:06:26'!
hacerQueLaCuranderaOlvideSusInteracciones
	self carolinaLaCurandera olvidar ! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'YS 10/4/2021 16:06:12'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	PuebloRiverwood olvidar ! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'YS 10/4/2021 16:06:04'!
hacerQueRiverwoodVeaPrometedorAHamilton
	PuebloRiverwood agregarUnJugadorPrometedor: self hamilton ! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:48:36'!
olvidarInteraccionesYOpiniones
	self hacerQueLaCuranderaOlvideSusInteracciones.	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #PruebasInteracionesConTreborElGuardia category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConTreborElGuardia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConTreborElGuardia class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConTreborElGuardia class
	instanceVariableNames: ''!

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:03:53'!
test01CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:08'!
test02CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Todo bien?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:25'!
test03CuandoElGuardiaOlvidaInteraccionesPreviasConUnPersonajeAlVolverAInteractuarLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia olvidar.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:35'!
test04CuandoElGuardiaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:44'!
test05CuandoElGuardiaInterctuaYTerminoSuRepertorioDeFrasesConUnPersonajeLeRespondeConSuUltimaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:36'!
test06ElGuardiaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.

	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:43'!
test07ElGuardiaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Algún problema?'.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Algún problema?'.
	! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:54:46'!
test08CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Bienvenido aventurero!!'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:55:02'!
test09CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Espero que tengas una buena estadia en Riverwood'.
! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'la 10/1/2021 23:06:33'!
hamilton
	^#Hamilton! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'la 10/1/2021 23:06:59'!
tirion
	^ #Tirion! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:42:44'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/21/2021 20:49:11'!
hacerQueElGuardiaOlvideSusInteracciones
	TreborElGuardiaDeSkyrim olvidar.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'la 10/2/2021 19:17:36'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	PuebloRiverwood  olvidar.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'la 10/2/2021 19:20:05'!
hacerQueRiverwoodVeaPrometedorAHamilton
	^ PuebloRiverwood agregarUnJugadorPrometedor: #Hamilton! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:52:12'!
olvidarInteraccionesYOpiniones
	self hacerQueElGuardiaOlvideSusInteracciones. 	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #PuebloRiverwood category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PuebloRiverwood
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PuebloRiverwood class' category: 'Ejercicio1-PNJ-Episodio2'!
PuebloRiverwood class
	instanceVariableNames: 'jugadoresPrometedores'!

!PuebloRiverwood class methodsFor: 'as yet unclassified' stamp: 'la 10/2/2021 19:14:20'!
agregarUnJugadorPrometedor:unJugador
	jugadoresPrometedores add:unJugador .! !

!PuebloRiverwood class methodsFor: 'as yet unclassified' stamp: 'YS 10/4/2021 17:28:05'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	jugadoresPrometedores := ((OrderedCollection new)).! !

!PuebloRiverwood class methodsFor: 'as yet unclassified' stamp: 'la 10/2/2021 19:33:43'!
jugadoresPrometedores
 ^jugadoresPrometedores.! !

!PuebloRiverwood class methodsFor: 'as yet unclassified' stamp: 'la 10/2/2021 19:15:45'!
olvidar
	jugadoresPrometedores := OrderedCollection new.! !


!classDefinition: #TreborElGuardiaDeSkyrim category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #TreborElGuardiaDeSkyrim
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TreborElGuardiaDeSkyrim class' category: 'Ejercicio1-PNJ-Episodio2'!
TreborElGuardiaDeSkyrim class
	instanceVariableNames: 'listaDeJugadoresPrometedores cantidadDeInteraccionesPorJugador frasesDeJugadorPrometedor frases jugadoresConocidos'!

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'la 10/2/2021 16:49:45'!
interactuarCon:unPersonajeJugadorAInteractuar
	self recordarInteraccion: unPersonajeJugadorAInteractuar .
	^ self responderSegunCantidadDeInteracciones: unPersonajeJugadorAInteractuar ! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'la 10/1/2021 23:51:21'!
olvidar
	cantidadDeInteraccionesPorJugador := Dictionary new.! !


!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'la 10/2/2021 16:41:12'!
recordarInteraccion:unPersonajeJugadorAlInteractuar
	|cantidadDeInteracciones|
	cantidadDeInteracciones := cantidadDeInteraccionesPorJugador  at: unPersonajeJugadorAlInteractuar  ifAbsent:[ 0].
	cantidadDeInteraccionesPorJugador  at:unPersonajeJugadorAlInteractuar  put:cantidadDeInteracciones  +1 .
! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'YS 10/4/2021 17:01:39'!
responderSegunCantidadDeInteracciones:unPersonajeJugadorAlInterctuar
	|cantidadDeInteracciones|
	listaDeJugadoresPrometedores := PuebloRiverwood jugadoresPrometedores.
	cantidadDeInteracciones := cantidadDeInteraccionesPorJugador at:unPersonajeJugadorAlInterctuar. 
	^  (listaDeJugadoresPrometedores includes:unPersonajeJugadorAlInterctuar) ifTrue:[frasesDeJugadorPrometedor at: (cantidadDeInteracciones min: frasesDeJugadorPrometedor size)] ifFalse: [frases at: (cantidadDeInteracciones min: frases size)] ! !


!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'YS 10/4/2021 17:28:05'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	listaDeJugadoresPrometedores := ((OrderedCollection new)).
	cantidadDeInteraccionesPorJugador := ((Dictionary new) add: (#Hamilton->4); yourself).
	frasesDeJugadorPrometedor := #('Bienvenido aventurero!!' 'Espero que tengas una buena estadia en Riverwood' ).
	frases := #('Hola forastero' '¿Todo bien?' '¿Algún problema?' ).
	jugadoresConocidos := ((Dictionary new)).! !

!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'YS 10/4/2021 17:13:10'!
reiniciarInteraccion: unPersonajeJugadorAlInterctuar
	cantidadDeInteraccionesPorJugador at: unPersonajeJugadorAlInterctuar put:0.! !

CarolinaLaCurandera initializeAfterFileIn!
PuebloRiverwood initializeAfterFileIn!
TreborElGuardiaDeSkyrim initializeAfterFileIn!