!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'la 10/31/2021 17:52:31'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'YS 11/4/2021 13:45:12'!
test01NoSePuedeBuscarConPrefijoVacio
	| stack prefijo buscador |
	
	stack := self stackConOraciones.
	prefijo := ''.
	buscador := SentenceFinderByPrefix new initializeWith: stack.
	self
		should: [ 	buscador find: prefijo buscarEnElStack: stack.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix notEmptyErrorDescription ].
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'YS 11/4/2021 13:45:24'!
test02NoSePuedeBuscarConPrefijoConEspaciosVacios
	| stack prefijo buscador |
	
	stack := self stackConOraciones.
	prefijo := 'palabra '.
	buscador := SentenceFinderByPrefix new initializeWith: stack.
	
	self
		should: [ 		buscador find: prefijo buscarEnElStack: stack. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix notContainEmptySpacesErrorDescription ].! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'YS 11/4/2021 13:45:30'!
test03BuscoPrefijoUnicoEnTodasLasOracionesYDevuelveLaCorrecta
	| stack prefijo buscador resultado |
	
	stack := self stackConOraciones.
	prefijo := 'Primera'.
	buscador := SentenceFinderByPrefix new initializeWith: stack.
	
	resultado := buscador find: prefijo buscarEnElStack: stack.
	
	self assert: resultado size = 1.
	self assert: resultado pop = 'Primera oracion'.
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'YS 11/4/2021 13:45:33'!
test04BuscoPrefijoNoExistenteEnLasOracionesYDevuelveUnStackVacio
	| stack prefijo buscador resultado |
	
	stack := self stackConOraciones.
	prefijo := 'Falso'.
	buscador := SentenceFinderByPrefix new initializeWith: stack.
	
	resultado := buscador find: prefijo buscarEnElStack: stack.
	
	self assert: resultado size = 0.
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'YS 11/4/2021 13:45:35'!
test05BuscoPrefijoExistenteEnMasDeUnaOracionYDevuelvoTodasEnElOrdenCorrecto
	| stack prefijo buscador resultado |
	
	stack := self stackConOraciones.
	prefijo := 'Cuarta'.
	buscador := SentenceFinderByPrefix new initializeWith: stack.
	
	resultado := buscador find: prefijo buscarEnElStack: stack.
	
	self assert: resultado size = 2.
	self assert: resultado pop = 'Cuarta oracion es Principal'.
	self assert: resultado pop = 'Cuarta oracion es la anterior'.
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'YS 11/4/2021 13:45:38'!
test06BuscoPrefijoExistenteEnOracionConDistintoTipadoYDevuelvoStackVacio
	| stack prefijo buscador resultado |
	
	stack := self stackConOraciones.
	prefijo := 'cuarta'.
	buscador := SentenceFinderByPrefix new initializeWith: stack.
	
	resultado := buscador find: prefijo buscarEnElStack: stack.
	
	self assert: resultado size = 0.
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'YS 11/4/2021 13:45:42'!
test07NoSePuedeBuscarEnStackVacio
	| stack prefijo buscador |
	
	stack := OOStack new.
	prefijo := 'cuarta'.
	buscador := SentenceFinderByPrefix new initializeWith: stack.
	
	self
		should: [ 		buscador find: prefijo buscarEnElStack: stack. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix stackEmptyErrorDescription ].! !


!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'YS 11/4/2021 13:08:35'!
stackConOraciones
	| stack |
	
	stack := OOStack new.
	stack push: 'Primera oracion'.
	stack push: 'Segunda oracion'.	
	stack push: 'Tercera oracion viene despues de la Segunda'.	
	stack push: 'Cuarta oracion es Principal'.
	stack push: 'Cuarta oracion es la anterior'.
	
	^stack.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'unaPila base'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'la 11/1/2021 22:13:34'!
initialize

	unaPila:= OrderedCollection new.
	base:=OOBase new.
	unaPila add: base.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'la 11/3/2021 17:06:02'!
isEmpty
	
	^ (self size= 0) .! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'la 11/1/2021 22:35:05'!
pop

	 ^unaPila removeLast value.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'la 11/1/2021 22:30:09'!
push:unElementoApilado
	
	unaPila add: (OOContenido new  initalizeWith: unElementoApilado )! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'la 11/1/2021 22:38:53'!
size
	^unaPila size - 1.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'la 11/1/2021 22:54:49'!
top
	
	^unaPila last value
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackElementos category: 'Stack-Exercise'!
Object subclass: #OOStackElementos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackElementos methodsFor: 'as yet unclassified' stamp: 'la 11/1/2021 20:27:43'!
value
	self subclassResponsibility .! !


!classDefinition: #OOBase category: 'Stack-Exercise'!
OOStackElementos subclass: #OOBase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOBase methodsFor: 'as yet unclassified' stamp: 'la 11/1/2021 21:53:27'!
value
	^ self error: OOStack stackEmptyErrorDescription.
! !


!classDefinition: #OOContenido category: 'Stack-Exercise'!
OOStackElementos subclass: #OOContenido
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOContenido methodsFor: 'as yet unclassified' stamp: 'la 11/1/2021 21:54:19'!
initalizeWith: aValue 
	
	value := aValue! !

!OOContenido methodsFor: 'as yet unclassified' stamp: 'la 11/1/2021 21:53:56'!
value
	^ value
! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stackAuxiliar stackOriginal listaDeOraciones stackSize prefijo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'validations' stamp: 'YS 11/4/2021 13:21:27'!
elStackNoTieneQueEstarVacio:unStack
	(unStack isEmpty ) ifTrue:[self error: self class stackEmptyErrorDescription ].! !

!SentenceFinderByPrefix methodsFor: 'validations' stamp: 'YS 11/4/2021 13:24:15'!
prefijoNoTieneQueContenerEspacioVacio:unPrefijo

	(unPrefijo includesSubString: ' ' ) ifTrue:[self error: self class notContainEmptySpacesErrorDescription ].
	! !

!SentenceFinderByPrefix methodsFor: 'validations' stamp: 'YS 11/4/2021 13:23:38'!
prefijoVacio:unPrefijo

	(unPrefijo isEmpty ) ifTrue:[self error: self class notEmptyErrorDescription ].! !

!SentenceFinderByPrefix methodsFor: 'validations' stamp: 'YS 11/4/2021 13:46:16'!
verificarLasCondiciones:unPrefijo unStack:unStack
	
	self elStackNoTieneQueEstarVacio: unStack .
	self prefijoVacio: unPrefijo.
	self prefijoNoTieneQueContenerEspacioVacio: unPrefijo.
	prefijo:=unPrefijo .
	stackOriginal :=unStack.
	stackSize := stackOriginal size.! !


!SentenceFinderByPrefix methodsFor: 'find utilities' stamp: 'la 11/3/2021 22:16:33'!
buscarTodasLasOracionesEnElStackOriginalSegunElPrefijo.

	stackSize  timesRepeat: [self encontrarElElementoPorPrefijoEnElStackOriginal ].! !

!SentenceFinderByPrefix methodsFor: 'find utilities' stamp: 'la 11/3/2021 22:09:33'!
encontrarElElementoPorPrefijoEnElStackOriginal
	|contenido|
	contenido := stackOriginal pop.
	self guardarElementoSegunLaCondicionDelPrefijo:contenido .	
	stackAuxiliar push: contenido.! !

!SentenceFinderByPrefix methodsFor: 'find utilities' stamp: 'YS 11/4/2021 13:27:22'!
guardarElementoSegunLaCondicionDelPrefijo:unElemento
	
	(unElemento beginsWith: prefijo) ifTrue:[listaDeOraciones push:unElemento ].! !

!SentenceFinderByPrefix methodsFor: 'find utilities' stamp: 'YS 11/4/2021 13:25:40'!
pushearLosEmentosAlStackOriginal

	|contenido|
	contenido := stackAuxiliar pop.
	stackOriginal push: contenido .
	! !

!SentenceFinderByPrefix methodsFor: 'find utilities' stamp: 'la 11/3/2021 22:25:49'!
retornarElStackEnSuEstadoOriginal.
		 
	stackSize timesRepeat: [self pushearLosEmentosAlStackOriginal ]! !


!SentenceFinderByPrefix methodsFor: 'public methods' stamp: 'YS 11/4/2021 13:44:57'!
find:unPrefijo

	self verificarLasCondiciones: unPrefijo unStack: stackOriginal .
	self buscarTodasLasOracionesEnElStackOriginalSegunElPrefijo.
	self retornarElStackEnSuEstadoOriginal.
	
	^listaDeOraciones 
! !

!SentenceFinderByPrefix methodsFor: 'public methods' stamp: 'YS 11/4/2021 13:13:07'!
find:unPrefijo buscarEnElStack:unStack

	self verificarLasCondiciones: unPrefijo unStack:unStack .
	self buscarTodasLasOracionesEnElStackOriginalSegunElPrefijo.
	self retornarElStackEnSuEstadoOriginal.
	
	^listaDeOraciones 
! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'YS 11/4/2021 13:27:15'!
initialize

	stackAuxiliar:= OOStack new.
	listaDeOraciones:= OOStack new.
! !

!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'YS 11/4/2021 13:44:39'!
initializeWith: stack

	stackOriginal := stack
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'la 11/3/2021 20:51:01'!
notContainEmptySpacesErrorDescription

	^ 'The word to be searched must not be empty'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'la 11/3/2021 20:52:31'!
notEmptyErrorDescription

	^ 'it does not have to be empty'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'la 11/3/2021 20:50:46'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !
