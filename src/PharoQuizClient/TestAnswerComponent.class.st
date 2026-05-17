"
I am a granular UI component responsible for rendering a single answer option within a quiz question. I am designed to support dynamic, multi-selection long-scroll test sheets by updating the user's selection state instantly without full-page reloads.

### Responsibilities:

* **Option Visualization:** I render an individual answer text coupled with a checkbox or a choice indicator, matching the specific cyberpunk theme styling.
* **State Mapping:** I evaluate my visual state (`checked` vs `unchecked`) by inspecting my internal `isSelected` slot or querying the active tracking session.
* **Asynchronous Selection:** I capture user toggle interactions on the checkbox and trigger background Ajax callbacks to instantly update the user's running choices on the server.

### Collaborators:

* **TestTaskComponent:** I am instantiated and rendered inside a task container's answer list loop.
* **TestAnswer:** I read the raw data fields, such as `answerText`, directly from my assigned domain model slot.

### Example:

```smalltalk

html div class: 'answers-list'; with: [
    self currentTask answers do: [ :eachAnswer |
        html render: (TestAnswerComponent new
            testAnswer: eachAnswer;
            root: self root;
            isSelected: false) ] ]
"
Class {
	#name : 'TestAnswerComponent',
	#superclass : 'WAComponent',
	#instVars : [
		'root',
		'testAnswer',
		'isSelected'
	],
	#category : 'PharoQuizClient',
	#package : 'PharoQuizClient'
}

{ #category : 'initialization' }
TestAnswerComponent >> initialize [

	super initialize.
	isSelected := false.
]

{ #category : 'accessing' }
TestAnswerComponent >> isSelected [

	^ self root userAnswerList includes: self testAnswer
]

{ #category : 'accessing' }
TestAnswerComponent >> isSelected: anObject [

	isSelected := anObject
]

{ #category : 'rendering' }
TestAnswerComponent >> renderContentOn: html [

	html div
		class: 'answer-block';
		with: [
				html checkbox
					class: 'choose-checkbox';
					value: self isSelected;
					onChange: (html jQuery ajax callback: [ self root addAnswer: self testAnswer ]).

				html paragraph
					class: 'answer-content';
					with: self testAnswer answerText ]
]

{ #category : 'accessing' }
TestAnswerComponent >> root [

	^ root
]

{ #category : 'accessing' }
TestAnswerComponent >> root: anObject [

	root := anObject
]

{ #category : 'accessing' }
TestAnswerComponent >> testAnswer [

	^ testAnswer
]

{ #category : 'accessing' }
TestAnswerComponent >> testAnswer: anObject [

	testAnswer := anObject
]

{ #category : 'updating' }
TestAnswerComponent >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: StyleLibrary / #testAnswerCss.
]
