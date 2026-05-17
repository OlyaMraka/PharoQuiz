"
Sidebar component
"
Class {
	#name : 'SidebarComponent',
	#superclass : 'WAComponent',
	#instVars : [
		'root',
		'currentUser'
	],
	#category : 'PharoQuizClient',
	#package : 'PharoQuizClient'
}

{ #category : 'accessing' }
SidebarComponent >> currentUser [ 
	^ currentUser 
]

{ #category : 'accessing' }
SidebarComponent >> currentUser: aCurrentUser [
	currentUser := aCurrentUser 
]

{ #category : 'initialization' }
SidebarComponent >> initialize [

	super initialize.
	currentUser := self session currentUser
]

{ #category : 'operations' }
SidebarComponent >> onLogOutClick [

	currentUser := nil.
	self session unregister.
	self requestContext redirectTo: self application url
]

{ #category : 'operations' }
SidebarComponent >> onTestClick [

	| topicManager topicItems configComp |
	topicManager := TopicManager new.
	topicItems := topicManager getAllTopics.

	configComp := TestTopicSelection new.

	configComp topicList: topicItems.
	configComp root: root.

	root mainContentInfo: configComp
]

{ #category : 'operations' }
SidebarComponent >> onTestConfigurationClick [

	| topicManager topicItems configComp |
	topicManager := TopicManager new.
	topicItems := topicManager getAllTopics.

	configComp := TestConfigComponent new.

	configComp topicList: topicItems.
	configComp root: root.

	root mainContentInfo: configComp
]

{ #category : 'operations' }
SidebarComponent >> onTopicConfigurationClick [
    | topicManager topicItems configComp |
    
    topicManager := TopicManager new.
    topicItems := topicManager getAllTopics.
    
    configComp := TopicConfigComponent new.
    
    configComp topicList: topicItems.

    root mainContentInfo: configComp.
]

{ #category : 'rendering' }
SidebarComponent >> renderContentOn: html [

	html div
		class: 'sidebar-block';
		with: [
				html div
					class: 'user-info-block';
					with: [
							html heading
								level: 2;
								class: 'username-info';
								with: self session currentUser username.

							html heading
								level: 3;
								class: 'role-info';
								with: self session currentUser role.

							html paragraph
								class: 'email-info';
								with: self session currentUser email ].

				html div
					class: 'operations-menu';
					with: [
							html anchor
								class: 'operation-button';
								callback: [ self onTestClick ];
								with: 'Тестові завдання'.

							html anchor
								class: 'operation-button';
								with: 'Практичні завдання' ].

				currentUser isAdmin ifTrue: [
						html div
							class: 'admin-pannel';
							with: [
									html anchor
										callback: [ self onTopicConfigurationClick ];
										class: 'operation-button';
										with: 'Керування темами'.

									html anchor
										callback: [ self onTestConfigurationClick ];
										class: 'operation-button';
										with: 'Керування тестами' ] ].

				html anchor
					class: 'log-out-button';
					callback: [ self onLogOutClick ];
					with: 'Вийти...' ]
]

{ #category : 'accessing' }
SidebarComponent >> root [ 
	^ root
]

{ #category : 'accessing' }
SidebarComponent >> root: aRoot [ 
	root := aRoot 
]

{ #category : 'updating' }
SidebarComponent >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: StyleLibrary / #sidebarCss 
]
