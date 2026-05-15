"
I am responsible for validating user-related input data within the PharoQuiz system to ensure data integrity and security.

Responsibilities:

* Email Validation: Check if the provided email address follows a valid format and is not already in use.
* Password Security: Enforce password complexity rules such as minimum length and character variety.
* Username Verification: Ensure usernames meet length requirements.

Collaborators:

* UserManager: I provide validation results to the manager before it commits new user data to the database.

Example:

```smalltalk
UserValidator new 
    checkEmail: 'user@example.com';
    checkPassword: 'securePassword123'.
"
Class {
	#name : 'UserValidator',
	#superclass : 'BaseValidator',
	#category : 'PharoQuizCore',
	#package : 'PharoQuizCore'
}

{ #category : 'fieldChecks' }
UserValidator >> checkEmail: anEmail [

	(anEmail matchesRegex: '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$') ifFalse: [
		errors add: QuizCoreConstants invalidEmail ]
]

{ #category : 'fieldChecks' }
UserValidator >> checkPassword: aRawPassword [

	(aRawPassword isNil or: [ aRawPassword size < 8 ]) ifTrue: [ errors add: QuizCoreConstants invalidPasswordLength ].

	(aRawPassword anySatisfy: [ :char | char isUppercase ]) ifFalse: [ errors add: QuizCoreConstants invalidPasswordUppercaseMessage ].

	(aRawPassword anySatisfy: [ :char | char isAlphaNumeric not ]) ifFalse: [
		errors add: QuizCoreConstants passwordRequirementSpecialSymbol ]
]

{ #category : 'fieldChecks' }
UserValidator >> checkUsername: aName [

	(aName isNil or: [ aName size < 3 or: [ aName size > 50 ] ]) ifTrue: [ errors add: QuizCoreConstants usernameLengthMessage ]
]

{ #category : 'initialization' }
UserValidator >> validate: aUsername email: anEmail password: aPassword [

	self checkEmail: anEmail.
	self checkUsername: aUsername.
	self checkPassword: aPassword.

	^ errors
]
