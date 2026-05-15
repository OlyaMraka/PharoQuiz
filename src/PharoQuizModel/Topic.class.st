"
Topic entity
"
Class {
	#name : 'Topic',
	#superclass : 'Object',
	#instVars : [
		'id',
		'title',
		'description',
		'createdOn',
		'deleted',
		'deletedAt'
	],
	#category : 'PharoQuizModel',
	#package : 'PharoQuizModel'
}

{ #category : 'accessing' }
Topic >> createdOn [ 
	^ createdOn
]

{ #category : 'accessing' }
Topic >> createdOn: newCreatedOn [
	createdOn := newCreatedOn 
]

{ #category : 'accessing' }
Topic >> deleted [

	^ deleted
]

{ #category : 'accessing' }
Topic >> deleted: anObject [

	deleted := anObject
]

{ #category : 'accessing' }
Topic >> deletedAt [

	^ deletedAt
]

{ #category : 'accessing' }
Topic >> deletedAt: anObject [

	deletedAt := anObject
]

{ #category : 'accessing' }
Topic >> description [ 
	^ description 
]

{ #category : 'accessing' }
Topic >> description: newDescription [
	description := newDescription 
]

{ #category : 'accessing' }
Topic >> id [ 
	^ id
]

{ #category : 'accessing' }
Topic >> id: newId [
	id := newId 
]

{ #category : 'initialization' }
Topic >> initialize [
	super initialize.
	deleted := 0.
]

{ #category : 'accessing' }
Topic >> title [ 
	^ title
]

{ #category : 'accessing' }
Topic >> title: newTitle [
	title := newTitle 
]

{ #category : 'as yet unclassified' }
Topic >> updateFrom: anotherTask [
    self title: anotherTask title.
    self description: anotherTask description.
]
