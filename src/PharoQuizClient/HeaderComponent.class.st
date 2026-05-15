"
I am a Seaside component responsible for rendering the global header area of the PharoQuiz application.

Responsibilities:
- Provide navigation links or buttons for the main application actions (e.g., Login, Registration).
- Manage the visual consistency of the top navigation bar across different pages.
- Coordinate with the root component to trigger the display of authentication modals.

Collaborators:
- QuizAppRoot: I hold a reference to the root component through the #root slot to delegate navigation and state changes.

Instance Variables:
- root: <WAComponent> The parent or root component used for callbacks and state management.

Example:

```smalltalk
HeaderComponent new root: self.
"
Class {
	#name : 'HeaderComponent',
	#superclass : 'WAComponent',
	#instVars : [
		'root'
	],
	#category : 'PharoQuizClient',
	#package : 'PharoQuizClient'
}

{ #category : 'rendering' }
HeaderComponent >> renderContentOn: html [

	html div
		class: 'header';
		with: [
				html div class: 'header-glow-left'.

				html div class: 'scan-line'.

				html div class: 'particle'.
				html div class: 'particle'.
				html div class: 'particle'.

				html div
					class: 'header-logo';
					with: [
							html div
								class: 'logo-dots';
								with: [
										html span.
										html span.
										html span ].
							html heading
								level: 1;
								with: 'Pharooo-Quizzz' ].

				html div
					class: 'nav-wrapper';
					with: [
							html unorderedList
								class: 'nav-menu';
								with: [
										html listItem
											class: 'active';
											with: [
													html div class: 'nav-icon'.
													html text: 'Тестові завдання' ].
										html listItem with: 'Практичні завдання'.
										html listItem with: 'Про Pharo' ].

							html anchor
								class: 'cta-button';
								callback: [ self showRegistration ];
								with: 'Зареєструватися'.

							html anchor
								class: 'sign-in-button';
								callback: [ self showLogInModal ];
								with: 'Увійти' ] ]
]

{ #category : 'accessing' }
HeaderComponent >> root [
	^ root 
]

{ #category : 'accessing' }
HeaderComponent >> root: aRoot [
	root := aRoot
]

{ #category : 'updating' }
HeaderComponent >> showLogInModal [

	| signInForm |
	signInForm := SignInForm new.
	signInForm root: root.
	root signInModal: signInForm
]

{ #category : 'updating' }
HeaderComponent >> showRegistration [

	| signUpForm |
	signUpForm := SignUpForm new.
	signUpForm root: root.
	root signUpModal: signUpForm
]

{ #category : 'updating' }
HeaderComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: (StyleLibrary / #headerCss).
]
