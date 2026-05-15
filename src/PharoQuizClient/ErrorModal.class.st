"
I am a specialized Seaside component designed to provide visual feedback to the user when application errors or validation failures occur.

Responsibilities:
- Present a list of descriptive error messages in a modal overlay format.
- Offer a user-friendly way to dismiss error notifications and return to the previous application state.
- Synchronize with the parent component to reset error states upon closure.

Collaborators:
- SignUpForm / SignInForm: I am typically instantiated by these components when input validation fails or a database error occurs.
- StyleLibrary: My visual appearance (overlay, positioning, and colors) is defined within the CSS methods of the style library.

Instance Variables:
- root: <WAComponent> A reference to the parent component that owns this modal, allowing for state synchronization.
- errorList: <Collection of: String> A set of human-readable error messages to be displayed to the user.

Example:

```smalltalk
(ErrorModal new)
   root: self;
   errorList: #('Invalid email format' 'Password is too short');
   yourself.
"
Class {
	#name : 'ErrorModal',
	#superclass : 'WAComponent',
	#instVars : [
		'root',
		'errorList'
	],
	#category : 'PharoQuizClient',
	#package : 'PharoQuizClient'
}

{ #category : 'initialization' }
ErrorModal >> close [
	root errorModal: nil
]

{ #category : 'accessing' }
ErrorModal >> errorList [
	^ errorList 
]

{ #category : 'accessing' }
ErrorModal >> errorList: anErrorList [
	errorList := anErrorList 
]

{ #category : 'rendering' }
ErrorModal >> renderContentOn: html [

	html div
		class: 'form-overlay';
		with: [
				html form
					class: 'error-modal-block';
					with: [
							html heading
								level: 3;
								class: 'error-modal-title';
								with: 'Виникла помилка!'.

							html unorderedList
								class: 'error-list-block';
								with: [
										errorList do: [ :error |
													html listItem
														class: 'error-item';
														with: error ] ].

							html submitButton
								class: 'close-modal-button';
								callback: [ self close ];
								with: 'Зрозуміло....' ] ]
]

{ #category : 'accessing' }
ErrorModal >> root [
	^ root
]

{ #category : 'accessing' }
ErrorModal >> root: aRoot [
	root := aRoot 
]

{ #category : 'updating' }
ErrorModal >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: StyleLibrary / #errorModalCss 
]
