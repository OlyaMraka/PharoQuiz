"
I am a Seaside component that serves as the primary management interface for test tasks within a specific topic. I facilitate the viewing, organization, and initiation of creation workflows for individual test questions.

**Responsibilities:**
* Present a comprehensive list of test tasks associated with a selected topic by rendering multiple `TestTaskComponent` instances.
* Provide the logic for triggering and displaying the `CreateTestTaskModal` to add new questions.
* Manage the synchronization between the UI state and the database through a dedicated manager.
* Coordinate with the parent component (`root`) to handle navigation and high-level UI updates.

**Collaborators:**
* **TestTaskComponent:** I instantiate and render this component for each task to handle its individual display and editing logic.
* **CreateTestTaskModal:** I am responsible for hosting and managing the lifecycle of this modal during the task creation process.
* **TestTaskManager:** I delegate data persistence and retrieval operations to this service.

**Instance Variables:**
* **root**: `<WAComponent>` Reference to the parent component for state coordination.
* **createTestTaskModal**: `<CreateTestTaskModal | nil>` Holds the active modal instance for adding new tasks.
* **testTaskList**: `<OrderedCollection>` A collection of `TestTaskComponent` instances prepared for rendering.
* **testTaskManager**: `<TestTaskManager>` The business logic layer for handling CRUD operations on tasks.
* **topic**: `<Topic>` The domain object representing the current topic context for the tasks.

**Example:**
```smalltalk
html render: (TestTaskConfig new 
    topic: currentTopic; 
    root: self).
"
Class {
	#name : 'TestTaskConfig',
	#superclass : 'WAComponent',
	#instVars : [
		'root',
		'topic',
		'createTestTaskModal',
		'testTaskList',
		'testTaskManager'
	],
	#category : 'PharoQuizClient',
	#package : 'PharoQuizClient'
}

{ #category : 'hooks' }
TestTaskConfig >> children [

	| all |
	all := OrderedCollection new.
	createTestTaskModal ifNotNil: [ all add: createTestTaskModal ].
	testTaskList ifNotNil: [ all addAll: testTaskList ].
	^ all asArray
]

{ #category : 'accessing' }
TestTaskConfig >> createTestTaskModal [

	^ createTestTaskModal
]

{ #category : 'accessing' }
TestTaskConfig >> createTestTaskModal: anObject [

	createTestTaskModal := anObject
]

{ #category : 'initialization' }
TestTaskConfig >> initialize [ 
	super initialize .
	testTaskManager := TestTaskManager new.
]

{ #category : 'rendering' }
TestTaskConfig >> renderContentOn: html [

	html div
		class: 'test-task-config-block';
		with: [
				html div
					class: 'test-task-config-header';
					with: [
							html heading
								level: 2;
								class: 'topic-title';
								with: topic title.

							html anchor
								class: 'create-task-button';
								callback: [ self showCreateTestTaskModal ];
								with: 'Створити Завдання' ].

				html div
					class: 'test-tasks-block';
					with: [
						testTaskList ifNotEmpty: [ html unorderedList with: [ testTaskList do: [ :testTaskItem | html render: testTaskItem ] ] ] ].

				testTaskList ifEmpty: [
						html paragraph
							class: 'not-found-message';
							with: 'У системі не знайдено завдань до цієї теми!' ] ].
					
	createTestTaskModal ifNotNil: [
			html div
				id: 'create-test-task-modal';
				with: [ html render: createTestTaskModal ] ]
]

{ #category : 'accessing' }
TestTaskConfig >> root [

	^ root
]

{ #category : 'accessing' }
TestTaskConfig >> root: anObject [

	root := anObject
]

{ #category : 'operations' }
TestTaskConfig >> showCreateTestTaskModal [

	| creationModal |
	creationModal := CreateTestTaskModal new.
	creationModal root: self.
	createTestTaskModal := creationModal
]

{ #category : 'accessing' }
TestTaskConfig >> testTaskList [

	^ testTaskList
]

{ #category : 'accessing' }
TestTaskConfig >> testTaskList: anObject [

	testTaskList := anObject collect: [ :each | TestTaskComponent new
		testTask: each;
		root: self;
		isEditing: false
		 ]
]

{ #category : 'accessing' }
TestTaskConfig >> testTaskManager [

	^ testTaskManager
]

{ #category : 'accessing' }
TestTaskConfig >> testTaskManager: anObject [

	testTaskManager := anObject
]

{ #category : 'accessing' }
TestTaskConfig >> topic [

	^ topic
]

{ #category : 'accessing' }
TestTaskConfig >> topic: anObject [

	topic := anObject
]

{ #category : 'updating' }
TestTaskConfig >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: StyleLibrary / #testTaskConfigCss 
]
