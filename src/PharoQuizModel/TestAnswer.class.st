"
Test Answer entity
"
Class {
	#name : 'TestAnswer',
	#superclass : 'Object',
	#instVars : [
		'id',
		'testTask',
		'answerText',
		'isCorrect',
		'createdOn',
		'deleted',
		'deletedAt'
	],
	#category : 'PharoQuizModel',
	#package : 'PharoQuizModel'
}

{ #category : 'accessing' }
TestAnswer >> answerText [ 
^ answerText
]

{ #category : 'accessing' }
TestAnswer >> answerText: newAnswerText [
	answerText := newAnswerText 
]

{ #category : 'accessing' }
TestAnswer >> createdOn [

	^ createdOn
]

{ #category : 'accessing' }
TestAnswer >> createdOn: newCreatedOn [

	createdOn := newCreatedOn
]

{ #category : 'accessing' }
TestAnswer >> deleted [

	^ deleted
]

{ #category : 'accessing' }
TestAnswer >> deleted: anObject [

	deleted := anObject
]

{ #category : 'accessing' }
TestAnswer >> deletedAt [

	^ deletedAt
]

{ #category : 'accessing' }
TestAnswer >> deletedAt: anObject [

	deletedAt := anObject
]

{ #category : 'accessing' }
TestAnswer >> id [ 
	^ id
]

{ #category : 'accessing' }
TestAnswer >> id: newId [
	id := newId 
]

{ #category : 'initialization' }
TestAnswer >> initialize [
	super initialize.
	deleted := 0.
]

{ #category : 'accessing' }
TestAnswer >> isCorrect [ 
	^ isCorrect
]

{ #category : 'accessing' }
TestAnswer >> isCorrect: newIsCorrect [
	isCorrect := newIsCorrect 
]

{ #category : 'accessing' }
TestAnswer >> testTask [

	^ testTask
]

{ #category : 'accessing' }
TestAnswer >> testTask: newTestTask [

	testTask := newTestTask
]

{ #category : 'as yet unclassified' }
TestAnswer >> updateFrom: anotherAnswer [

	self answerText: anotherAnswer answerText.
	self isCorrect: anotherAnswer isCorrect
]
