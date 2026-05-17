Class {
	#name : 'TestQuestionComponent',
	#superclass : 'WAComponent',
	#instVars : [
		'root',
		'testTask',
		'answerComponentList',
		'userAnswerList'
	],
	#category : 'PharoQuizClient',
	#package : 'PharoQuizClient'
}

{ #category : 'adding' }
TestQuestionComponent >> addAnswer: anAnswerId [

	(userAnswerList includes: anAnswerId)
		ifTrue: [ userAnswerList remove: anAnswerId ]
		ifFalse: [ userAnswerList add: anAnswerId ].
]

{ #category : 'accessing' }
TestQuestionComponent >> answerComponentList [

	^ answerComponentList
]

{ #category : 'accessing' }
TestQuestionComponent >> answerComponentList: anObject [

	answerComponentList := anObject
]

{ #category : 'accessing' }
TestQuestionComponent >> children [

	^ answerComponentList
]

{ #category : 'initialization' }
TestQuestionComponent >> initialize [ 
	super initialize.
	userAnswerList := OrderedCollection new.
]

{ #category : 'rendering' }
TestQuestionComponent >> renderContentOn: html [

	html div
		class: 'test-task-component-v';
		with: [
				html paragraph
					class: 'test-task-question-v';
					with: self testTask question.

				html div
					class: 'answer-list-block disabled-mode';
					with: [
						answerComponentList ifNotEmpty: [
								html unorderedList with: [ answerComponentList do: [ :answerItem | html render: answerItem ] ] ] ] ]
]

{ #category : 'accessing' }
TestQuestionComponent >> root [

	^ root
]

{ #category : 'accessing' }
TestQuestionComponent >> root: anObject [

	root := anObject
]

{ #category : 'accessing' }
TestQuestionComponent >> testTask [

	^ testTask
]

{ #category : 'accessing' }
TestQuestionComponent >> testTask1: anObject [

	testTask := anObject
]

{ #category : 'accessing' }
TestQuestionComponent >> testTask: anObject [

	testTask := anObject.
	answerComponentList := anObject answerList collect: [ :each |
			                       TestAnswerComponent new
				                       testAnswer: each;
				                       root: self ]
]

{ #category : 'updating' }
TestQuestionComponent >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: StyleLibrary / #testAnswerCss.
	anHtmlRoot stylesheet url: StyleLibrary / #testQuestionCss.	
]

{ #category : 'accessing' }
TestQuestionComponent >> userAnswerList [

	^ userAnswerList
]

{ #category : 'accessing' }
TestQuestionComponent >> userAnswerList: anObject [

	userAnswerList := anObject
]
