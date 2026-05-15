"
Class: SaveTopicModal

I am a Seaside component that provides a modal interface for creating or updating topic entries within the PharoQuiz system.

Responsibilities:

• Present an input form for capturing a topic title and its detailed description.
• Manage the lifecycle of a topic entity during the creation process.
• Coordinate with the parent component to refresh the topic list upon successful submission.

Collaborators:

• TopicConfigComponent: I notify this parent component when a new topic is saved so the UI can stay synchronized.
• TopicManager: I use this service to persist topic data to the database via Glorp.

Instance Variables:

• root: <TopicConfigComponent> A reference to the parent component for state delegation.
• topicTitle: <String> Temporary storage for the title entered by the user.
• topicDescription: <String> Temporary storage for the description text.
• errorModal: <ErrorModal | nil> An optional child used to display validation errors during save.

Example:
html render: (SaveTopicModal new root: self).
"
Class {
	#name : 'SaveTopicModal',
	#superclass : 'WAComponent',
	#instVars : [
		'root',
		'topicTitle',
		'topicDescription',
		'errorModal'
	],
	#category : 'PharoQuizClient',
	#package : 'PharoQuizClient'
}

{ #category : 'initialization' }
SaveTopicModal >> close [ 
	root saveTopicModal: nil
]

{ #category : 'accessing' }
SaveTopicModal >> errorModal [

	^ errorModal
]

{ #category : 'accessing' }
SaveTopicModal >> errorModal: anObject [

	errorModal := anObject
]

{ #category : 'initialization' }
SaveTopicModal >> initialize [ 
	super initialize .
	topicTitle := ''.
	topicDescription := ''.
]

{ #category : 'rendering' }
SaveTopicModal >> renderContentOn: html [

	html div
		class: 'form-overlay';
		with: [
				html form
					class: 'save-topic-block';
					with: [
							html anchor
								class: 'close-button';
								callback: [ self close ];
								with: '×'.

							html div
								class: 'topic-input-block';
								with: [
										html label
											class: 'topic-label';
											with: 'Тема: '.

										html textInput
											class: 'topic-input';
											on: #topicTitle of: self ].

							html div
								class: 'description-input-block';
								with: [
										html label
											class: 'description-label';
											with: 'Опис до теми: '.

										html textArea 
											class: 'description-input';
											on: #topicDescription of: self ].

							html submitButton
								class: 'submit-topic-button';
								callback: [ self submit ];
								with: 'Зберегти' ] ].

	errorModal ifNotNil: [
			html div
				id: 'error-modal';
				with: [ html render: errorModal ] ]
]

{ #category : 'accessing' }
SaveTopicModal >> root [

	^ root
]

{ #category : 'accessing' }
SaveTopicModal >> root: anObject [

	root := anObject
]

{ #category : 'submit' }
SaveTopicModal >> submit [

	| topicManager newTopic |
	topicManager := TopicManager new.
	[ 
		newTopic := topicManager saveTopic: topicTitle description: topicDescription.
		root topicList: topicManager getAllTopics.
		self close
	 ] on: Error do: [ 
		:result |
				| resultErrorList |
				resultErrorList := '-' split: result messageText.
				errorModal := ErrorModal new.
				errorModal root: self.
				errorModal errorList: resultErrorList 
	 ]
]

{ #category : 'accessing' }
SaveTopicModal >> topicDescription [

	^ topicDescription
]

{ #category : 'accessing' }
SaveTopicModal >> topicDescription: anObject [

	topicDescription := anObject
]

{ #category : 'accessing' }
SaveTopicModal >> topicTitle [

	^ topicTitle
]

{ #category : 'accessing' }
SaveTopicModal >> topicTitle: anObject [

	topicTitle := anObject
]

{ #category : 'updating' }
SaveTopicModal >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: StyleLibrary / #saveTopicFormCss.
	anHtmlRoot stylesheet url: StyleLibrary / #errorModalCss
]
