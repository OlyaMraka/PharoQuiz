"
I am a modular UI component designed to represent a single test topic as a visual card. I am typically instantiated and managed inside container views (like `TestTopicSelection`) to display individual subject options available to the user.

### Responsibilities:

* **Topic Data Rendering:** I handle the visual layout of a single topic, displaying its metadata such as the title, icons.
* **Interaction Handling:** I capture user click events on the card, transforming them into action triggers to signal that this specific topic has been selected for a practice run.
* **Component Encapsulation:** I isolate the cyberpunk neon card styles and layout logic, keeping the parent catalog view clean and decoupled from individual card styling rules.

### Collaborators:

* **TestTopicSelection:** I act as a sub-component or child view within the topic grid layout, receiving my specific data and root references from it.
* **Topic (Model):** I map and read data directly from a specific topic instance passed to me to dynamically populate the UI fields.

### Example:

```smalltalk
html div class: 'topics-grid'; with: [
    self topicList do: [ :eachTopic |
        html render: (TopicCardComponent new
            topic: eachTopic;
            root: self root) ] ]
"
Class {
	#name : 'TopicCardComponent',
	#superclass : 'WAComponent',
	#instVars : [
		'root',
		'topic'
	],
	#category : 'PharoQuizClient',
	#package : 'PharoQuizClient'
}

{ #category : 'operations' }
TopicCardComponent >> goToTopic [

	| testComponent testTaskManager testTasks |
	testTaskManager := TestTaskManager new.
	testComponent := TestComponent new.
	testTasks := testTaskManager getAllByTopicId: self topic id.

	testComponent topic: self topic.
	testComponent root: self root root.
	testComponent testTaskList: testTasks.

	self root root mainContentInfo: testComponent
]

{ #category : 'rendering' }
TopicCardComponent >> renderContentOn: html [

	html div
		class: 'topic-tab-block';
		with: [
				html heading
					level: 4;
					class: 'topic-title';
					with: topic title.

				html anchor
					class: 'pick-topic-button';
					callback: [ self goToTopic ]; 
					with: [ html html: '&#8594;' ] ]
]

{ #category : 'accessing' }
TopicCardComponent >> root [

	^ root
]

{ #category : 'accessing' }
TopicCardComponent >> root: anObject [

	root := anObject
]

{ #category : 'accessing' }
TopicCardComponent >> topic [

	^ topic
]

{ #category : 'accessing' }
TopicCardComponent >> topic: anObject [

	topic := anObject
]

{ #category : 'updating' }
TopicCardComponent >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: StyleLibrary / #TopicCardCss 
]
