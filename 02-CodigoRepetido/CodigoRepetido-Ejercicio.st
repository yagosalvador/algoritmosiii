!classDefinition: #AlreadySuspended category: 'CodigoRepetido-Ejercicio'!
Error subclass: #AlreadySuspended
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests'!
afirmarQue: arg1 enMenos: arg2
	self assert: arg1 timeToRun < arg2.! !

!CustomerBookTest methodsFor: 'tests'!
afirmarQueLibroDeCliente: arg1 activos: arg2 suspendidos: arg3 totalDeClientes: arg4
	self
		assert: arg2
		equals: arg1 numberOfActiveCustomers.
	self
		assert: arg3
		equals: arg1 numberOfSuspendedCustomers.
	self
		assert: arg4
		equals: arg1 numberOfCustomers.
	self deny: (arg1 includesCustomerNamed: 'paulMcCartney').! !

!CustomerBookTest methodsFor: 'tests'!
afirmarQueLibroDeCliente: arg1 contieneCant: arg2 contieneNombre: arg3
	self assert: arg1 numberOfCustomers = arg2.
	self assert: (arg1 includesCustomerNamed: arg3).! !

!CustomerBookTest methodsFor: 'tests'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	| temp1 |
	temp1 _ CustomerBook new.
	self
		afirmarQue: [ temp1 addCustomerNamed: 'John Lennon' ]
		enMenos: 50 * millisecond.! !

!CustomerBookTest methodsFor: 'tests'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	| temp1 temp2 |
	temp1 _ CustomerBook new.
	temp2 _ 'Paul McCartney'.
	temp1 addCustomerNamed: temp2.
	self
		afirmarQue: [ temp1 removeCustomerNamed: temp2 ]
		enMenos: 50 * millisecond.! !

!CustomerBookTest methodsFor: 'tests'!
test03CanNotAddACustomerWithEmptyName
	| temp1 |
	temp1 _ CustomerBook new.
	[
	temp1 addCustomerNamed: ''.
	self fail ]
		on: Error
		do: [ :argm1_2 |
			self assert: argm1_2 messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: temp1 isEmpty ].! !

!CustomerBookTest methodsFor: 'tests'!
test04CanNotRemoveAnInvalidCustomer
	| temp1 temp2 |
	temp1 _ CustomerBook new.
	temp2 _ 'John Lennon'.
	temp1 addCustomerNamed: temp2.
	[
	temp1 removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound
		do: [ :argm3_3 |
			self
				afirmarQueLibroDeCliente: temp1
				contieneCant: 1
				contieneNombre: temp2 ].! !

!CustomerBookTest methodsFor: 'tests'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
	| temp1 temp2 |
	temp1 _ CustomerBook new.
	temp2 _ 'Paul McCartney'.
	temp1 addCustomerNamed: temp2.
	temp1 suspendCustomerNamed: temp2.
	self
		afirmarQueLibroDeCliente: temp1
		activos: 0
		suspendidos: 1
		totalDeClientes: 1.
	self assert: (temp1 includesCustomerNamed: temp2).! !

!CustomerBookTest methodsFor: 'tests'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook
	| temp1 temp2 |
	temp1 _ CustomerBook new.
	temp2 _ 'Paul McCartney'.
	temp1 addCustomerNamed: temp2.
	temp1 suspendCustomerNamed: temp2.
	temp1 removeCustomerNamed: temp2.
	self
		afirmarQueLibroDeCliente: temp1
		activos: 0
		suspendidos: 0
		totalDeClientes: 0.
	self deny: (temp1 includesCustomerNamed: temp2).! !

!CustomerBookTest methodsFor: 'tests'!
test07CanNotSuspendAnInvalidCustomer
	| temp1 temp2 |
	temp1 _ CustomerBook new.
	temp2 _ 'John Lennon'.
	temp1 addCustomerNamed: temp2.
	[
	temp1 suspendCustomerNamed: 'Ringo Starr'.
	self fail ]
		on: CantSuspend
		do: [ :argm3_3 |
			self
				afirmarQueLibroDeCliente: temp1
				contieneCant: 1
				contieneNombre: temp2 ].! !

!CustomerBookTest methodsFor: 'tests'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	| temp1 temp2 |
	temp1 _ CustomerBook new.
	temp2 _ 'John Lennon'.
	temp1 addCustomerNamed: temp2.
	temp1 suspendCustomerNamed: temp2.
	[
	temp1 suspendCustomerNamed: temp2.
	self fail ]
		on: CantSuspend
		do: [ :argm4_3 |
			self
				afirmarQueLibroDeCliente: temp1
				contieneCant: 1
				contieneNombre: temp2 ].! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization'!
initialize
	active _ OrderedCollection new.
	suspended _ OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management'!
addCustomerNamed: arg1
	arg1 isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: arg1) ifTrue: [ self signalCustomerAlreadyExists ].
	active add: arg1.! !

!CustomerBook methodsFor: 'customer management'!
removeCustomerNamed: arg1
	active
		remove: arg1
		ifAbsent: [
			suspended
				remove: arg1
				ifAbsent: [ ^ NotFound signal ]].! !

!CustomerBook methodsFor: 'customer management'!
suspendCustomerNamed: arg1
	active
		remove: arg1
		ifAbsent: [ ^ CantSuspend signal ].
	suspended add: arg1.! !


!CustomerBook methodsFor: 'accessing'!
numberOfActiveCustomers
	^ active size.! !

!CustomerBook methodsFor: 'accessing'!
numberOfCustomers
	^ self numberOfActiveCustomers + self numberOfSuspendedCustomers.! !

!CustomerBook methodsFor: 'accessing'!
numberOfSuspendedCustomers
	^ suspended size.! !


!CustomerBook methodsFor: 'testing'!
includesCustomerNamed: arg1
	^ (active includes: arg1) or: [ suspended includes: arg1 ].! !

!CustomerBook methodsFor: 'testing'!
isEmpty
	^ active isEmpty and: [ suspended isEmpty ].! !


!CustomerBook methodsFor: 'signal errors'!
signalCustomerAlreadyExists
	self error: self class customerAlreadyExistsErrorMessage.! !

!CustomerBook methodsFor: 'signal errors'!
signalCustomerNameCannotBeEmpty
	self error: self class customerCanNotBeEmptyErrorMessage.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages'!
customerAlreadyExistsErrorMessage
	^ 'Customer Already Exists'.! !

!CustomerBook class methodsFor: 'error messages'!
customerCanNotBeEmptyErrorMessage
	^ 'Customer Name Cannot Be Empty'.! !

