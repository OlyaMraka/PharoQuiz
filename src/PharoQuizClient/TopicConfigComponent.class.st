"
I am a Seaside component that serves as the primary management interface for quiz topics. I display the list of available topics and provide tools for adding new ones.

Responsibilities:
• Present a structured view of all available topics by rendering individual TopicComponent instances.
• Provide a trigger for the ""Add New Topic"" workflow using the integrated modal system.
• Manage the conditional display logic based on whether the topic list is empty or not.

Collaborators:
• TopicComponent: I instantiate and render this component for each item in my topic list.
• UserDashboard: I am hosted within the main content area of the dashboard.

Instance Variables:
• root: <UserDashboard> Reference to the parent dashboard for state coordination.
• topicModal: <WAComponent | nil> Holds the active modal component for adding/editing topics.
• topicList: <OrderedCollection> The raw collection of topic data objects.

Example:

```smalltalk
html render: (TopicConfigComponent new topicList: someTopics; root: self).
"
Class {
	#name : 'TopicConfigComponent',
	#superclass : 'WAComponent',
	#instVars : [
		'root',
		'topicList',
		'saveTopicModal'
	],
	#category : 'PharoQuizClient',
	#package : 'PharoQuizClient'
}

{ #category : 'hooks' }
TopicConfigComponent >> children [
    | all |
    all := OrderedCollection new.
    saveTopicModal ifNotNil: [ all add: saveTopicModal ].
    topicList ifNotNil: [ all addAll: topicList ].
    ^ all asArray
]

{ #category : 'rendering' }
TopicConfigComponent >> renderContentOn: html [

	html div
		class: 'topic-config-block';
		with: [
				html div
					class: 'topic-config-header';
					with: [
							html heading
								class: 'section-title';
								with: 'Керування темами завдань'.

							html anchor
								class: 'add-topic-button';
								callback: [ self showSaveTopicModal ];
								with: 'Додати тему' ].
				topicList ifNotEmpty: [
						html unorderedList with: [
								topicList do: [ :topicItem |
										html render: topicItem ] ] ].

				topicList ifEmpty: [
						html paragraph
							class: 'not-found-message';
							with: 'У системі не знайдено тем!' ] ].

	saveTopicModal ifNotNil: [
			html div
				id: 'save-topic-modal';
				with: [ html render: saveTopicModal ] ]
]

{ #category : 'accessing' }
TopicConfigComponent >> root [

	^ root
]

{ #category : 'accessing' }
TopicConfigComponent >> root: anObject [

	root := anObject
]

{ #category : 'accessing' }
TopicConfigComponent >> saveTopicModal [

	^ saveTopicModal
]

{ #category : 'accessing' }
TopicConfigComponent >> saveTopicModal: anObject [

	saveTopicModal := anObject
]

{ #category : 'operations' }
TopicConfigComponent >> showSaveTopicModal [

	| topicModal |
	topicModal := SaveTopicModal new.
	topicModal root: self.
	saveTopicModal := topicModal
]

{ #category : 'accessing' }
TopicConfigComponent >> topicList [

	^ topicList
]

{ #category : 'accessing' }
TopicConfigComponent >> topicList: anObject [

        topicList := (anObject) collect: [ :each | 
            TopicComponent new 
                topic: each; 
                root: self ]
]

{ #category : 'updating' }
TopicConfigComponent >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: StyleLibrary / #topicConfigCss.
	anHtmlRoot stylesheet url: StyleLibrary / #topicComponentCss.
	anHtmlRoot stylesheet url: StyleLibrary / #editTopicCss.
]
