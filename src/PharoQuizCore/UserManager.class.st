"
I am a specialized component responsible for managing user-related operations, including authentication, registration, and coordination with the data repository.

Responsibilities:
- Handle the creation of new user accounts by processing email, password, and role information.
- Manage user authentication (sign-in) logic by verifying credentials against stored data.
- Act as a bridge between the application logic and the user repository for data persistence.
- Utilize validation logic to ensure user data remains consistent and secure during operations.

Collaborators:
- UserValidator: I delegate data integrity checks to this component before performing creation or authentication tasks.
- UserRepository: I rely on this component for retrieving and storing user instances in the database or system storage.
- SignInForm / SignUpForm: I serve as the primary backend controller for these interface components.

Instance Variables:
- userRepository: <Object> An instance responsible for low-level data access and persistence of user records.
- userValidator: <UserValidator> An instance used to verify user input and credentials.

Example:

```smalltalk
userManager := UserManager new.
userManager 
    createUser: 'newuser@example.com' 
    password: 'secure123' 
    role: #student.
userManager 
    signInUser: 'user@example.com' 
    password: 'password'.
"
Class {
	#name : 'UserManager',
	#superclass : 'Object',
	#instVars : [
		'userRepository',
		'userValidator',
		'emailService'
	],
	#category : 'PharoQuizCore',
	#package : 'PharoQuizCore'
}

{ #category : 'operations' }
UserManager >> confirmEmail: aToken [

	| user |
	user := userRepository findByToken: aToken.
	userRepository confirmEmail: 1 userId: user id.
]

{ #category : 'operations' }
UserManager >> createUser: aUsername email: anEmail password: aPassword role: aRole [

	| newUser validationErrors |
	newUser := User new.

	validationErrors := userValidator validate: aUsername email: anEmail password: aPassword.
	validationErrors ifNotEmpty: [ Error signal: ('-' join: validationErrors) ].

	(userRepository findByEmail: anEmail) ifNotNil: [
		Error signal: (QuizCoreConstants userAlreadyExistsByEmailErrorMessage: anEmail) ].

	(userRepository findByUsername: aUsername) ifNotNil: [
		Error signal: (QuizCoreConstants userAlreadyExistsByUsernameErrorMessage: aUsername) ].

	newUser email: anEmail.
	newUser username: aUsername.
	newUser passwordHash: (SHA256 hashMessage: aPassword) hex.
	newUser role: aRole.
	newUser createdOn: DateAndTime now.
	newUser confirmationToken: UUID new asString36.

	userRepository save: newUser.

	emailService sendConfirmationTo: newUser.

	^ newUser
]

{ #category : 'initialization' }
UserManager >> initialize [

	userValidator := UserValidator new.
	userRepository := UserRepository new.
	emailService := EmailService new
]

{ #category : 'operations' }
UserManager >> signInUser: aUserName password: aPassword [

	| user inputHash |
	user := userRepository findByUsername: aUserName.

	user ifNil: [ Error signal: (QuizCoreConstants userDoesNotExistErrorMessage: aUserName) ].

	inputHash := (SHA256 hashMessage: aPassword) hex.

	user passwordHash = inputHash ifFalse: [ Error signal: QuizCoreConstants incorrectPassword ].

	^ user
]

{ #category : 'operations' }
UserManager >> updateUser: aUser [

	userRepository update: aUser.
	^ aUser.
]
