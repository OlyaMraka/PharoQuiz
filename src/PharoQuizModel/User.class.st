"
User entity
"
Class {
	#name : 'User',
	#superclass : 'Object',
	#instVars : [
		'id',
		'email',
		'username',
		'passwordHash',
		'role',
		'createdOn',
		'deleted',
		'deletedAt',
		'emailConfirmed',
		'confirmationToken'
	],
	#category : 'PharoQuizModel',
	#package : 'PharoQuizModel'
}

{ #category : 'accessing' }
User >> confirmationToken [

	^ confirmationToken
]

{ #category : 'accessing' }
User >> confirmationToken: anObject [

	confirmationToken := anObject
]

{ #category : 'accessing' }
User >> createdOn [
	^ createdOn 
]

{ #category : 'accessing' }
User >> createdOn: newCreatedOn [
	createdOn := newCreatedOn 
]

{ #category : 'accessing' }
User >> deleted [

	^ deleted
]

{ #category : 'accessing' }
User >> deleted: anObject [

	deleted := anObject
]

{ #category : 'accessing' }
User >> deletedAt [

	^ deletedAt
]

{ #category : 'accessing' }
User >> deletedAt: anObject [

	deletedAt := anObject
]

{ #category : 'accessing' }
User >> email [ 
	^ email 
]

{ #category : 'accessing' }
User >> email: newEmail [
	email := newEmail 
]

{ #category : 'accessing' }
User >> emailConfirmed [

	^ emailConfirmed
]

{ #category : 'accessing' }
User >> emailConfirmed: anObject [

	emailConfirmed := anObject
]

{ #category : 'accessing' }
User >> id [ 
	^ id
]

{ #category : 'accessing' }
User >> id: newId [ 
	id := newId 
]

{ #category : 'initialization' }
User >> initialize [
	super initialize.
	deleted := 0.
]

{ #category : 'testing' }
User >> isAdmin [
    ^ role = 'Admin'
]

{ #category : 'accessing' }
User >> passwordHash [ 
	^ passwordHash 
]

{ #category : 'accessing' }
User >> passwordHash: newPasswordHash [
	passwordHash  := newPasswordHash 
]

{ #category : 'accessing' }
User >> role [ 
	^ role
]

{ #category : 'accessing' }
User >> role: newRole [
	role := newRole 
]

{ #category : 'operations' }
User >> updateFrom: anotherUser [

	self username: anotherUser username.
	self email: anotherUser email.
	self emailConfirmed: anotherUser emailConfirmed  
]

{ #category : 'accessing' }
User >> username [ 
	^ username 
]

{ #category : 'accessing' }
User >> username: newUsername [
	username := newUsername 
]
