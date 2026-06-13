"
I am a specialized repository class responsible for managing the persistence and retrieval of TestTask entities within the PharoQuiz system.

**Responsibilities:**
* Abstract the complexity of database queries for test tasks using the Glorp ORM.
* Provide a clean interface for retrieving tasks that belong to a specific topic while filtering out logically deleted items.
* Ensure that business logic components remain independent of the underlying storage schema and SQL syntax.

**Key Methods:**
* **#getAllByTopicId:**: Retrieves a collection of `TestTask` instances associated with a given topic ID, ensuring they are not marked as deleted.
* **#targetClass**: Defines the specific domain class (TestTask) that this repository is responsible for managing.

**Collaborators:**
* **BaseRepository**: I inherit generic persistence methods, such as session handling and basic CRUD operations, from this superclass.
* **TestTask (Domain Model)**: The primary entity type I manage, representing individual questions or problems within the system.

**Example:**
```smalltalk
TestTaskRepository new getAllByTopicId: 10.
"
Class {
	#name : 'TestTaskRepository',
	#superclass : 'BaseRepository',
	#category : 'PharoQuizData',
	#package : 'PharoQuizData'
}

{ #category : 'operations' }
TestTaskRepository >> getAllByTopicId: topicId [

	| results |
	results := self db read: TestTask where: [ :testTask | (testTask topic id = topicId) & (testTask deleted = false) ].
	^ results
]

{ #category : 'accessing' }
TestTaskRepository >> targetClass [

	^ TestTask 
]
