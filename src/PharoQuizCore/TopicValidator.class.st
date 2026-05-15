"
I am a specialized logic component designed to validate the integrity of Topic data before it is persisted or processed by the application.

Responsibilities:
- Perform comprehensive checks on topic attributes such as title and description.
- Ensure that business rules (e.g., mandatory fields, character limits) are strictly followed.
- Aggregate validation results to provide clear feedback on which specific fields failed the check.

Collaborators:
- TopicManager: I am typically invoked by the manager to verify data before any database operations.

Example:

```smalltalk
(TopicValidator new)
    checkTitle: 'Pharo Basics';
    checkDescription: 'A beginner-friendly quiz about Pharo Smalltalk';
    validate: aTopicInstance.
"
Class {
	#name : 'TopicValidator',
	#superclass : 'BaseValidator',
	#category : 'PharoQuizCore',
	#package : 'PharoQuizCore'
}

{ #category : 'fieldChecks' }
TopicValidator >> checkDescription: aDescription [

	(aDescription isNil or: [ aDescription size < 3 or: [ aDescription size > 255 ] ]) ifTrue: [
		errors add: QuizCoreConstants topicDescriptionLengthMessage ]
]

{ #category : 'fieldChecks' }
TopicValidator >> checkTitle: aTitle [

	(aTitle isNil or: [ aTitle size < 3 or: [ aTitle size > 50 ] ]) ifTrue: [
		errors add: QuizCoreConstants topicTitleLengthMessage ]
]

{ #category : 'fieldChecks' }
TopicValidator >> validate: aTitle description: aDescription [

	self checkTitle: aTitle.
	self checkDescription: aDescription.

	^ errors
]
