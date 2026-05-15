"
I am the central provider of static shared information and system-wide configuration for the **PharoQuiz** core. My primary role is to decouple hardcoded strings and validation constraints from the business logic, ensuring a single source of truth for the system's backend rules.

### Responsibilities:

* **Validation Constraints:** I define the specific rules for data integrity (e.g., minimum password length, required character sets, or task point limits).
* **Technical Error Messaging:** I provide standardized error messages specifically for validators and exceptions when business rules are violated.
* **System Configuration:** I store technical constants such as base URLs, SMTP settings, and other non-sensitive backend configurations.

### Collaborators:

* **Validators:** Classes like `UserValidator`, `TopicValidator`, and `TestTaskValidator` fetch my constraints to perform data integrity checks.
* **Managers:** Business logic handlers (e.g., `UserManager`) use me to signal specific errors during data processing.

### Example:

```smalltalk

QuizCoreConstants passwordRequirementSpecialSymbol. 
QuizCoreConstants testTaskContentLengthError.
"
Class {
	#name : 'QuizCoreConstants',
	#superclass : 'Object',
	#category : 'PharoQuizCore',
	#package : 'PharoQuizCore'
}

{ #category : 'UserManagerConstants' }
QuizCoreConstants class >> incorrectPassword [
	^ 'Неправильний пароль!'.
]

{ #category : 'UserValidatorConstants' }
QuizCoreConstants class >> invalidEmail [
	^ 'Некоректний формат електронної пошти!'.
]

{ #category : 'UserValidatorConstants' }
QuizCoreConstants class >> invalidPasswordLength [
	^ 'Пароль має бути не менше 8 символів'.
]

{ #category : 'UserValidatorConstants' }
QuizCoreConstants class >> invalidPasswordUppercaseMessage [
	^ 'Пароль має містити хоча б одну велику літеру'.
]

{ #category : 'TestTaskValidatorConstants' }
QuizCoreConstants class >> invalidTestTaskPoints [
	^ 'Кількість балів не повинна бути від''ємною'.
]

{ #category : 'UserValidatorConstants' }
QuizCoreConstants class >> passwordRequirementSpecialSymbol [
	^ 'Пароль має містити хоча б один спецсимвол (напр. !, @, #, $)'.
]

{ #category : 'TestTaskValidatorConstants' }
QuizCoreConstants class >> testTaskAnswerLengthMessage [ 
	^ 'Відповідь до тестового питання повинна містити від 3 до 500 символів'.
]

{ #category : 'TestTaskValidatorConstants' }
QuizCoreConstants class >> testTaskAnswerListEmptyMessage [
	^ 'Тестове завдання повинно мати хоча б одну відповідь!'.
]

{ #category : 'TestTaskValidatorConstants' }
QuizCoreConstants class >> testTaskContentLengthError [
	^ 'Тестове питання містити від 3 до 500 символів!'.
]

{ #category : 'TopicValidatorConstants' }
QuizCoreConstants class >> topicDescriptionLengthMessage [
	^ 'Опис теми має містити від 3 до 255 символів!'.
]

{ #category : 'TopicValidatorConstants' }
QuizCoreConstants class >> topicTitleLengthMessage [
	^ 'Назва теми має містити від 3 до 50 символів!'.
]

{ #category : 'UserManagerConstants' }
QuizCoreConstants class >> userAlreadyExistsByEmailErrorMessage: anEmail [
	^ 'Користувач з такою електронною поштою: ' , anEmail , ' уже існує!'.
]

{ #category : 'UserManagerConstants' }
QuizCoreConstants class >> userAlreadyExistsByUsernameErrorMessage: aUsername [
	^ 'Ім''я користувача: ' , aUsername , ' уже існує у системі, потрібно обрати інше!'
]

{ #category : 'UserManagerConstants' }
QuizCoreConstants class >> userDoesNotExistErrorMessage: aUsername [
	^ 'Користувача ' , aUsername , ' не існує в системі!'.
]

{ #category : 'UserValidatorConstants' }
QuizCoreConstants class >> usernameLengthMessage [
	^ 'Ім''я має містити від 3 до 50 символів!'.
]
