"
I am responsible for handling all outgoing email communications within the **PharoQuiz** system. I encapsulate the SMTP configuration and provide a high-level API for sending system notifications, such as registration confirmations.

### Responsibilities:

* **Email Dispatch:** I manage the connection to external SMTP servers (e.g., Brevo, Gmail) to deliver messages.
* **Template Rendering:** I construct HTML-formatted email bodies.
* **Credential Management:** I securely hold and utilize SMTP configuration data, including host, port, and authentication credentials.

### Collaborators:

* **UserManager / Registration Logic:** I am triggered by user-related services to send confirmation messages.

### Example:

```smalltalk

EmailService new 
    sendConfirmationTo: aUser.

emailService 
    sendEmailTo: 'user@example.com' 
    subject: 'Welcome' 
    body: '<h1>Hello!</h1>'.
"
Class {
	#name : 'EmailService',
	#superclass : 'Object',
	#instVars : [
		'smtpHost',
		'smtpPort',
		'username',
		'password',
		'fromEmail'
	],
	#category : 'PharoQuizCore',
	#package : 'PharoQuizCore'
}

{ #category : 'accessing' }
EmailService >> fromEmail [

	^ fromEmail
]

{ #category : 'accessing' }
EmailService >> fromEmail: anObject [

	fromEmail := anObject
]

{ #category : 'initialization' }
EmailService >> initialize [

	super initialize.
	smtpHost := 'smtp-relay.brevo.com'.
	smtpPort := 587.
	username := 'a8d898001@smtp-brevo.com'.
	fromEmail := 'mrakaolga@gmail.com'.
	password := 'xsmtpsib-407c49a4ab29913fc93c70d8e1925b2705f715524e0e4701519c8c6be2b1d2c4-ZNiRbXzwfZMVuygV'
]

{ #category : 'accessing' }
EmailService >> password [

	^ password
]

{ #category : 'accessing' }
EmailService >> password: anObject [

	password := anObject
]

{ #category : 'operations' }
EmailService >> sendConfirmationTo: aUser [

	| link body username |
	username := aUser username ifNil: [ 'user' ].

	link := String streamContents: [ :s |
			        s
				        nextPutAll: 'http://localhost:8080/pharo-quiz?token=';
				        nextPutAll: aUser confirmationToken asString ].

	body := String streamContents: [ :s |
			        s
				        nextPutAll: '<h2>Welcome to PharoQuiz!</h2>';
				        nextPutAll: '<p>Hello, ';
				        nextPutAll: username asString;
				        nextPutAll: '! To activate your account, click below:</p>';
				        nextPutAll: '<p><a href="';
				        nextPutAll: link;
				        nextPutAll:
					        '" style="background:#00d2ff;color:white;padding:10px 15px;text-decoration:none;border-radius:5px;display:inline-block;">';
				        nextPutAll: 'Confirm Email';
				        nextPutAll: '</a></p>';
				        nextPutAll: '<p>If this was not you, just ignore this email.</p>' ].

	[ self sendEmailTo: aUser email asString subject: 'Email confirmation - PharoQuiz' body: body ]
		on: Error
		do: [ :ex |
				Transcript
					show: '[EmailService] Помилка: ' , ex description;
					cr ]
]

{ #category : 'operations' }
EmailService >> sendEmailTo: recipient subject: aSubject body: aBody [

	| mailText client |

	mailText := String streamContents: [ :s | s nextPutAll: 'Subject: ' , aSubject; crlf.
			            								  s nextPutAll: 'From: ' , fromEmail; crlf.
			            								  s nextPutAll: 'To: ' , recipient; crlf.
			            								  s nextPutAll: 'Content-Type: text/html; charset=utf-8'; crlf.
			            								  s crlf.
			            								  s nextPutAll: aBody ].

	[ 
		client := SMTPClient openOnHost: (NetNameResolver addressForName: smtpHost) port: 587.

		[
			client user: username.
			client password: password.
			client login.
			client mailFrom: fromEmail to: { recipient } text: mailText ] ensure: [ client close ].

		Transcript
			show: '[EmailService] Лист успішно надіслано!';
			cr ]
		on: Error
		do: [ :ex |
				Transcript
					show: '[EmailService] Помилка: ' , ex description;
					cr.
				ex pass ]
]

{ #category : 'accessing' }
EmailService >> smtpHost [

	^ smtpHost
]

{ #category : 'accessing' }
EmailService >> smtpHost: anObject [

	smtpHost := anObject
]

{ #category : 'accessing' }
EmailService >> smtpPort [

	^ smtpPort
]

{ #category : 'accessing' }
EmailService >> smtpPort: anObject [

	smtpPort := anObject
]

{ #category : 'accessing' }
EmailService >> username [

	^ username
]

{ #category : 'accessing' }
EmailService >> username: anObject [

	username := anObject
]
