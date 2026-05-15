"
I represent the main entry point and landing area of the PharoQuiz application.

Responsibilities:
- Serve as the primary visual container for users who have not yet started a quiz or logged in.
- Present introductory content, marketing information, or call-to-action elements to the user.
- Coordinate with the application's root component to manage high-level navigation and state.

Collaborators:
- QuizAppRoot: I interact with the root component to delegate actions like starting the quiz or switching to authentication forms.

Instance Variables:
- root: <WAComponent> A reference to the parent component (usually QuizAppRoot) used for communication and state delegation.

Example:
    LandingPage new root: self.
"
Class {
	#name : 'LandingPage',
	#superclass : 'WAComponent',
	#instVars : [
		'root'
	],
	#category : 'PharoQuizClient',
	#package : 'PharoQuizClient'
}

{ #category : 'rendering' }
LandingPage >> renderContentOn: html [

	html div
		class: 'landing-container';
		with: [
				html div
					class: 'hero-section';
					with: [
							html heading
								level: 1;
								class: 'landing-title';
								with: 'Pharooo-Quizzz'.
							html paragraph
								class: 'landing-subtitle';
								with: 'Твій шлях до опанування Smalltalk та Pharo починається тут. Перевіряй знання та покращуй навички на практиці.'.

							html anchor
								class: 'cta-button-large';
								callback: [ root signUpModal: (SignUpForm new root: root) ];
								with: 'РОЗПОЧАТИ ГРУ' ].

				html div
					class: 'features-grid';
					with: [
							html div
								class: 'feature-card';
								with: [
										html heading
											level: 3;
											with: 'Розумні тести'.
										html paragraph: 'Питання, що допоможуть закріпити теорію програмування.' ].

							html div
								class: 'feature-card';
								with: [
										html heading
											level: 3;
											with: 'Практичні завдання'.
										html paragraph: 'Реальні приклади для відпрацювання коду в екосистемі Pharo.' ].

							html div
								class: 'feature-card';
								with: [
										html heading
											level: 3;
											with: 'Показ прогресу'.
										html paragraph: 'Відстежуй свій рівень та власний ріст крок за кроком.' ] ] ]
]

{ #category : 'accessing' }
LandingPage >> root [ 
	^ root.
]

{ #category : 'accessing' }
LandingPage >> root: aRoot [
	root := aRoot 
]

{ #category : 'updating' }
LandingPage >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: StyleLibrary / #landingPageContentCss 
]
