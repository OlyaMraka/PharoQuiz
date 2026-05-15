"
Coding Task entity
"
Class {
	#name : 'CodingTask',
	#superclass : 'Object',
	#instVars : [
		'id',
		'topic',
		'taskText',
		'difficulty',
		'points',
		'createdOn',
		'deleted',
		'deletedAt'
	],
	#category : 'PharoQuizModel',
	#package : 'PharoQuizModel'
}

{ #category : 'accessing' }
CodingTask >> createdOn [

	^ createdOn
]

{ #category : 'accessing' }
CodingTask >> createdOn: newCreatedOn [

	createdOn := newCreatedOn
]

{ #category : 'accessing' }
CodingTask >> deleted [

	^ deleted
]

{ #category : 'accessing' }
CodingTask >> deleted: anObject [

	deleted := anObject
]

{ #category : 'accessing' }
CodingTask >> deletedAt [

	^ deletedAt
]

{ #category : 'accessing' }
CodingTask >> deletedAt: anObject [

	deletedAt := anObject
]

{ #category : 'accessing' }
CodingTask >> difficulty [

	^ difficulty
]

{ #category : 'accessing' }
CodingTask >> difficulty: newDifficulty [

	difficulty := newDifficulty
]

{ #category : 'accessing' }
CodingTask >> id [

	^ id
]

{ #category : 'accessing' }
CodingTask >> id: newId [

	id := newId
]

{ #category : 'initialization' }
CodingTask >> initialize [
	super initialize.
	deleted := 0.
]

{ #category : 'accessing' }
CodingTask >> points [

	^ points
]

{ #category : 'accessing' }
CodingTask >> points: newPoints [

	points := newPoints
]

{ #category : 'accessing' }
CodingTask >> taskText [

	^ taskText
]

{ #category : 'accessing' }
CodingTask >> taskText: anObject [

	taskText := anObject
]

{ #category : 'accessing' }
CodingTask >> topic [

	^ topic
]

{ #category : 'accessing' }
CodingTask >> topic: newTopic [

	topic := newTopic
]
