"
I am a custom session class for the PharoQuiz application, extending the standard Seaside session management to handle application-specific state and authentication.

### Responsibilities:
- Maintain the lifecycle of a user's interaction with the application.
- Store and provide global access to the currently authenticated user object.
- Manage session-level security headers and filtering logic to ensure protected resources are not accessed without authorization.
- Handle housekeeping tasks, such as cache control and redirection upon session expiration or logout.

### Collaborators:
- **WAAdmin:** I am registered as the primary session class for the 'pharo-quiz' application handler.
- **QuizAppRoot / All Components:** Any component can access me via `self session` to retrieve the `currentUser` or trigger session-wide actions.
- **User:** I hold a reference to the domain model representing the logged-in user.

### Instance Variables:
- **currentUser**: `<User | nil>` The domain object representing the authenticated user. If nil, the session is considered ""guest"" or unauthenticated.

### Key Methods:
- **handleFiltered:** Overridden to inject security headers (e.g., Cache-Control) or to perform automated redirects if session state becomes invalid.

### Example:

```smalltalk
""Accessing the user from any component""
userName := self session currentUser username.

""Setting the user during login""
self session currentUser: anAuthenticatedUser.
"
Class {
	#name : 'QuizSession',
	#superclass : 'WASession',
	#instVars : [
		'currentUser'
	],
	#category : 'PharoQuizClient',
	#package : 'PharoQuizClient'
}

{ #category : 'adding' }
QuizSession >> addHousekeepingHeaders: aResponse [

	aResponse headerAt: 'Cache-Control' put: 'no-cache, no-store, must-revalidate'.
	aResponse headerAt: 'Pragma' put: 'no-cache'.
	aResponse headerAt: 'Expires' put: '0'
]

{ #category : 'accessing' }
QuizSession >> currentUser [

	^ currentUser
]

{ #category : 'accessing' }
QuizSession >> currentUser: anObject [

	currentUser := anObject
]

{ #category : 'handling' }
QuizSession >> handleFiltered: aRequestContext [
    aRequestContext response headerAt: 'Cache-Control' put: 'no-cache, no-store, must-revalidate'.
    super handleFiltered: aRequestContext.
]
