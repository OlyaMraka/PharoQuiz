"
I am a Seaside component responsible for rendering and managing the lifecycle of an individual test task. I support two display modes: a read-only view for general browsing and an interactive edit mode for modifying task details and its associated answers.

**Responsibilities:**
* Provide a toggleable interface between viewing and editing states using the `isEditing` flag.
* Render the task's question text, point value, and a list of answer components.
* Handle the persistence of changes by coordinating with the `testTaskManager`.
* Manage a collection of `AnswerInput` or equivalent components for granular answer editing.
* Facilitate the deletion of the task through interaction with the parent configuration component.

**Collaborators:**
* **TestTaskConfig**: I report to this parent component for broad UI updates and task removal.
* **AnswerInput**: I instantiate and render these to manage the individual answers belonging to my task.
* **TestTaskManager**: I use this service to save updates or delete the task from the database.

**Instance Variables:**
* **root**: `<WAComponent>` Reference to the parent component for coordinating re-renders and navigation.
* **testTask**: `<TestTask>` The domain object containing the actual data (question, points, etc.).
* **isEditing**: `<Boolean>` Tracks whether the component is currently in edit mode.
* **answerComponentList**: `<OrderedCollection>` A list of components responsible for rendering each possible answer.
* **testTaskManager**: `<TestTaskManager>` The manager used for CRUD operations on the task data.

**Example:**
```smalltalk
html render: (TestTaskComponent new 
    testTask: aTestTask; 
    root: self).
"
Class {
	#name : 'TestTaskComponent',
	#superclass : 'WAComponent',
	#instVars : [
		'root',
		'testTask',
		'isEditing',
		'answerComponentList',
		'testTaskManager'
	],
	#category : 'PharoQuizClient',
	#package : 'PharoQuizClient'
}

{ #category : 'accessing' }
TestTaskComponent >> answerComponentList [

	^ answerComponentList
]

{ #category : 'accessing' }
TestTaskComponent >> answerComponentList: anObject [

	answerComponentList := anObject
]

{ #category : 'operations' }
TestTaskComponent >> cancellEditind [
	isEditing := false.
	answerComponentList do: [ :each | each isEditing: false ].
]

{ #category : 'hooks' }
TestTaskComponent >> children [

	^ answerComponentList
]

{ #category : 'operations' }
TestTaskComponent >> deleteTestTask [
	testTaskManager deleteTestTask: testTask.
	root testTaskList: (testTaskManager getAllByTopicId: root topic id).
]

{ #category : 'initialization' }
TestTaskComponent >> initialize [ 
	super initialize.
	testTaskManager := TestTaskManager new.
]

{ #category : 'accessing' }
TestTaskComponent >> isEditing [

	^ isEditing
]

{ #category : 'accessing' }
TestTaskComponent >> isEditing: anObject [

	isEditing := anObject
]

{ #category : 'rendering' }
TestTaskComponent >> renderContentOn: html [

	isEditing
		ifTrue: [ self renderEditModeOn: html ]
		ifFalse: [ self renderViewModeOn: html ]
]

{ #category : 'rendering' }
TestTaskComponent >> renderEditModeOn: html [

	html form
		class: 'test-task-component-e';
		with: [
				html textArea
					class: 'test-task-question-e';
					on: #question of: self testTask.

				html div
					class: 'answer-list-block';
					with: [
						answerComponentList ifNotEmpty: [
								html unorderedList with: [ answerComponentList do: [ :answerItem | html render: answerItem ] ] ] ].

				answerComponentList ifEmpty: [
						html paragraph
							class: 'not-found-message';
							with: 'Відповідей до даного завдання не знайдено!' ].

				html div
					class: 'footer-e';
					with: [
							html div
								class: 'points-input-block';
								with: [
										html label
											class: 'points-input-label';
											with: 'Кількість балів'.

										html numberInput
											class: 'points-input';
											value: self testTask points;
											callback: [ :value | self testTask points: value asInteger ].

										html div
											class: 'edit-operations';
											with: [
													html submitButton
														class: 'edit-save-button';
														callback: [ self saveChanges ];
														with: '✓'.
													html anchor
														class: 'edit-cancel-button';
														callback: [ self cancellEditind ];
														with: '×' ] ] ] ]
]

{ #category : 'rendering' }
TestTaskComponent >> renderViewModeOn: html [

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
								html unorderedList with: [ answerComponentList do: [ :answerItem | html render: answerItem ] ] ] ].

				answerComponentList ifEmpty: [
						html paragraph
							class: 'not-found-message';
							with: 'Відповідей до даного завдання не знайдено!' ].

				html div
					class: 'footer-v';
					with: [
							html div
								class: 'points-input-block';
								with: [
										html label
											class: 'points-label';
											with: 'Кількість балів'.

										html span
											class: 'points-span';
											with: self testTask points ].

							html div
								class: 'operations-v';
								with: [
										html anchor
											class: 'edit-button';
											callback: [ isEditing := true ];
											with: [ html html: '&#x270E;' ].

										html anchor
											class: 'edit-button';
											callback: [ self deleteTestTask ];
											with: [ html html: '&#x1F5D1;' ] ] ] ]
]

{ #category : 'accessing' }
TestTaskComponent >> root [

	^ root
]

{ #category : 'accessing' }
TestTaskComponent >> root: anObject [

	root := anObject
]

{ #category : 'operations' }
TestTaskComponent >> saveChanges [ 
	testTaskManager updateTestTask: testTask .
	isEditing := false.
]

{ #category : 'accessing' }
TestTaskComponent >> testTask [

	^ testTask
]

{ #category : 'accessing' }
TestTaskComponent >> testTask: anObject [

	testTask := anObject.
	answerComponentList := anObject answerList collect: [ : each | AnswerInput new testAnswer: each; root: self ].
]

{ #category : 'updating' }
TestTaskComponent >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: StyleLibrary / #testTaskEditCss.
	anHtmlRoot stylesheet url: StyleLibrary / #testTaskViewCss.	
]
