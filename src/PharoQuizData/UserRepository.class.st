"
I am a specialized repository class responsible for managing the persistence and retrieval of User entities within the PharoQuiz system.

Responsibilities:
- Abstract the database access logic using the Glorp ORM framework.
- Provide a high-level API for finding users based on specific criteria such as email or username.
- Ensure that domain components like UserManager do not need to interact directly with database queries.

Key Methods:
- #findByEmail: Retrieves a single User instance associated with the provided email address.
- #findByUsername: Locates a User based on their unique login name.
- #targetClass: Defines the specific domain class (User) that this repository is responsible for managing.

Collaborators:
- BaseRepository: I inherit core persistence behaviors and session management from this superclass.
- User (Domain Model): The primary object type I manage and return.

Example:
```smalltalk
UserRepository new findByEmail: 'test@example.com'.
"
Class {
	#name : 'UserRepository',
	#superclass : 'BaseRepository',
	#category : 'PharoQuizData',
	#package : 'PharoQuizData'
}

{ #category : 'operations' }
UserRepository >> confirmEmail: aConfirmationStatus userId: anId [

	| s existing |
	s := self db.
	s beginUnitOfWork.
	[
		existing := s readOneOf: User where: [ :user | user id = anId & (user deleted = false) ].

		existing emailConfirmed: aConfirmationStatus.
		
		s commitUnitOfWork ]
		on: Error
		do: [ :ex |
				s rollbackUnitOfWork.
				ex pass ]
]

{ #category : 'findObjects' }
UserRepository >> findByEmail: anEmail [

	| results |
	results := self db read: User where: [ :user | (user email = anEmail) & (user deleted = false) ].
	^ results ifEmpty: [ nil ] ifNotEmpty: [ results first ]
]

{ #category : 'findObjects' }
UserRepository >> findByToken: aToken [

	| results |
	results := self db read: User where: [ :user | user confirmationToken = aToken & (user deleted = false) ].
	^ results ifEmpty: [ nil ] ifNotEmpty: [ results first ]
]

{ #category : 'findObjects' }
UserRepository >> findByUsername: aUsername [

	| results |
	results := self db read: User where: [ :user | (user username = aUsername) & (user deleted = false) ].
	^ results ifEmpty: [ nil ] ifNotEmpty: [ results first ]
]

{ #category : 'accessing' }
UserRepository >> targetClass [ 
	^ User 
]
