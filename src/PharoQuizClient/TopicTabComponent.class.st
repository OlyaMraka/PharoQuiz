"
I am a Seaside component that acts as a topic selector within the test management interface, allowing users to choose a specific category before editing or adding test questions.

Responsibilities:

* Topic Selection: I provide the UI for selecting a specific topic that will own the test questions being edited.
* Navigation Flow: I facilitate the transition from a general topic list to the specific question management area for the chosen topic.
* Context Setting: I ensure the application knows which topic context is active during the test creation or modification process.

Collaborators:

* TestConfigComponent: I typically notify this component when a topic has been selected to trigger the loading of associated questions.
* Topic: I display a list of these domain objects to the user for selection.

Instance Variables:

* root: <WAComponent> A reference to the parent controller used to manage the overall navigation and state of the test configuration module.
* topic: <Topic> The specific topic object selected by the user to serve as the context for test editing.

Example:

```smalltalk
TopicTabComponent new 
    root: self; 
    topic: aTopic.
"
Class {
	#name : 'TopicTabComponent',
	#superclass : 'WAComponent',
	#instVars : [
		'root',
		'topic'
	],
	#category : 'PharoQuizClient',
	#package : 'PharoQuizClient'
}

{ #category : 'as yet unclassified' }
TopicTabComponent >> goToTopic [

	| testTaskConfigComponent testTaskManager testTasks |
	testTaskManager := TestTaskManager new.
	testTaskConfigComponent := TestTaskConfig new.
	testTasks := testTaskManager getAllByTopicId: self topic id.

	testTaskConfigComponent topic: self topic.
	testTaskConfigComponent root: self root root.
	testTaskConfigComponent testTaskList: testTasks.

	self root root mainContentInfo: testTaskConfigComponent
]

{ #category : 'rendering' }
TopicTabComponent >> renderContentOn: html [

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
TopicTabComponent >> root [

	^ root
]

{ #category : 'accessing' }
TopicTabComponent >> root: anObject [

	root := anObject
]

{ #category : 'accessing' }
TopicTabComponent >> topic [

	^ topic
]

{ #category : 'accessing' }
TopicTabComponent >> topic: anObject [

	topic := anObject
]

{ #category : 'updating' }
TopicTabComponent >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: StyleLibrary / #topicTabCss
]
