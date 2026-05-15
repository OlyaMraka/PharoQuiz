"
Input Validator
"
Class {
	#name : 'BaseValidator',
	#superclass : 'Object',
	#instVars : [
		'errors'
	],
	#category : 'PharoQuizCore',
	#package : 'PharoQuizCore'
}

{ #category : 'initialization' }
BaseValidator >> addError: newMessage [
	errors add: newMessage .
]

{ #category : 'initialization' }
BaseValidator >> initialize [ 
	errors := OrderedCollection new.
]

{ #category : 'initialization' }
BaseValidator >> isValid [
	^ errors isEmpty .
]
