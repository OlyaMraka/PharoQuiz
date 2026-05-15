"
I am a Seaside component that provides a user interface for authenticating existing users into the PharoQuiz application.

Responsibilities:
- Render a secure login form containing fields for username and password credentials.
- Capture user input through specialized HTML input types (text and password).
- Facilitate the authentication process by communicating with the root component or a dedicated security manager.
- Handle the dismissal of the login interface through a closing mechanism.

Collaborators:
- QuizAppRoot: I utilize a reference to the root component to delegate successful login events and manage the visibility of this form as an overlay.

Instance Variables:
- root: <WAComponent> A reference to the parent component used for state delegation and closing the form.
- username: <String> Stores the user-provided identifier for authentication.
- password: <String> Stores the user-provided secret credential.

Example:

```smalltalk
html render: (SignInForm new root: self).

"
Class {
	#name : 'SignInForm',
	#superclass : 'WAComponent',
	#instVars : [
		'root',
		'username',
		'password',
		'errorModal'
	],
	#category : 'PharoQuizClient',
	#package : 'PharoQuizClient'
}

{ #category : 'hooks' }
SignInForm >> children [ 
	^ Array with: errorModal 
]

{ #category : 'initialization' }
SignInForm >> close [ 
	root signInModal: nil
]

{ #category : 'accessing' }
SignInForm >> errorModal: anErrorModal [
	errorModal := nil
]

{ #category : 'initialization' }
SignInForm >> initialize [ 
	super initialize .
	username := ''.
	password := ''.
	errorModal := nil.
]

{ #category : 'accessing' }
SignInForm >> password [
	^ password 
]

{ #category : 'accessing' }
SignInForm >> password: newPassword [
	password := newPassword 
]

{ #category : 'rendering' }
SignInForm >> renderContentOn: html [

	html div
		class: 'form-overlay';
		with: [
				html form
					class: 'sign-in-form-block';
					with: [
							html anchor
								class: 'close-button';
								callback: [ self close ];
								with: '×'.

							html heading
								level: 2;
								with: 'Вхід у систему'.

							html div
								class: 'info-input';
								with: [
										html label
											class: 'info-label';
											with: 'Введіть Ім''я користувача:'.

										html textInput
											class: 'info-input';
											on: #username of: self ].

							html div
								class: 'info-input';
								with: [
										html label
											class: 'info-label';
											with: 'Введіть пароль:'.

										html textInput
											class: 'info-input';
											on: #password of: self ].

							html submitButton
								class: 'submit-button';
								callback: [ self submit ];
								with: 'Увійти' ].

				errorModal ifNotNil: [
						html div
							id: 'error-modal';
							with: [ html render: errorModal ] ] ]
]

{ #category : 'accessing' }
SignInForm >> root [ 
	^ root
]

{ #category : 'accessing' }
SignInForm >> root: aRoot [
	root := aRoot 
]

{ #category : 'submit' }
SignInForm >> submit [

	| userManager authenticatedUser |
	userManager := UserManager new.

	[
		authenticatedUser := userManager signInUser: username password: password.
		self session currentUser: authenticatedUser.
		root root showDashboardFor.

		self answer ]
		on: Error
		do: [ :result |
				| resultErrorList |
				resultErrorList := '-' split: result messageText.
				errorModal := ErrorModal new.
				errorModal root: self.
				errorModal errorList: resultErrorList ]
]

{ #category : 'updating' }
SignInForm >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: StyleLibrary / #signInFormCss
]

{ #category : 'accessing' }
SignInForm >> username [
	^ username 
]

{ #category : 'accessing' }
SignInForm >> username: newUsername [
	username := newUsername 
]
