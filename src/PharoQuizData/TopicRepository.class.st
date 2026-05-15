"
I am a specialized repository class responsible for managing the persistence and retrieval of Topic entities within the PharoQuiz system.

**Responsibilities:**
* Abstract the database access logic for quiz topics using the Glorp ORM framework.
* Provide a high-level API for retrieving topics, ensuring that ""soft-deleted"" records are excluded by default.
* Act as a data access layer to decouple domain components from low-level SQL or session management.

**Key Methods:**
* **#targetClass**: Defines the specific domain class (Topic) that this repository is responsible for managing.

**Collaborators:**
* **BaseRepository**: I inherit core CRUD operations and unit-of-work management from this superclass.
* **Topic (Domain Model)**: The primary object type I manage, representing a collection of test tasks.

**Example:**
```smalltalk
TopicRepository new findAll.
"
Class {
	#name : 'TopicRepository',
	#superclass : 'BaseRepository',
	#category : 'PharoQuizData',
	#package : 'PharoQuizData'
}

{ #category : 'accessing' }
TopicRepository >> targetClass [

	^ Topic 
]
