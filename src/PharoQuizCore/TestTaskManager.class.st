"
I am a specialized component responsible for managing operations related to test tasks, including their creation, retrieval, and logical validation. I act as the primary coordinator for task-related business logic within the PharoQuiz system.

**Responsibilities:**
* Orchestrate the creation and saving of new test tasks along with their associated answers, points, and topic context.
* Manage the retrieval of tasks filtered by specific criteria, such as topic associations.
* Facilitate the update and deletion of existing tasks, ensuring all operations comply with system rules.
* Act as a bridge between the presentation layer (components) and the persistence layer (repositories).

**Key Methods:**
* **#saveTestTask:answers:points:topic:**: Orchestrates the complex process of creating a task entity and its relationships.
* **#updateTestTask:**: Handles the logic for modifying existing task data.
* **#deleteTestTask:**: Initiates the removal process (often a soft delete) for a specific task instance.
* **#getAllByTopicId:**: Retrieves a set of tasks associated with a specific topic context.

**Collaborators:**
* **TestTaskValidator**: I delegate input and data integrity checks to this component before committing changes to the database.
* **TestTaskRepository**: I rely on this component for the actual persistence and retrieval of task records.

**Instance Variables:**
* **testTaskRepository**: `<TestTaskRepository>` An instance responsible for data access and persistence of test task records.
* **testTaskValidator**: `<TestTaskValidator>` An instance used to verify task data consistency and business rule compliance.

**Example:**
```smalltalk
| manager |
manager := TestTaskManager new.
manager 
    saveTestTask: 'What is Smalltalk?' 
    answers: someAnswers 
    points: 5 
    topic: programmingTopic.
"
Class {
	#name : 'TestTaskManager',
	#superclass : 'Object',
	#instVars : [
		'testTaskRepository',
		'testTaskValidator'
	],
	#category : 'PharoQuizCore',
	#package : 'PharoQuizCore'
}

{ #category : 'as yet unclassified' }
TestTaskManager >> checkAnswers: topicId results: resultDictionary [

	| testList totalScore |
	testList := testTaskRepository getAllByTopicId: topicId.
	totalScore := 0.

	resultDictionary keysAndValuesDo: [ :taskId :userAnswers |
			| currentTask rightAnswerIds userAnswerIds |
			currentTask := testList detect: [ :task | task id = taskId ] ifNone: [ nil ].

			currentTask ifNotNil: [ "1. Витягуємо ID всіх правильних відповідей з бази (тут об'єкти, тому id потрібен)"
					rightAnswerIds := (currentTask answerList select: [ :answer | answer isCorrect = 1 ]) collect: [ :answer | answer id ].

					
					userAnswerIds := userAnswers. "3. Логіка перевірки залишається без змін"
					(userAnswerIds size = rightAnswerIds size and: [ userAnswerIds allSatisfy: [ :eachId | rightAnswerIds includes: eachId ] ])
						ifTrue: [ totalScore := totalScore + 1 ] ] ].

	^ totalScore
]

{ #category : 'operations' }
TestTaskManager >> checkAnswersss: topicId results: resultDictionary [

	| testList quizResult |
	testList := testTaskRepository getAllByTopicId: topicId. 
	
	quizResult := QuizResult new.
	quizResult points: 0.
	quizResult incorrectQuestions: OrderedCollection new. 

	resultDictionary keysAndValuesDo: [ :taskId :userAnswers |
		| currentTask rightAnswerIds userAnswerIds |
		currentTask := testList detect: [ :task | task id = taskId ] ifNone: [ nil ].

		currentTask ifNotNil: [
			| taskPoints |
			taskPoints := currentTask points ifNil: [ 1 ]. 

			rightAnswerIds := (currentTask answerList select: [ :answer | answer isCorrect = 1 ]) collect: [ :answer | answer id ].
			userAnswerIds := userAnswers. 
			
			userAnswerIds asSet = rightAnswerIds asSet
				ifTrue: [ quizResult points: quizResult points + taskPoints ]
				ifFalse: [
					| wrongClicks correctClicks userAnswersTexts rightAnswersTexts |

					wrongClicks := userAnswerIds select: [ :eachId | (rightAnswerIds includes: eachId) not ].
					correctClicks := userAnswerIds select: [ :eachId | rightAnswerIds includes: eachId ].
					
					"--- МАПИНГ ID В ТЕКСТИ ДЛЯ UI ---"
					"Витягуємо тексти відповідей, які вибрав користувач"
					userAnswersTexts := currentTask answerList 
						select: [ :answer | userAnswerIds includes: answer id ]
						thenCollect: [ :answer | answer answerText ]. "або як у тебе називається сетер тексту відповіді"

					"Витягуємо тексти правильних відповідей з бази"
					rightAnswersTexts := currentTask answerList 
						select: [ :answer | rightAnswerIds includes: answer id ]
						thenCollect: [ :answer | answer answerText ].
					"---------------------------------"

					wrongClicks isNotEmpty
						ifTrue: [
							quizResult incorrectQuestions add: (Dictionary new
								at: #task put: currentTask;
								at: #userAnswers put: userAnswersTexts;  "Тут тепер тексти!"
								at: #rightAnswers put: rightAnswersTexts; "І тут тексти!"
								yourself) ]
						ifFalse: [ 
							correctClicks isNotEmpty ifTrue: [
								| partialScore |
								partialScore := taskPoints / rightAnswerIds size * correctClicks size.
								quizResult points: quizResult points + partialScore ]. 
								
							quizResult incorrectQuestions add: (Dictionary new
								at: #task put: currentTask;
								at: #userAnswers put: userAnswersTexts;  "Тут тепер тексти!"
								at: #rightAnswers put: rightAnswersTexts; "І тут тексти!"
								yourself) ] ] ] ].

	^ quizResult
]

{ #category : 'operations' }
TestTaskManager >> deleteTestTask: aTestTask [
	testTaskRepository delete: aTestTask 
]

{ #category : 'operations' }
TestTaskManager >> getAllByTopicId: topicId [ 
	| result |
	result := testTaskRepository getAllByTopicId: topicId.
	^ result
]

{ #category : 'initialization' }
TestTaskManager >> initialize [ 
	super initialize .
	testTaskValidator := TestTaskValidator new.
	testTaskRepository := TestTaskRepository new.
]

{ #category : 'operations' }
TestTaskManager >> saveTestTask: aQuestion answers: anAnswerList points: aPoints topic: aTopic [

	| newTestTask validationErrors |
	validationErrors := testTaskValidator
		                    validateTestTask: aQuestion
		                    answers: anAnswerList
		                    points: aPoints.
		
	validationErrors ifNotEmpty: [ Error signal: ('-' join: validationErrors) ].

	newTestTask := TestTask new.

	anAnswerList do: [ :each | each testTask: newTestTask ].
	newTestTask topic: aTopic.
	newTestTask question: aQuestion.
	newTestTask answerList: anAnswerList.
	newTestTask points: aPoints.

	testTaskRepository save: newTestTask.

	^ newTestTask
]

{ #category : 'operations' }
TestTaskManager >> updateTestTask: aTestTask [

	| validationErrors |
	validationErrors := testTaskValidator validateTestTask: aTestTask question answers: aTestTask answerList points: aTestTask points.

	validationErrors ifNotEmpty: [ Error signal: ('-' join: validationErrors) ].

	testTaskRepository update: aTestTask.
	^ aTestTask
]
