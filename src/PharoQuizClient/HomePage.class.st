"
I represent the central dashboard and main navigation hub for the PharoQuiz application after the initial landing phase.

Responsibilities:

* Main Container: Act as the primary layout manager for the authenticated or main user experience.
* Component Coordination: Integrate and display key UI modules like the Header, Landing Content, and various Modals (Sign In, Sign Up).
* State Management: Maintain references to child components to ensure consistent rendering and interaction flows.

Collaborators:

* HeaderComponent: I delegate the rendering of the top navigation bar and user profile information.
* SignInForm / SignUpForm: I manage the visibility and lifecycle of authentication modals.
* QuizAppRoot: I communicate with the root component to handle top-level application state changes.

Instance Variables:

* root: `<WAComponent>` A reference to the parent component (typically QuizAppRoot) for state delegation.
* header: `<HeaderComponent>` The component responsible for the top navigation area.
* landingContent: `<WAComponent>` The dynamic content area displayed in the main section of the page.
* signUpModal / signInModal: `<WAComponent>` References to the modal components used for user authentication.

Example:

```smalltalk
HomePage new 
    root: self; 
    header: HeaderComponent new;
    yourself.
"
Class {
	#name : 'HomePage',
	#superclass : 'WAComponent',
	#instVars : [
		'root',
		'header',
		'landingContent',
		'signUpModal',
		'signInModal'
	],
	#category : 'PharoQuizClient',
	#package : 'PharoQuizClient'
}

{ #category : 'accessing' }
HomePage >> children [

	^ Array
		  with: header
		  with: landingContent
		  with: signUpModal 
		  with: signInModal
]

{ #category : 'accessing' }
HomePage >> header [

	^ header
]

{ #category : 'accessing' }
HomePage >> header: anObject [

	header := anObject
]

{ #category : 'initialization' }
HomePage >> initialize [

	super initialize.
	header := HeaderComponent new.
	landingContent := LandingPage new.
	header root: self.
	landingContent root: self
]

{ #category : 'accessing' }
HomePage >> landingContent [

	^ landingContent
]

{ #category : 'accessing' }
HomePage >> landingContent: anObject [

	landingContent := anObject
]

{ #category : 'rendering' }
HomePage >> renderContentOn: html [

	html render: header.

	html div
		id: 'main-content';
		with: [ html render: landingContent ].

	signUpModal ifNotNil: [
			html div
				id: 'sign-up-modal';
				with: [ html render: signUpModal ] ].

	signInModal ifNotNil: [
			html div
				id: 'sign-in-modal';
				with: [ html render: signInModal ] ]
]

{ #category : 'accessing' }
HomePage >> root [

	^ root
]

{ #category : 'accessing' }
HomePage >> root: anObject [

	root := anObject.
]

{ #category : 'accessing' }
HomePage >> signInModal [

	^ signInModal
]

{ #category : 'accessing' }
HomePage >> signInModal: anObject [

	signInModal := anObject
]

{ #category : 'accessing' }
HomePage >> signUpModal [

	^ signUpModal
]

{ #category : 'accessing' }
HomePage >> signUpModal: anObject [

	signUpModal := anObject
]
