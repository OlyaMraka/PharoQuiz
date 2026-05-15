"
I am a Seaside component designed to provide a secure and intuitive interface for updating existing user profile information within the PharoQuiz system.

### Responsibilities:
- Present a pre-populated form allowing users to modify their personal details such as username and email.
- Facilitate the data synchronization process by coordinating with the `UserManager` to persist changes.
- Ensure session integrity by updating the global session state upon a successful data update.
- Provide immediate visual feedback for validation errors or persistence failures using an integrated error modal.

### Collaborators:
- **QuizSession:** I interact with the session to retrieve the current user's state and update it after a successful submission.
- **UserManager:** I delegate the actual database update operations and business logic validation to this service.
- **ErrorModal:** I instantiate and render this component to display specific update failures or validation messages to the user.

### Instance Variables:
- **root**: `<WAComponent>` The parent orchestrator used for delegation, navigation, and closing the edit overlay.
- **editingUser**: `<User>` A detached copy or reference to the user object currently being modified to ensure transactional integrity.
- **userManager**: `<UserManager>` A reference to the service responsible for user data persistence.
- **errorModal**: `<ErrorModal | nil>` An optional child component used to present descriptive error messages during the update process.

### Example:

```smalltalk
html render: (EditUserForm new 
    root: self; 
    editingUser: self session currentUser copy; 
    yourself).
"
Class {
	#name : 'EditUserForm',
	#superclass : 'WAComponent',
	#instVars : [
		'root',
		'editingUser',
		'errorModal',
		'userManager'
	],
	#category : 'PharoQuizClient',
	#package : 'PharoQuizClient'
}

{ #category : 'initialization' }
EditUserForm >> close [
	root editUserForm: nil
]

{ #category : 'accessing' }
EditUserForm >> editingUser [

	^ editingUser
]

{ #category : 'accessing' }
EditUserForm >> editingUser: anObject [

	editingUser := anObject
]

{ #category : 'accessing' }
EditUserForm >> errorModal [

	^ errorModal
]

{ #category : 'accessing' }
EditUserForm >> errorModal: anObject [

	errorModal := anObject
]

{ #category : 'initialization' }
EditUserForm >> initialize [

	super initialize.
	editingUser := self session currentUser copy.
	userManager := UserManager new
]

{ #category : 'rendering' }
EditUserForm >> renderContentOn: html [

	html div
		class: 'form-overlay';
		with: [
				html form
					class: 'edit-user-form';
					with: [
							html anchor
								class: 'close-button';
								callback: [ self close ];
								with: '×'.

							html heading
								level: 1;
								with: 'Редагування персональної інформації'.

							html div
								class: 'edit-username-block';
								with: [
										html label
											class: 'username-label';
											with: 'Ім''я користувача:'.

										html textInput
											class: 'username-input';
											on: #username of: self editingUser ].

							html div
								class: 'edit-email-block';
								with: [
										html label
											class: 'email-label';
											with: 'Електронна пошта:'.

										html textInput
											class: 'email-input';
											on: #email of: self editingUser ].

							html submitButton
								class: 'update-user-button';
								callback: [ self submit ];
								with: 'Зберегти' ] ]
]

{ #category : 'accessing' }
EditUserForm >> root [

	^ root
]

{ #category : 'accessing' }
EditUserForm >> root: anObject [

	root := anObject
]

{ #category : 'submit' }
EditUserForm >> submit [

	[
		| updatedUser |
		updatedUser := userManager updateUser: editingUser.
		self session currentUser: updatedUser.
		self close ]
		on: Error
		do: [ :result |
				| resultErrorList |
				resultErrorList := '-' split: result messageText.
				errorModal := ErrorModal new.
				errorModal root: self.
				errorModal errorList: resultErrorList ]
]

{ #category : 'updating' }
EditUserForm >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: StyleLibrary / #editUserFormCss
]
