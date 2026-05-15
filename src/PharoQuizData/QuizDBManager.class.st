"
Manager for sessions
"
Class {
	#name : 'QuizDBManager',
	#superclass : 'Object',
	#instVars : [
		'session'
	],
	#category : 'PharoQuizData',
	#package : 'PharoQuizData'
}

{ #category : 'accessing' }
QuizDBManager >> session [

	(session isNil or: [ session accessor isNil or: [ session accessor isLoggedIn not ] ]) ifTrue: [
			| login |
			login := Login new.
			login database: SQLite3Platform new.
			login databaseName: (Smalltalk imageDirectory / 'quiz_project.db') fullName.
			login host: ''.

			session := QuizDescriptorSystem sessionForLogin: login.
			session login ].
	^ session
]
