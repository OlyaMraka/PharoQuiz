"
Descriptor System
"
Class {
	#name : 'QuizDescriptorSystem',
	#superclass : 'GlorpDescriptorSystemWithNamespaces',
	#category : 'PharoQuizData',
	#package : 'PharoQuizData'
}

{ #category : 'instance creation' }
QuizDescriptorSystem class >> allNonEmbeddedClasses [
	^ { User. Topic. TestTask. TestAnswer. CodingTask }
]

{ #category : 'instance creation' }
QuizDescriptorSystem class >> allTableNames [
	^ #('USER' 'TOPIC' 'TEST_TASK' 'TEST_ANSWER' 'CODING_TASK')
]

{ #category : 'instance creation' }
QuizDescriptorSystem class >> sessionForLogin: aLogin [
	| newSession system |
	newSession := GlorpSession new.
	system := self new.
	
	"1. Налаштовуємо систему"
	system platform: aLogin database.
	newSession system: system.
	system session: newSession.
	
	"2. Налаштовуємо доступ (замість login:)"
	newSession accessor: (DatabaseAccessor forLogin: aLogin).
	
	^ newSession
]

{ #category : 'descriptors' }
QuizDescriptorSystem >> classModelForCodingTask: aClassModel [

	aClassModel newAttributeNamed: #id.
	aClassModel newAttributeNamed: #topic.
	aClassModel newAttributeNamed: #taskText.
	aClassModel newAttributeNamed: #difficulty.
	aClassModel newAttributeNamed: #points.
	aClassModel newAttributeNamed: #createdOn.
	aClassModel newAttributeNamed: #deleted.
	aClassModel newAttributeNamed: #deletedAt
]

{ #category : 'descriptors' }
QuizDescriptorSystem >> classModelForTestAnswer: aClassModel [

	aClassModel newAttributeNamed: #id.
	aClassModel newAttributeNamed: #testTask.
	aClassModel newAttributeNamed: #answerText.
	aClassModel newAttributeNamed: #isCorrect.
	aClassModel newAttributeNamed: #createdOn.
	aClassModel newAttributeNamed: #deleted.
	aClassModel newAttributeNamed: #deletedAt
]

{ #category : 'descriptors' }
QuizDescriptorSystem >> classModelForTestTask: aClassModel [

	aClassModel newAttributeNamed: #id.
	aClassModel newAttributeNamed: #topic.
	aClassModel newAttributeNamed: #question.
	aClassModel newAttributeNamed: #difficulty.
	aClassModel newAttributeNamed: #points.
	aClassModel newAttributeNamed: #createdOn.
	aClassModel newAttributeNamed: #answerList.
	aClassModel newAttributeNamed: #deleted.
	aClassModel newAttributeNamed: #deletedAt
]

{ #category : 'descriptors' }
QuizDescriptorSystem >> classModelForTopic: aClassModel [

	aClassModel newAttributeNamed: #id.
	aClassModel newAttributeNamed: #title.
	aClassModel newAttributeNamed: #description.
	aClassModel newAttributeNamed: #createdOn.
	aClassModel newAttributeNamed: #deleted.
	aClassModel newAttributeNamed: #deletedAt
]

{ #category : 'descriptors' }
QuizDescriptorSystem >> classModelForUser: aClassModel [

	aClassModel newAttributeNamed: #id.
	aClassModel newAttributeNamed: #email.
	aClassModel newAttributeNamed: #username.
	aClassModel newAttributeNamed: #passwordHash.
	aClassModel newAttributeNamed: #role.
	aClassModel newAttributeNamed: #createdOn.
	aClassModel newAttributeNamed: #deleted.
	aClassModel newAttributeNamed: #deletedAt.
	aClassModel newAttributeNamed: #emailConfirmed .
	aClassModel newAttributeNamed: #confirmationToken
]

{ #category : 'tables' }
QuizDescriptorSystem >> defaultPlatform [

	^ SQLite3Platform new.
]

{ #category : 'descriptors' }
QuizDescriptorSystem >> descriptorForCodingTask: aDescriptor [

	| table topicTable |
	table := self tableNamed: 'CODING_TASK'.
	topicTable := self tableNamed: 'TOPIC'.
	aDescriptor table: table.

	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'Id').

	(aDescriptor newMapping: DirectMapping) from: #taskText to: (table fieldNamed: 'TaskText').

	(aDescriptor newMapping: DirectMapping) from: #difficulty to: (table fieldNamed: 'Difficulty').

	(aDescriptor newMapping: DirectMapping) from: #points to: (table fieldNamed: 'Points').

	(aDescriptor newMapping: DirectMapping) from: #createdOn to: (table fieldNamed: 'CreatedOn').
	
	(aDescriptor newMapping: DirectMapping) from: #deleted to: (table fieldNamed: 'Deleted').
	
	(aDescriptor newMapping: DirectMapping) from: #deletedAt to: (table fieldNamed: 'DeletedAt').

	(aDescriptor newMapping: OneToOneMapping)
		attributeName: #topic;
		referenceClass: Topic;
		join: (Join from: (table fieldNamed: 'TopicId') to: (topicTable fieldNamed: 'Id'))
]

{ #category : 'descriptors' }
QuizDescriptorSystem >> descriptorForTestAnswer: aDescriptor [

	| table testTable |
	table := self tableNamed: 'TEST_ANSWER'.
	testTable := self tableNamed: 'TEST_TASK'.
	aDescriptor table: table.

	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'Id').

	(aDescriptor newMapping: DirectMapping) from: #answerText to: (table fieldNamed: 'AnswerText').

	(aDescriptor newMapping: DirectMapping) from: #isCorrect to: (table fieldNamed: 'IsCorrect').

	(aDescriptor newMapping: DirectMapping) from: #createdOn to: (table fieldNamed: 'CreatedOn').
	
	(aDescriptor newMapping: DirectMapping) from: #deleted to: (table fieldNamed: 'Deleted').
	
	(aDescriptor newMapping: DirectMapping) from: #deletedAt to: (table fieldNamed: 'DeletedAt').

	(aDescriptor newMapping: OneToOneMapping)
		attributeName: #testTask;
		referenceClass: TestTask;
		join: (Join from: (table fieldNamed: 'TestTaskId') to: (testTable fieldNamed: 'Id'))
]

{ #category : 'descriptors' }
QuizDescriptorSystem >> descriptorForTestTask: aDescriptor [

	| table topicTable answerTable |
	table := self tableNamed: 'TEST_TASK'.
	topicTable := self tableNamed: 'TOPIC'.
	answerTable := self tableNamed: 'TEST_ANSWER'.
	aDescriptor table: table.

	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'Id').

	(aDescriptor newMapping: DirectMapping) from: #question to: (table fieldNamed: 'Question').

	(aDescriptor newMapping: DirectMapping) from: #difficulty to: (table fieldNamed: 'Difficulty').

	(aDescriptor newMapping: DirectMapping) from: #points to: (table fieldNamed: 'Points').

	(aDescriptor newMapping: DirectMapping) from: #createdOn to: (table fieldNamed: 'CreatedOn').
	
	(aDescriptor newMapping: DirectMapping) from: #deleted to: (table fieldNamed: 'Deleted').
	
	(aDescriptor newMapping: DirectMapping) from: #deletedAt to: (table fieldNamed: 'DeletedAt').

	(aDescriptor newMapping: OneToOneMapping)
		attributeName: #topic;
		referenceClass: Topic;
		join: (Join from: (table fieldNamed: 'TopicId') to: (topicTable fieldNamed: 'Id')).

	(aDescriptor newMapping: OneToManyMapping)
		attributeName: #answerList;
		referenceClass: TestAnswer;
		beExclusive;
		join: (Join from: (table fieldNamed: 'Id') to: (answerTable fieldNamed: 'TestTaskId'))
]

{ #category : 'descriptors' }
QuizDescriptorSystem >> descriptorForTopic: aDescriptor [

	| table |
	table := self tableNamed: 'TOPIC'.
	aDescriptor table: table.

	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'Id').

	(aDescriptor newMapping: DirectMapping) from: #title to: (table fieldNamed: 'Title').

	(aDescriptor newMapping: DirectMapping) from: #description to: (table fieldNamed: 'Description').

	(aDescriptor newMapping: DirectMapping) from: #createdOn to: (table fieldNamed: 'CreatedOn').
	
	(aDescriptor newMapping: DirectMapping) from: #deleted to: (table fieldNamed: 'Deleted').
	
	(aDescriptor newMapping: DirectMapping) from: #deletedAt to: (table fieldNamed: 'DeletedAt').
]

{ #category : 'descriptors' }
QuizDescriptorSystem >> descriptorForUser: aDescriptor [

	| table |
	table := self tableNamed: 'USER'.
	aDescriptor table: table.

	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'Id').

	(aDescriptor newMapping: DirectMapping) from: #email to: (table fieldNamed: 'Email').

	(aDescriptor newMapping: DirectMapping) from: #username to: (table fieldNamed: 'Username').

	(aDescriptor newMapping: DirectMapping) from: #passwordHash to: (table fieldNamed: 'PasswordHash').

	(aDescriptor newMapping: DirectMapping) from: #role to: (table fieldNamed: 'Role').

	(aDescriptor newMapping: DirectMapping) from: #createdOn to: (table fieldNamed: 'CreatedOn').

	(aDescriptor newMapping: DirectMapping) from: #deleted to: (table fieldNamed: 'Deleted').

	(aDescriptor newMapping: DirectMapping) from: #deletedAt to: (table fieldNamed: 'DeletedAt').
	
	(aDescriptor newMapping: DirectMapping) from: #emailConfirmed to: (table fieldNamed: 'EmailConfirmed').
	
	(aDescriptor newMapping: DirectMapping) from: #confirmationToken to: (table fieldNamed: 'ConfirmationToken')
]

{ #category : 'tables' }
QuizDescriptorSystem >> tableForCODING_TASK: aTable [

	| topicTable fk |
	(aTable createFieldNamed: 'Id' type: self platform integer) bePrimaryKey.
	aTable createFieldNamed: 'TopicId' type: self platform integer.
	aTable createFieldNamed: 'TaskText' type: (self platform varchar: 500).
	aTable createFieldNamed: 'Difficulty' type: self platform integer.
	aTable createFieldNamed: 'Points' type: self platform integer.
	aTable createFieldNamed: 'CreatedOn' type: self platform timestamp.
	aTable createFieldNamed: 'Deleted' type: self platform boolean.
	aTable createFieldNamed: 'DeletedAt' type: self platform timestamp.

	topicTable := self tableNamed: 'TOPIC'.
	fk := aTable addForeignKeyFrom: (aTable fieldNamed: 'TopicId') to: (topicTable fieldNamed: 'Id').
	fk name: 'FK_CODING_TOPIC'
]

{ #category : 'tables' }
QuizDescriptorSystem >> tableForTEST_ANSWER: aTable [

	| taskTable fk |
	(aTable createFieldNamed: 'Id' type: self platform serial) bePrimaryKey.
	aTable createFieldNamed: 'TestTaskId' type: self platform integer.
	aTable createFieldNamed: 'AnswerText' type: (self platform varchar: 500).
	aTable createFieldNamed: 'IsCorrect' type: self platform boolean.
	aTable createFieldNamed: 'CreatedOn' type: self platform timestamp.
	aTable createFieldNamed: 'Deleted' type: self platform boolean.
	aTable createFieldNamed: 'DeletedAt' type: self platform timestamp.

	taskTable := self tableNamed: 'TEST_TASK'.
	fk := aTable addForeignKeyFrom: (aTable fieldNamed: 'TestTaskId') to: (taskTable fieldNamed: 'Id').
	fk name: 'FK_ANSWER_TASK'
]

{ #category : 'tables' }
QuizDescriptorSystem >> tableForTEST_TASK: aTable [

	| topicTable fk |
	(aTable createFieldNamed: 'Id' type: self platform serial) bePrimaryKey.
	aTable createFieldNamed: 'TopicId' type: self platform integer.
	aTable createFieldNamed: 'Question' type: (self platform varchar: 500).
	aTable createFieldNamed: 'Difficulty' type: self platform integer.
	aTable createFieldNamed: 'Points' type: self platform integer.
	aTable createFieldNamed: 'CreatedOn' type: self platform timestamp.
	aTable createFieldNamed: 'Deleted' type: self platform boolean.
	aTable createFieldNamed: 'DeletedAt' type: self platform timestamp.

	topicTable := self tableNamed: 'TOPIC'.

	fk := aTable addForeignKeyFrom: (aTable fieldNamed: 'TopicId') to: (topicTable fieldNamed: 'Id').
	fk name: 'FK_TASK_TOPIC'
]

{ #category : 'tables' }
QuizDescriptorSystem >> tableForTOPIC: aTable [

	(aTable createFieldNamed: 'Id' type: self platform serial) bePrimaryKey.
	aTable createFieldNamed: 'Title' type: (self platform varchar: 50).
	aTable createFieldNamed: 'Description' type: (self platform varchar: 255).
	aTable createFieldNamed: 'CreatedOn' type: self platform timestamp.
	aTable createFieldNamed: 'Deleted' type: self platform boolean.
	aTable createFieldNamed: 'DeletedAt' type: self platform timestamp.
]

{ #category : 'tables' }
QuizDescriptorSystem >> tableForUSER: aTable [

	(aTable createFieldNamed: 'Id' type: self platform serial) bePrimaryKey.
	aTable createFieldNamed: 'Email' type: (self platform varchar: 100).
	aTable createFieldNamed: 'Username' type: (self platform varchar: 50).
	aTable createFieldNamed: 'PasswordHash' type: (self platform varchar: 255).
	aTable createFieldNamed: 'Role' type: (self platform varchar: 20).
	aTable createFieldNamed: 'CreatedOn' type: self platform timestamp.
	aTable createFieldNamed: 'Deleted' type: self platform boolean.
	aTable createFieldNamed: 'DeletedAt' type: self platform timestamp.
	aTable createFieldNamed: 'EmailConfirmed' type: self platform boolean.
	aTable createFieldNamed: 'ConfirmationToken' type: (self platform varchar: 255).
]
