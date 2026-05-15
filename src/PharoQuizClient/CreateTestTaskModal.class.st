"
I am a specialized Seaside component that provides a modal interface for creating new test tasks (questions) within the quiz configuration workflow.

### Responsibilities:
- Provide a form-based interface for entering question text and managing a list of potential answers.
- Manage the dynamic addition and removal of answer input fields.
- Validate the input data and display error notifications using an embedded error modal if requirements are not met.
- Delegate the final task creation and state persistence to the parent component.

### Collaborators:
- **TestTaskConfig:** I am typically invoked by these components to handle the specific logic of task creation.
- **AnswerInput:** I instantiate multiple instances of this component to represent individual answer options.
- **ErrorModal:** I utilize this component to provide visual feedback when validation or submission errors occur.

### Instance Variables:
- **root**: `<WAComponent>` A reference to the parent component used for state synchronization and navigation.
- **taskContent**: `<String>` The current text value of the question being created.
- **answerComponentList**: `<OrderedCollection of: AnswerInput>` A collection of sub-components used to render and manage individual answer fields.
- **errorModal**: `<ErrorModal>` A reference to the modal component used for displaying validation messages.

### Example:

```smalltalk
CreateTestTaskModal new
    root: self;
    yourself.
"
Class {
	#name : 'CreateTestTaskModal',
	#superclass : 'WAComponent',
	#instVars : [
		'root',
		'taskContent',
		'answerList',
		'answerComponentList',
		'errorModal'
	],
	#category : 'PharoQuizClient',
	#package : 'PharoQuizClient'
}

{ #category : 'adding' }
CreateTestTaskModal >> addAnswer [ 
	| newAnswer |
	newAnswer := AnswerInput new.
	newAnswer isEditing: true.
	newAnswer root: self. 
   answerComponentList add: newAnswer.
]

{ #category : 'accessing' }
CreateTestTaskModal >> answerComponentList [

	^ answerComponentList
]

{ #category : 'accessing' }
CreateTestTaskModal >> answerComponentList: anObject [

	answerComponentList := anObject
]

{ #category : 'accessing' }
CreateTestTaskModal >> answerList [

	^ answerList
]

{ #category : 'accessing' }
CreateTestTaskModal >> answerList: anObject [

	answerList := anObject
]

{ #category : 'hooks' }
CreateTestTaskModal >> children [
    ^ answerComponentList
]

{ #category : 'initialization' }
CreateTestTaskModal >> close [

	root createTestTaskModal: nil
]

{ #category : 'accessing' }
CreateTestTaskModal >> errorModal [

	^ errorModal
]

{ #category : 'accessing' }
CreateTestTaskModal >> errorModal: anObject [

	errorModal := anObject
]

{ #category : 'initialization' }
CreateTestTaskModal >> initialize [

	super initialize.
	taskContent := ''.
	answerList := OrderedCollection new.
	answerComponentList := OrderedCollection new
]

{ #category : 'rendering' }
CreateTestTaskModal >> renderContentOn: html [

	html div
		class: 'form-overlay';
		with: [
				html form
					class: 'create-test-block';
					with: [
							html anchor
								class: 'close-button';
								callback: [ self close ];
								with: '×'.

							html heading
								level: 2;
								class: 'create-test-title';
								with: 'Створення тестового завдання'.

							html div
								class: 'test-content-input';
								with: [
										html label
											class: 'test-content-label';
											with: 'Введіть питання: '.

										html textArea
											class: 'content-text-area';
											on: #taskContent of: self ].

							html div
								class: 'answers-block';
								with: [
										html div
											class: 'answer-list';
											with: [ answerComponentList do: [ :topicItem | html render: topicItem ] ].

										html submitButton
											class: 'add-answer-button';
											callback: [ self addAnswer ];
											with: 'Додати відповідь' ].
							html submitButton
								class: 'create-task-submit';
								callback: [ self submit ] ] ].
						
	errorModal ifNotNil: [
						html div
							id: 'error-modal';
							with: [ html render: errorModal ] ] 
]

{ #category : 'accessing' }
CreateTestTaskModal >> root [

	^ root
]

{ #category : 'accessing' }
CreateTestTaskModal >> root: anObject [

	root := anObject
]

{ #category : 'submit' }
CreateTestTaskModal >> submit [

	| testTaskManager newTestTask answersForSaving |
	answersForSaving := answerComponentList collect: [ :eachComponent |
			                    | answer |
			                    answer := eachComponent testAnswer.
			                    answer ].

	testTaskManager := TestTaskManager new.
	[
		newTestTask := testTaskManager
			               saveTestTask: taskContent
			               answers: answersForSaving
			               points: 0
			               topic: root topic.


		root testTaskList: (testTaskManager getAllByTopicId: root topic id).
		self close ]
		on: Error
		do: [ :result |
				| resultErrorList |
				resultErrorList := '-' split: result messageText.
				errorModal := ErrorModal new.
				errorModal root: self.
				errorModal errorList: resultErrorList ]
]

{ #category : 'accessing' }
CreateTestTaskModal >> taskContent [

	^ taskContent
]

{ #category : 'accessing' }
CreateTestTaskModal >> taskContent: anObject [

	taskContent := anObject
]

{ #category : 'updating' }
CreateTestTaskModal >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: StyleLibrary / #createTestFormCss.
	anHtmlRoot stylesheet url: StyleLibrary / #answerInputCss.
	anHtmlRoot stylesheet url: StyleLibrary / #answerViewCss.
	anHtmlRoot stylesheet url: StyleLibrary / #errorModalCss
]
