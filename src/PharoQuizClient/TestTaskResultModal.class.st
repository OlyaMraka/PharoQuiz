Class {
	#name : 'TestTaskResultModal',
	#superclass : 'WAComponent',
	#instVars : [
		'root',
		'quizResult'
	],
	#category : 'PharoQuizClient',
	#package : 'PharoQuizClient'
}

{ #category : 'initialization' }
TestTaskResultModal >> close [ 
	root resultModal: nil.
]

{ #category : 'accessing' }
TestTaskResultModal >> quizResult [

	^ quizResult
]

{ #category : 'accessing' }
TestTaskResultModal >> quizResult: anObject [

	quizResult := anObject
]

{ #category : 'rendering' }
TestTaskResultModal >> renderContentOn: html [

	| displayPoints |
	displayPoints := (quizResult points asFloat roundTo: 0.1) printString.

	html div
		class: 'quiz-result-modal-backdrop';
		with: [
				html div
					class: 'quiz-result-modal';
					with: [
							html div
								class: 'modal-top-bar';
								with: [
										html heading
											level: 2;
											with: 'Результати тестування'.

										html anchor
											class: 'modal-close-cross';
											callback: [ self close ]; 
											with: [ html html: '&times;' ] ].
							html div
								class: 'score-badge';
								with: [
										html span
											class: 'score-label';
											with: 'Твій результат: '.
										html span
											class: 'score-value';
											with: displayPoints ].
							quizResult incorrectQuestions isEmpty
								ifTrue: [
										html div
											class: 'perfect-score-msg';
											with: 'Вітаємо! Жодної помилки. Ідеальний результат! 🎉' ]
								ifFalse: [
										html heading
											level: 3;
											with: 'Аналіз помилок та недоліків:'.

										html unorderedList
											class: 'wrong-questions-list';
											with: [
													quizResult incorrectQuestions do: [ :errorDict |
																| task userAnswers rightAnswers |
																task := errorDict at: #task.
																userAnswers := errorDict at: #userAnswers.
																rightAnswers := errorDict at: #rightAnswers.

																html listItem
																	class: 'wrong-question-item';
																	with: [ "Текст питання"
																			html div
																				class: 'question-title';
																				with: task question.
																			html div
																				class: 'user-answers-block';
																				with: [
																						html span
																							class: 'meta-label';
																							with: 'Ви обрали: '.
																						userAnswers isEmpty
																							ifTrue: [
																									html span
																										class: 'no-answer';
																										with: 'Нічого не обрано' ]
																							ifFalse: [
																									html span
																										class: 'bad-answer';
																										with: (userAnswers joinUsing: ', ') ] ].
																			html div
																				class: 'right-answers-block';
																				with: [
																						html span
																							class: 'meta-label';
																							with: 'Правильно: '.
																						html span
																							class: 'good-answer';
																							with: (rightAnswers joinUsing: ', ') ] ] ] ] ].
							html div
								class: 'modal-footer';
								with: [
										html anchor
											class: 'btn-close-modal';
											callback: [ self close ]; 
											with: 'Закрити' ] ] ]
]

{ #category : 'accessing' }
TestTaskResultModal >> root [

	^ root
]

{ #category : 'accessing' }
TestTaskResultModal >> root: anObject [

	root := anObject
]

{ #category : 'updating' }
TestTaskResultModal >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: StyleLibrary / #quizResultModalCss 
]
