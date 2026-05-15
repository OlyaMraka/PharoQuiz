"
I am a specialized logic component designed to validate the integrity of TestTask data, ensuring that all questions, answers, and point values meet the system's business requirements before persistence.

**Responsibilities:**
* Perform comprehensive checks on task attributes, including the question content and point allocations.
* Validate the structure and validity of the answer list (e.g., ensuring a minimum number of answers exists).
* Verify that business rules, such as character limits and positive point values, are strictly followed.
* Provide granular validation methods to check specific fields or the task entity as a whole.

**Key Methods:**
* **#validateTestTask:answers:points:**: The primary entry point for a full validation sweep of all task components.
* **#checkTaskContent:**: Ensures the question text is not empty and meets length requirements.
* **#checkPoints:**: Validates that the assigned points are within an acceptable numerical range.
* **#checkAnswerList:**: Verifies the integrity and correctness of the collection of provided answers.

**Collaborators:**
* **TestTaskManager**: I am invoked by the manager to verify task data before any creation or update operations in the database.
* **BaseValidator**: I inherit core validation behaviors and result aggregation logic from this superclass.

**Example:**
```smalltalk
(TestTaskValidator new)
    checkTaskContent: 'What is 2+2?';
    checkPoints: 5;
    validateTestTask: aTaskInstance.
"
Class {
	#name : 'TestTaskValidator',
	#superclass : 'BaseValidator',
	#category : 'PharoQuizCore',
	#package : 'PharoQuizCore'
}

{ #category : 'fieldChecks' }
TestTaskValidator >> checkAnswerList: anAnswerList [

	(anAnswerList isNil or: [ anAnswerList isEmpty ]) ifTrue: [ errors add: QuizCoreConstants testTaskAnswerListEmptyMessage ]
]

{ #category : 'fieldChecks' }
TestTaskValidator >> checkAnswersLenght: anAnswerList [
	| invalidAnswers |
	invalidAnswers := OrderedCollection new.
	
	anAnswerList ifNotNil: [
		invalidAnswers addAll: (anAnswerList select: [ :answer | answer answerText size > 500 or: [ answer answerText size < 3 ] ]) ].
	
	invalidAnswers ifNotEmpty: [ errors addError: (QuizCoreConstants testTaskAnswerLengthMessage) ].
]

{ #category : 'fieldChecks' }
TestTaskValidator >> checkPoints: aPoints [

	aPoints < 0 ifTrue: [ errors add: QuizCoreConstants invalidTestTaskPoints ]
]

{ #category : 'fieldChecks' }
TestTaskValidator >> checkTaskContent: aTaskContent [

	(aTaskContent isNil or: [ aTaskContent size < 3 or: [ aTaskContent size > 500 ] ]) ifTrue: [
		errors add: QuizCoreConstants testTaskContentLengthError ]
]

{ #category : 'fieldChecks' }
TestTaskValidator >> validateTestTask: aTestTask [
	self checkTaskContent: aTestTask question.
	self checkAnswersLenght: aTestTask answerList.
	self checkPoints: aTestTask points.
	self checkAnswersLenght: aTestTask answerList.
	^ errors 
]

{ #category : 'fieldChecks' }
TestTaskValidator >> validateTestTask: aQuestion answers: anAnswerList points: aPoints [

	self checkTaskContent: aQuestion.
	self checkAnswersLenght: anAnswerList.
	self checkPoints: aPoints.
	self checkAnswerList: anAnswerList.
	^ errors
]
