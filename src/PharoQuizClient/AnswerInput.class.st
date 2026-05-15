"
I am a specialized Seaside component representing an individual answer entry field within the test task creation modal.

### Responsibilities:
- Provide an interface for entering the text content of a potential answer.
- Handle the selection and visual indication of whether this specific answer is the ""correct"" one for the task.
- Support both view and edit modes to allow users to toggle between static display and active input.

### Collaborators:
- **CreateTestTaskModal:** I am typically managed as part of a collection within this parent modal.
- **TestAnswer:** I map my input data directly to this domain model object to persist the answer's text and correctness status.

### Instance Variables:
- **root**: `<WAComponent>` The parent controller (usually the task modal) used to coordinate correctness toggling across multiple answer inputs.
- **testAnswer**: `<TestAnswer>` The domain model object that holds the actual text and ""isCorrect"" boolean flag.
- **isEditing**: `<Boolean>` A state flag used to switch the UI between a functional input field and a static read-only label.

### Example:

```smalltalk
html render: (AnswerInput new 
    testAnswer: aTestAnswer; 
    root: self; 
    isEditing: true).
"
Class {
	#name : 'AnswerInput',
	#superclass : 'WAComponent',
	#instVars : [
		'root',
		'testAnswer',
		'isEditing'
	],
	#category : 'PharoQuizClient',
	#package : 'PharoQuizClient'
}

{ #category : 'operations' }
AnswerInput >> getCorrectValue [

	(testAnswer isCorrect = 1) ifTrue: [ ^ true ].
	^ false
]

{ #category : 'initialization' }
AnswerInput >> initialize [

	super initialize.
	testAnswer := TestAnswer new.
	isEditing := false
]

{ #category : 'accessing' }
AnswerInput >> isEditing [

	^ isEditing
]

{ #category : 'accessing' }
AnswerInput >> isEditing: anObject [

	isEditing := anObject
]

{ #category : 'rendering' }
AnswerInput >> renderContentOn: html [

	isEditing
			ifTrue: [ self renderEditModeOn: html ]
			ifFalse: [ self renderViewModeOn: html ]
]

{ #category : 'rendering' }
AnswerInput >> renderEditModeOn: html [

	html div
		class: 'answer-input-block-e';
		with: [
				html div
					class: 'answer-text-input-e';
					with: [
							html textArea
								class: 'answer-text-area-e';
								on: #answerText of: self testAnswer.

							html div
								class: 'is-correct-block-e';
								with: [
										html label
											class: 'is-correct-label-e';
											with: 'Позначити як правильну: '.

										html checkbox
											class: 'is-correct-checkbox-e';
											value: self getCorrectValue;
											callback: [ :value | self setCorrectValue: value ].
										html div
											class: 'edit-operations';
											with: [
													html button
														class: 'edit-save-button';
														callback: [ isEditing := false ];
														with: '✓'.
													html button
														class: 'edit-cancel-button';
														callback: [ isEditing := false ];
														with: [ html html: '&#215;' ] ] ] ] ]
]

{ #category : 'rendering' }
AnswerInput >> renderViewModeOn: html [

	html div
		class: 'answer-input-block-v';
		with: [
				html div
					class: 'answer-text-input-v';
					with: [
							html heading
								level: 5;
								class: 'answer-text-v';
								with: self testAnswer answerText.

							html div
								class: 'is-correct-block-v';
								with: [
										html label
											class: 'is-correct-label-v';
											with: 'Позначити як правильну: '.

										html checkbox
											disabled;
											class: 'is-correct-checkbox-v';
											value: self getCorrectValue ].
							html div
								class: 'answer-operations';
								with: [
										html button
											class: 'edit-button';
											callback: [ isEditing := true ];
											with: [ html html: '&#x270E;' ].

										html anchor
											class: 'edit-button';
											with: [ html html: '&#x1F5D1;' ] ] ] ]
]

{ #category : 'accessing' }
AnswerInput >> root [

	^ root
]

{ #category : 'accessing' }
AnswerInput >> root: anObject [

	root := anObject
]

{ #category : 'initialization' }
AnswerInput >> setCorrectValue: aBoolean [
	testAnswer isCorrect: aBoolean asBit
]

{ #category : 'accessing' }
AnswerInput >> testAnswer [

	^ testAnswer
]

{ #category : 'accessing' }
AnswerInput >> testAnswer: anObject [

	testAnswer := anObject
]

{ #category : 'updating' }
AnswerInput >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: StyleLibrary / #answerInputCss.
	anHtmlRoot stylesheet url: StyleLibrary / #answerViewCss.
]
