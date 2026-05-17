Class {
	#name : 'QuizResult',
	#superclass : 'Object',
	#instVars : [
		'id',
		'topic',
		'points',
		'incorrectQuestions'
	],
	#category : 'PharoQuizModel',
	#package : 'PharoQuizModel'
}

{ #category : 'accessing' }
QuizResult >> id [

	^ id
]

{ #category : 'accessing' }
QuizResult >> id: anObject [

	id := anObject
]

{ #category : 'accessing' }
QuizResult >> incorrectQuestions [

	^ incorrectQuestions
]

{ #category : 'accessing' }
QuizResult >> incorrectQuestions: anObject [

	incorrectQuestions := anObject
]

{ #category : 'accessing' }
QuizResult >> points [

	^ points
]

{ #category : 'accessing' }
QuizResult >> points: anObject [

	points := anObject
]

{ #category : 'accessing' }
QuizResult >> topic [

	^ topic
]

{ #category : 'accessing' }
QuizResult >> topic: anObject [

	topic := anObject
]
