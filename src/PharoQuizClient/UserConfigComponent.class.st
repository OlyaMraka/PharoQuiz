"
I am a specialized Seaside component designed to manage and display user-specific profile information.

### Responsibilities:
- Provide a personalized greeting and visual overview of the currently logged-in user's profile.
- Display core user data, such as username and email address, in a structured and styled layout.
- Act as the primary interface for users to review their account details before initiating editing or management tasks.

### Collaborators:
- **QuizSession:** I rely on the session to retrieve the `currentUser` object and ensure the data remains synchronized with the authenticated account.
- **StyleLibrary:** My layout (including blocks for greetings and info) is styled using specific CSS classes like `user-config-block` and `greating-block` defined in the project's style library.

### Instance Variables:
- **root**: `<WAComponent>` A reference to the parent component (usually the main dashboard or root) to handle navigation and state transitions.
- **currentUser**: `<User>` The domain model object representing the authenticated user whose data is being displayed.

### Example:

```smalltalk
UserConfigComponent new
    root: self;
    currentUser: self session currentUser;
    yourself.
"
Class {
	#name : 'UserConfigComponent',
	#superclass : 'WAComponent',
	#instVars : [
		'root',
		'currentUser'
	],
	#category : 'PharoQuizClient',
	#package : 'PharoQuizClient'
}

{ #category : 'accessing' }
UserConfigComponent >> currentUser [

	^ currentUser
]

{ #category : 'accessing' }
UserConfigComponent >> currentUser: anObject [

	currentUser := anObject
]

{ #category : 'initialization' }
UserConfigComponent >> initialize [ 
	super initialize .
	currentUser := self session currentUser.
]

{ #category : 'rendering' }
UserConfigComponent >> renderContentOn: html [

	html div
		class: 'user-config-block';
		with: [
				html div
					class: 'greating-block';
					with: [
							html heading
								level: 1;
								with: 'Вітаємо у PharoQuiz, ' , self session currentUser username ].

				html div
					class: 'user-info-block';
					with: [
							html div
								class: 'username-block';
								with: [
										html heading
											level: 3;
											with: 'Ім''я користувача: '.

										html span: self session currentUser username ].

							html div
								class: 'useremail-block';
								with: [
										html heading
											level: 3;
											with: 'Електронна пошта: '.

										html span: self session currentUser email ].

							html div
								class: 'operations-block';
								with: [
										html anchor
											class: 'edit-user-button';
											callback: [ self root showEditUserForm ];
											with: 'Редагувати користувача' ] ] ]
]

{ #category : 'accessing' }
UserConfigComponent >> root [

	^ root
]

{ #category : 'accessing' }
UserConfigComponent >> root: anObject [

	root := anObject
]

{ #category : 'updating' }
UserConfigComponent >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: StyleLibrary / #userConfigCss
]
