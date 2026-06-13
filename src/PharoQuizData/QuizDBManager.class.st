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
| login session system accessor |

login := Login new.
login database: PostgreSQLPlatform new.
login host: 'localhost'.
login port: 5432.
login databaseName: 'PharoQuiz'.
login username: 'postgres'.
login password: '1'.

system := QuizDescriptorSystem new.
system platform: login database.  "🔥 ВАЖЛИВО"

session := GlorpSession new.

session system: system.
system session: session.

accessor := DatabaseAccessor forLogin: login.
session accessor: accessor.

session login.

^ session
]
