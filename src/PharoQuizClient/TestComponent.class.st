Class {
	#name : 'TestComponent',
	#superclass : 'WAComponent',
	#instVars : [
		'root',
		'topic',
		'testTaskList',
		'testTaskManager',
		'resultModal'
	],
	#category : 'PharoQuizClient',
	#package : 'PharoQuizClient'
}

{ #category : 'initialization' }
TestComponent >> initialize [ 
	super initialize .
	testTaskManager := TestTaskManager  new.
]

{ #category : 'rendering' }
TestComponent >> renderContentOn: html [

	html div
		class: 'test--block';
		with: [
				html div
					class: 'test-header';
					with: [
							html heading
								level: 2;
								class: 'topic-title';
								with: topic title.
							html form: [
									html div
										class: 'test-tasks-block';
										with: [
											testTaskList ifNotEmpty: [ html unorderedList with: [ testTaskList do: [ :testTaskItem | html render: testTaskItem ] ] ] ]. 
									html submitButton
										class: 'submit-button';
										callback: [ self submitAndCheckAnswers ];
										with: 'Перевірити' ].

							testTaskList ifEmpty: [
									html paragraph
										class: 'not-found-message';
										with: 'У системі не знайдено завдань до цієї теми!' ] ] ].
	resultModal ifNotNil: [ html render: resultModal ]
]

{ #category : 'accessing' }
TestComponent >> resultModal [

	^ resultModal
]

{ #category : 'accessing' }
TestComponent >> resultModal: anObject [

	resultModal := anObject
]

{ #category : 'accessing' }
TestComponent >> root [

	^ root
]

{ #category : 'accessing' }
TestComponent >> root: anObject [

	root := anObject
]

{ #category : 'operations' }
TestComponent >> submitAndCheckAnswers [

	| resultDictionary quizResult |
	resultDictionary := Dictionary new. 
	testTaskList do: [ :questionComponent |
			| taskId selectedIds |
			taskId := questionComponent testTask id.
			selectedIds := questionComponent userAnswerList collect: [ :answer | answer id ].
			resultDictionary at: taskId put: selectedIds asOrderedCollection ]. 
	quizResult := testTaskManager checkAnswersss: topic id results: resultDictionary.
	resultModal := TestTaskResultModal new.
	resultModal quizResult: quizResult.
	resultModal root: self
]

{ #category : 'accessing' }
TestComponent >> testTaskList [

	^ testTaskList
]

{ #category : 'accessing' }
TestComponent >> testTaskList1: anObject [

	testTaskList := anObject
]

{ #category : 'accessing' }
TestComponent >> testTaskList: anObject [

	testTaskList := anObject collect: [ :each |
			                TestQuestionComponent new
				                testTask: each;
				                root: self]
]

{ #category : 'accessing' }
TestComponent >> testTaskManager [

	^ testTaskManager
]

{ #category : 'accessing' }
TestComponent >> testTaskManager: anObject [

	testTaskManager := anObject
]

{ #category : 'accessing' }
TestComponent >> topic [

	^ topic
]

{ #category : 'accessing' }
TestComponent >> topic: anObject [

	topic := anObject
]

{ #category : 'updating' }
TestComponent >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: StyleLibrary / #testCss.
	anHtmlRoot stylesheet url: StyleLibrary / #testQuestionCss.
	anHtmlRoot stylesheet url: StyleLibrary / #testAnswerCss.
	anHtmlRoot stylesheet url: StyleLibrary / #quizResultModalCss .
]
