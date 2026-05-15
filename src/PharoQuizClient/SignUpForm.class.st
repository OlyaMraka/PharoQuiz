"
I am a Seaside component providing a comprehensive user interface for registering new accounts within the PharoQuiz system.

Responsibilities:
- Present an interactive registration form with fields for username, email, and password.
- Orchestrate the account creation process by coordinating with a UserManager service.
- Manage error states and display validation feedback through an integrated modal system.

Collaborators:
- QuizAppRoot: I utilize a root reference to communicate high-level state changes or to close the form overlay.
- ErrorModal: I instantiate and render this component to display specific registration failures to the user.

Instance Variables:
- root: <WAComponent> The parent orchestrator used for delegation and workflow control.
- username: <String> Stores the desired unique identifier for the new account.
- email: <String> Stores the email address.
- password: <String> Stores the chosen secret credential for the account.
- errorModal: <ErrorModal | nil> An optional child component used to display validation errors.

Example:

```smalltalk
html render: (SignUpForm new root: self).
"
Class {
	#name : 'SignUpForm',
	#superclass : 'WAComponent',
	#instVars : [
		'root',
		'username',
		'email',
		'password',
		'errorModal',
		'successModal'
	],
	#category : 'PharoQuizClient',
	#package : 'PharoQuizClient'
}

{ #category : 'accessing' }
SignUpForm >> children [

	^ Array with: errorModal with: successModal 
]

{ #category : 'initialization' }
SignUpForm >> close [

	root signUpModal: nil
]

{ #category : 'accessing' }
SignUpForm >> email [
	^ email 
]

{ #category : 'accessing' }
SignUpForm >> email: newEmail [
	email := newEmail 
]

{ #category : 'accessing' }
SignUpForm >> errorModal [

	^ errorModal
]

{ #category : 'accessing' }
SignUpForm >> errorModal: anErrorModal [
	errorModal := anErrorModal 
]

{ #category : 'initialization' }
SignUpForm >> initialize [

	super initialize.
	errorModal := nil.
	username := ''.
	email := ''.
	password := ''
]

{ #category : 'initialization' }
SignUpForm >> password [
	^ password.
]

{ #category : 'initialization' }
SignUpForm >> password: newPassword [
	password := newPassword.
]

{ #category : 'rendering' }
SignUpForm >> renderContentOn: html [

	html div
		id: #signUpContainer;
		class: 'form-overlay';
		with: [
				html form
					class: 'sign-up-form';
					with: [
							html anchor
								class: 'close-button';
								callback: [ self close ];
								with: '×'.

							html heading
								level: 2;
								with: 'Реєстрація'.

							html div
								class: 'input-block';
								with: [
										html label
											class: 'value-label';
											with: 'Введіть Ім''я користувача:'.

										html textInput
											class: 'value-input';
											on: #username of: self ].

							html div
								class: 'input-block';
								with: [
										html label
											class: 'value-label';
											with: 'Введіть електронну пошту:'.

										html textInput
											class: 'value-input';
											on: #email of: self ].

							html div
								class: 'input-block';
								with: [
										html label
											class: 'value-label';
											with: 'Введіть пароль:'.

										html passwordInput
											class: 'value-input';
											on: #password of: self ].

							html submitButton
								class: 'submit-button';
								callback: [ self submit ];
								with: 'Зареєструватися' ].

				errorModal ifNotNil: [
						html div
							id: 'error-modal';
							with: [ html render: errorModal ] ].
						
				successModal ifNotNil: [
						html div
							id: 'success-modal';
							with: [ html render: successModal ] ] ]
]

{ #category : 'accessing' }
SignUpForm >> root [
	^ root
]

{ #category : 'accessing' }
SignUpForm >> root: newRoot [
	root := newRoot 
]

{ #category : 'submit' }
SignUpForm >> submit [

	| userManager |
	userManager := UserManager new.
	[
		| authenticatedUser |
		authenticatedUser := userManager
			                     createUser: username
			                     email: email
			                     password: password
			                     role: 'User'.

		authenticatedUser ifNotNil: [
				| successWindow |
				successWindow := RegistrationSuccessModal new.
				successWindow userEmail: authenticatedUser email.
				successWindow root: self.
				successModal := successWindow ] ]
		on: Error
		do: [ :result |
				| resultErrorList |
				resultErrorList := '-' split: result messageText.
				errorModal := ErrorModal new.
				errorModal root: self.
				errorModal errorList: resultErrorList ]
]

{ #category : 'accessing' }
SignUpForm >> successModal [

	^ successModal
]

{ #category : 'accessing' }
SignUpForm >> successModal: anObject [

	successModal := anObject
]

{ #category : 'updating' }
SignUpForm >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: StyleLibrary / #signUpFormCss
]

{ #category : 'initialization' }
SignUpForm >> username [ 
	^ username.
]

{ #category : 'initialization' }
SignUpForm >> username: newUsername [
	username := newUsername.
]
