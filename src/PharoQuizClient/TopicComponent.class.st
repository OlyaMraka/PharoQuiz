"
I am a Seaside component representing a single topic card within the configuration dashboard.

Responsibilities:
• Render the title and description for a specific quiz topic.
• Display administrative action icons (edit, delete) for the associated topic.

Collaborators:
• TopicConfigComponent: I am typically rendered as part of this component's list.

Instance Variables:
• root: <WAComponent> The parent controller used to delegate actions.
• topic: <Topic> The domain model object containing the topic's data.

Example:

```smalltalk
html render: (TopicComponent new topic: aTopic; root: self).
"
Class {
	#name : 'TopicComponent',
	#superclass : 'WAComponent',
	#instVars : [
		'root',
		'topic',
		'isEditing',
		'topicManager'
	],
	#category : 'PharoQuizClient',
	#package : 'PharoQuizClient'
}

{ #category : 'operations' }
TopicComponent >> deleteTopic [

	topicManager deleteTopic: topic.
	root topicList: topicManager getAllTopics
]

{ #category : 'initialization' }
TopicComponent >> initialize [

	super initialize.
	isEditing := false.
	topicManager := TopicManager new.
]

{ #category : 'accessing' }
TopicComponent >> isEditing [

	^ isEditing
]

{ #category : 'accessing' }
TopicComponent >> isEditing: anObject [

	isEditing := anObject
]

{ #category : 'rendering' }
TopicComponent >> renderContentOn: html [

	isEditing 
        ifTrue: [ self renderEditModeOn: html ]
        ifFalse: [ self renderViewModeOn: html ]
]

{ #category : 'rendering' }
TopicComponent >> renderEditModeOn: html [

	html form
		class: 'edit-topic-block';
		with: [
				html div
					class: 'edit-topic-header';
					with: [
							html textInput
								class: 'edit-title-input';
								on: #title of: self topic.
							html div
								class: 'edit-operations';
								with: [
										html submitButton 
											class: 'edit-save-button';
											callback: [ self saveChanges ];
											with: '✓'.
										html anchor
											class: 'edit-cancel-button';
											callback: [ isEditing := false ];
											with: [ html html: '&#215;' ] ] ].

				html textArea
					class: 'edit-decription-area';
					on: #description of: self topic ]
]

{ #category : 'rendering' }
TopicComponent >> renderViewModeOn: html [

	html div
		class: 'topic-block';
		with: [
				html div
					class: 'topic-header';
					with: [
							html heading
								level: 3;
								class: 'topic-title';
								with: topic title.

							html div
								class: 'topic-operations';
								with: [
										html anchor
											class: 'edit-button';
											callback: [ isEditing := true ];
											with: [ html html: '&#x270E;' ].

										html anchor
											class: 'edit-button';
											callback: [ self deleteTopic ];
											with: [ html html: '&#x1F5D1;' ] ] ].

				html paragraph
					class: 'title-description';
					with: topic description ]
]

{ #category : 'accessing' }
TopicComponent >> root [

	^ root
]

{ #category : 'accessing' }
TopicComponent >> root: anObject [

	root := anObject
]

{ #category : 'operations' }
TopicComponent >> saveChanges [

	topicManager updateTopic: self topic.
	isEditing := false
]

{ #category : 'accessing' }
TopicComponent >> topic [

	^ topic
]

{ #category : 'accessing' }
TopicComponent >> topic: anObject [

	topic := anObject
]

{ #category : 'accessing' }
TopicComponent >> topicManager [
    ^ topicManager ifNil: [ topicManager := TopicManager new ]
]

{ #category : 'updating' }
TopicComponent >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: StyleLibrary / #topicComponentCss
]
