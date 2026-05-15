"
I am a Seaside component that serves as the main dashboard for managing and configuring quiz questions within the application.

Responsibilities:

* Dashboard Orchestration: I manage the high-level layout for the test configuration area, coordinating between topic selection and question editing.
* Data Lifecycle: I handle the retrieval and refreshing of the topic list from the database to ensure the UI reflects the current system state.
* Subcomponent Management: I initialize and control the lifecycle of child components, such as the topic tabs used for selection.

Collaborators:

* TopicTabComponent: I render these components to allow users to select a specific topic context.
* QuizAppRoot: I communicate with the root component to handle navigation within the admin dashboard.

Instance Variables:

* root: <WAComponent> A reference to the parent component used for state delegation and navigation control.
* topicList: <OrderedCollection> A cached collection of Topic domain objects retrieved for display in the configuration interface.

Example:

```smalltalk
TestConfigComponent new 
    root: self; 
    updateRoot.
"
Class {
	#name : 'TestConfigComponent',
	#superclass : 'WAComponent',
	#instVars : [
		'root',
		'topicList'
	],
	#category : 'PharoQuizClient',
	#package : 'PharoQuizClient'
}

{ #category : 'hooks' }
TestConfigComponent >> children [

	| all |
	all := OrderedCollection new.
	topicList ifNotNil: [ all addAll: topicList ].
	^ all asArray
]

{ #category : 'rendering' }
TestConfigComponent >> renderContentOn: html [

	html div
		class: 'chose-topic-block';
		with: [
				html heading
					level: 2;
					class: 'section-heading';
					with: 'Оберіть тему: '.

				html div
					class: 'topic-block';
					with: [
							topicList ifNotEmpty: [ html unorderedList with: [ topicList do: [ :topicItem | html render: topicItem ] ] ].

							topicList ifEmpty: [
										html paragraph
											class: 'not-found-message';
											with: 'У системі не знайдено тем!' ] ] ]
]

{ #category : 'accessing' }
TestConfigComponent >> root [

	^ root
]

{ #category : 'accessing' }
TestConfigComponent >> root: anObject [

	root := anObject
]

{ #category : 'accessing' }
TestConfigComponent >> topicList [

	^ topicList
]

{ #category : 'accessing' }
TestConfigComponent >> topicList: anObject [

	topicList := anObject collect: [ :each |
			             TopicTabComponent new
				             topic: each;
				             root: self ]
]

{ #category : 'updating' }
TestConfigComponent >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: StyleLibrary / #topicTabCss.
	anHtmlRoot stylesheet url: StyleLibrary / #choseTopicCss
]
