"
I am an abstract base class that provides the core infrastructure and shared behaviors for all concrete repositories within the PharoQuizData layer.

Responsibilities:
- Manage the database session and provide a unified interface for database interactions via the #db method.
- Implement generic CRUD (Create, Read, Update, Delete) operations such as #save:, #delete:, and #findAll.
- Define the architectural contract for subclasses, requiring them to specify a #targetClass for domain mapping.
- Simplify database connectivity management across the application by centralizing session handling.

Key Methods:
- #db: Returns the current database session or connection manager.
- #save: / #delete:: Standard persistence methods for managing domain object lifecycles.
- #findAll: Retrieves all instances of the managed domain class from the database.
- #targetClass: An abstract method that must be overridden by subclasses to return the specific domain class they manage.

Collaborators:
- Glorp: I serve as the primary interface for Glorp-based object-relational mapping.
- QuizDBManager: I coordinate with the database manager to obtain active sessions.
- Subclasses (e.g., UserRepository): Concrete implementations that inherit my persistence logic.

Example:
    BaseRepository is an abstract class and should not be instantiated directly. Use its subclasses instead.

"
Class {
	#name : 'BaseRepository',
	#superclass : 'Object',
	#category : 'PharoQuizData',
	#package : 'PharoQuizData'
}

{ #category : 'dbConn' }
BaseRepository >> db [

	^ QuizDBManager new session
]

{ #category : 'actions' }
BaseRepository >> delete: anObject [

	| session existing |
	session := self db.
	session beginUnitOfWork.
	[
		existing := session readOneOf: anObject class where: [ :each | each id = anObject id ].
		
		existing ifNotNil: [ 
			existing deleted: 1.
			existing deletedAt: DateAndTime now.
			session register: existing.
		].
		
		session commitUnitOfWork ]
		on: Error
		do: [ :ex |
				session rollbackUnitOfWork.
				ex pass ]
]

{ #category : 'typing/selecting keys' }
BaseRepository >> findAll [

	| session result |
	session := self db.
	session beginUnitOfWork.
	[
		result := session read: self targetClass where: [ :each | each deleted = 0 ].
		session commitUnitOfWork.
		^ result ]
		on: Error
		do: [ :ex |
				session rollbackUnitOfWork.
				ex pass ]
]

{ #category : 'actions' }
BaseRepository >> save: newEntity [

	| s |
	s := self db.
	s beginUnitOfWork.
	[
		s register: newEntity.
		s commitUnitOfWork ]
		on: Error
		do: [ :ex |
				s rollbackUnitOfWork.
				ex pass ]
]

{ #category : 'accessing' }
BaseRepository >> targetClass [
	^ self subclassResponsibility
]

{ #category : 'updating' }
BaseRepository >> update: anEntity [

	| s existing |
	s := self db.
	s beginUnitOfWork.
	[ 
		existing := s readOneOf: anEntity class where: [ :each | each id = anEntity id ].

		existing ifNotNil: [ existing updateFrom: anEntity ] ifNil: [ s register: anEntity ].

		s commitUnitOfWork ]
		on: Error
		do: [ :ex |
				s rollbackUnitOfWork.
				ex pass ]
]
