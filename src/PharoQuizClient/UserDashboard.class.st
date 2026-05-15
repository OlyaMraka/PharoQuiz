"
UserDashBoard
"
Class {
	#name : 'UserDashboard',
	#superclass : 'WAComponent',
	#instVars : [
		'currentUser',
		'sidebarInfo',
		'mainContentInfo',
		'editUserForm'
	],
	#category : 'PharoQuizClient',
	#package : 'PharoQuizClient'
}

{ #category : 'hooks' }
UserDashboard >> children [

	^ Array with: sidebarInfo with: mainContentInfo with: editUserForm .
]

{ #category : 'accessing' }
UserDashboard >> currentUser [
	^ currentUser 
]

{ #category : 'accessing' }
UserDashboard >> currentUser: aUser [

	currentUser := aUser.
]

{ #category : 'accessing' }
UserDashboard >> editUserForm [

	^ editUserForm
]

{ #category : 'accessing' }
UserDashboard >> editUserForm: anObject [

	editUserForm := anObject
]

{ #category : 'initialization' }
UserDashboard >> initialize [

	super initialize.
	currentUser := self session currentUser.
	sidebarInfo := SidebarComponent new.
	sidebarInfo root: self
]

{ #category : 'accessing' }
UserDashboard >> mainContentInfo [

	^ mainContentInfo
]

{ #category : 'accessing' }
UserDashboard >> mainContentInfo: anObject [

	mainContentInfo := anObject
]

{ #category : 'rendering' }
UserDashboard >> renderContentOn: html [

	html div
		class: 'dashboard-main-container';
		with: [
				html render: sidebarInfo.

				html div
					class: 'content-area';
					with: [ html render: mainContentInfo ] ].
				
	editUserForm ifNotNil: [
			html div
				id: 'sign-in-modal';
				with: [ html render: editUserForm ]].
]

{ #category : 'operations' }
UserDashboard >> showEditUserForm [
	
	| editForm |
	editForm := EditUserForm new.
	editForm root: self.
	editUserForm := editForm .
]

{ #category : 'accessing' }
UserDashboard >> sidebarInfo [

	^ sidebarInfo 
]

{ #category : 'accessing' }
UserDashboard >> sidebarInfo: aSidebar [

	sidebarInfo := aSidebar
]

{ #category : 'updating' }
UserDashboard >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: StyleLibrary / #dashboardCss 
]
