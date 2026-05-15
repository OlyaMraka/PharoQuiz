"
I am a specialized repository class responsible for managing the persistence and retrieval of TestAnswer entities within the PharoQuiz system.

**Responsibilities:**
* Abstract the data access logic for test task answers using the Glorp ORM framework.
* Provide methods to retrieve answers associated with specific tasks, ensuring that only non-deleted records are returned.
* Decouple the domain model and UI components from direct database interactions and SQL execution.

**Key Methods:**
* **#targetClass**: Defines the specific domain class (TestAnswer) that this repository is responsible for managing.

**Collaborators:**
* **BaseRepository**: I inherit foundational CRUD operations and session lifecycle management from this superclass.
* **TestAnswer (Domain Model)**: The primary entity type I manage, representing possible responses to test questions.

**Example:**
```smalltalk
TestAnswerRepository new findAll.
"
Class {
	#name : 'TestAnswerRepository',
	#superclass : 'BaseRepository',
	#category : 'PharoQuizData',
	#package : 'PharoQuizData'
}

{ #category : 'accessing' }
TestAnswerRepository >> targetClass [

	^ TestAnswer
]
