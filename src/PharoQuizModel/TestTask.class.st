"
Test Task entity
"
Class {
	#name : 'TestTask',
	#superclass : 'Object',
	#instVars : [
		'id',
		'topic',
		'question',
		'difficulty',
		'points',
		'createdOn',
		'answerList',
		'deleted',
		'deletedAt'
	],
	#category : 'PharoQuizModel',
	#package : 'PharoQuizModel'
}

{ #category : 'accessing' }
TestTask >> answerList [

	^ answerList
]

{ #category : 'accessing' }
TestTask >> answerList: anObject [

	answerList := anObject
]

{ #category : 'accessing' }
TestTask >> createdOn [

	^ createdOn
]

{ #category : 'accessing' }
TestTask >> createdOn: newCreatedOn [

	createdOn := newCreatedOn
]

{ #category : 'accessing' }
TestTask >> deleted [

	^ deleted
]

{ #category : 'accessing' }
TestTask >> deleted: anObject [

	deleted := anObject
]

{ #category : 'accessing' }
TestTask >> deletedAt [

	^ deletedAt
]

{ #category : 'accessing' }
TestTask >> deletedAt: anObject [

	deletedAt := anObject
]

{ #category : 'accessing' }
TestTask >> difficulty [ 
	^ difficulty 
]

{ #category : 'accessing' }
TestTask >> difficulty: newDifficulty [
	difficulty := newDifficulty 
]

{ #category : 'accessing' }
TestTask >> id [ 
	^ id
]

{ #category : 'accessing' }
TestTask >> id: newId [
	id := newId 
]

{ #category : 'initialization' }
TestTask >> initialize [
	super initialize.
	deleted := 0.
]

{ #category : 'accessing' }
TestTask >> points [ 
	^ points
]

{ #category : 'accessing' }
TestTask >> points: newPoints [
	points := newPoints 
]

{ #category : 'accessing' }
TestTask >> question [ 
	^ question
]

{ #category : 'accessing' }
TestTask >> question: newQuestion [
	question := newQuestion 
]

{ #category : 'accessing' }
TestTask >> topic [

	^ topic
]

{ #category : 'accessing' }
TestTask >> topic: newTopic [

	topic := newTopic
]

{ #category : 'as yet unclassified' }
TestTask >> updateFrom: anotherTask [

	self question: anotherTask question.
	self points: anotherTask points.
	
	anotherTask answerList do: [ :newAns |
		| oldAns |
		oldAns := self answerList 
			detect: [ :each | each id = newAns id ] 
			ifNone: [ nil ].
			
		oldAns ifNotNil: [
			oldAns updateFrom: newAns.
		] ifNil: [
			self answerList add: newAns.
			newAns testTask: self.
		]
	].
]
