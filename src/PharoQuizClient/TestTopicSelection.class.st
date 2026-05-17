"
I am a UI component that serves as the main catalog or dashboard for practice tests. I am dynamically rendered into the application's main content area when a user selects the ""Практичні завдання"" option from the sidebar.

### Responsibilities:

* **Topic Catalog Display:** I render a collection of available study topics (e.g., via `TopicCardComponent`), allowing users to browse through different subject areas.
* **Navigation Trigger:** I capture user interactions when a specific topic is selected and coordinate with the root component to transition the user into the test configuration or execution phase.
* **State Structuring:** I manage the immediate list of topics fetched from the backend, ensuring the view layer stays synchronized with available database records.

### Collaborators:

* **SidebarComponent:** I am instantiated or triggered by the sidebar navigations when the user requests the practice section.
* **TopicManager** I closely collaborate with backend services to fetch and hold the collection of available quiz topics.
* **TopicCardComponent:** I typically delegate the visual rendering of individual topic tiles to this sub-component for modular layout.

### Example:

```smalltalk
| topicSelection |
topicSelection := TestTopicSelection new.
topicSelection topicList: (TopicManager default getAllTopics).
topicSelection root: self.
currentView := topicSelection.
"
Class {
	#name : 'TestTopicSelection',
	#superclass : 'WAComponent',
	#instVars : [
		'root',
		'topicList'
	],
	#category : 'PharoQuizClient',
	#package : 'PharoQuizClient'
}

{ #category : 'hooks' }
TestTopicSelection >> children [

	| all |
	all := OrderedCollection new.
	topicList ifNotNil: [ all addAll: topicList ].
	^ all asArray
]

{ #category : 'rendering' }
TestTopicSelection >> renderContentOn: html [

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
TestTopicSelection >> root [

	^ root
]

{ #category : 'accessing' }
TestTopicSelection >> root: anObject [

	root := anObject
]

{ #category : 'accessing' }
TestTopicSelection >> topicList [

	^ topicList
]

{ #category : 'accessing' }
TestTopicSelection >> topicList: anObject [

	topicList := anObject collect: [ :each |
			             TopicCardComponent new
				             topic: each;
				             root: self ]
]

{ #category : 'updating' }
TestTopicSelection >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: StyleLibrary / #TopicCardCss.
	anHtmlRoot stylesheet url: StyleLibrary / #topicSelectionCss.	
	
]
