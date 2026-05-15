"
I am a specialized manager responsible for managing the lifecycle of quiz topics, including their creation, retrieval, modification, and removal.

Responsibilities:
- Facilitate the creation and saving of new topics with their respective descriptions.
- Coordinate the updating of existing topic information to maintain data relevance.
- Handle the removal of topics from the system through deletion operations.
- Provide a centralized interface for retrieving all available topics from the repository.
- Ensure that topic-related operations are validated before interacting with the data layer.

Collaborators:
- TopicValidator: I delegate data integrity and business rule checks to this component before saving or updating records.
- TopicRepository: I rely on this component for the persistent storage and low-level retrieval of topic data.
- TopicComponent: I provide the necessary backend logic and data access for topic-related interface components.

Instance Variables:
- topicRepository: <Object> An instance responsible for the persistence and collection of topic records.
- topicValidator: <TopicValidator> An instance used to verify the correctness of topic data before processing.

Example:

```smalltalk
topicManager := TopicManager new.
topicManager 
    saveTopic: 'Pharo Objects' 
    description: 'A topic covering the fundamentals of Smalltalk objects'.
allTopics := topicManager getAllTopics.
topicManager deleteTopic: aTopicInstance.
"
Class {
	#name : 'TopicManager',
	#superclass : 'Object',
	#instVars : [
		'topicRepository',
		'topicValidator'
	],
	#category : 'PharoQuizCore',
	#package : 'PharoQuizCore'
}

{ #category : 'operations' }
TopicManager >> deleteTopic: aTopic [
	topicRepository delete: aTopic 
]

{ #category : 'operations' }
TopicManager >> getAllTopics [ 
	^ topicRepository findAll 
]

{ #category : 'initialization' }
TopicManager >> initialize [

	topicRepository := TopicRepository new.
	topicValidator := TopicValidator new.
]

{ #category : 'operations' }
TopicManager >> saveTopic: aTitle description: aDescription [
	| newTopic validationErrors |
	newTopic := Topic new.

	validationErrors := topicValidator validate: aTitle description: aDescription.
	validationErrors ifNotEmpty: [ Error signal: ('-' join: validationErrors) ].
	
	newTopic title: aTitle.
	newTopic description: aDescription .
	newTopic createdOn: DateAndTime now.
	
	topicRepository save: newTopic .
	 
	^ newTopic .
	
	
	
	
]

{ #category : 'accessing' }
TopicManager >> topicRepository [

	^ topicRepository
]

{ #category : 'accessing' }
TopicManager >> topicRepository: anObject [

	topicRepository := anObject
]

{ #category : 'operations' }
TopicManager >> updateTopic: aTopic [

	topicRepository update: aTopic.
	^ aTopic
]
