"
I am the root component of the PharoQuiz application, acting as the main controller and top-level container for the entire user interface.

Responsibilities:
- Manage the global state of the application, including the currently active content and authentication status.
- Orchestrate the rendering of major UI sections: the header and the main content area (Landing Page, Quizzes, or Auth forms).
- Handle the lifecycle of modal dialogues, such as the Sign-In and Sign-Up overlays.
- Act as the central communication hub for child components via the #root delegation pattern.

Collaborators:
- HeaderComponent: Displayed at the top of every page for navigation.
- LandingPage: The default content shown to users upon entry.
- SignUpForm / SignInForm: Authentication components managed as conditional overlays or main content.

Instance Variables:
- header: <HeaderComponent> The persistent top navigation bar.
- landingContent: <LandingPage> The initial view component.
- content: <SignUpForm | nil> Holds the registration modal instance when active, otherwise nil.
- signInModal: <SignInForm | nil> Holds the authentication modal instance when active, otherwise nil.

Example:
    QuizAppRoot registerAsApplication: 'quiz'.

"
Class {
	#name : 'QuizAppRoot',
	#superclass : 'WAComponent',
	#instVars : [
		'activeContent'
	],
	#category : 'PharoQuizClient',
	#package : 'PharoQuizClient'
}

{ #category : 'accessing' }
QuizAppRoot >> activeContent [

	^ activeContent
]

{ #category : 'accessing' }
QuizAppRoot >> activeContent: anObject [

	activeContent := anObject
]

{ #category : 'hooks' }
QuizAppRoot >> children [

	^ Array
		  with: activeContent 
]

{ #category : 'hooks' }
QuizAppRoot >> initialRequest: aRequest [

	| token userManager |
	super initialRequest: aRequest.
	userManager := UserManager new.
	token := aRequest fields at: 'token' ifAbsent: [ nil ].

	token ifNotNil: [ userManager confirmEmail: token ]
]

{ #category : 'initialization' }
QuizAppRoot >> initialize [

	super initialize.
	activeContent := HomePage new root: self.
]

{ #category : 'rendering' }
QuizAppRoot >> renderOn: html [

	html render: activeContent.
]

{ #category : 'operations' }
QuizAppRoot >> showDashboardFor [

	| userDashboard mainDashboardContent |
	userDashboard := UserDashboard new.
	mainDashboardContent := UserConfigComponent new root: userDashboard.
	userDashboard mainContentInfo: mainDashboardContent.

	activeContent := userDashboard
]

{ #category : 'updating' }
QuizAppRoot >> updateRoot: anHtmlRoot [
    super updateRoot: anHtmlRoot.
    anHtmlRoot javascript url: 'https://code.jquery.com/jquery-3.6.0.min.js'.
]
