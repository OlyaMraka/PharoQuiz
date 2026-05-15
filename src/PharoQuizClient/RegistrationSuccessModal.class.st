Class {
	#name : 'RegistrationSuccessModal',
	#superclass : 'WAComponent',
	#instVars : [
		'root',
		'userEmail'
	],
	#category : 'PharoQuizClient',
	#package : 'PharoQuizClient'
}

{ #category : 'initialization' }
RegistrationSuccessModal >> close [

	root successModal: nil.
	root close .
]

{ #category : 'rendering' }
RegistrationSuccessModal >> renderContentOn: html [

	html div
		class: 'form-overlay';
		with: [
				html form
					class: 'registration-success-block';
					with: [
							html heading
								level: 2;
								with: 'Реєстрація пройшла успішно!'.

							html paragraph: 'Щоб продовжити порібно підтвердити електронну адресу. Лист було надіслано на: ' , userEmail.

							html submitButton
								class: 'registration-success-button';
								callback: [ self close ];
								with: 'Зрозуміло' ] ]
]

{ #category : 'accessing' }
RegistrationSuccessModal >> root [

	^ root
]

{ #category : 'accessing' }
RegistrationSuccessModal >> root: anObject [

	root := anObject
]

{ #category : 'updating' }
RegistrationSuccessModal >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: StyleLibrary / #registrationSuccessCss
]

{ #category : 'accessing' }
RegistrationSuccessModal >> userEmail [

	^ userEmail
]

{ #category : 'accessing' }
RegistrationSuccessModal >> userEmail: anObject [

	userEmail := anObject
]
