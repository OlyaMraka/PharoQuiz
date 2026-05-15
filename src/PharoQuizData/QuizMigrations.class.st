"
DataBase Migrations Manager
"
Class {
	#name : 'QuizMigrations',
	#superclass : 'DescriptorSystem',
	#category : 'PharoQuizData',
	#package : 'PharoQuizData'
}

{ #category : 'migrations' }
QuizMigrations class >> apply: aSqlString [
    | conn commands |

    commands := aSqlString findTokens: ';'.
    
    conn := SQLite3Connection on: (Smalltalk imageDirectory / 'quiz_project.db') fullName.
    conn open.
        commands do: [ :sql | 
            | trimmedSql |
            trimmedSql := sql trimBoth.
            trimmedSql ifNotEmpty: [ 
                conn execute: trimmedSql.
                Transcript show: 'Виконано частину SQL...'; cr.
            ].
        ].
        Transcript show: 'Успіх! Всі таблиці створено.'; cr.
]

{ #category : 'migrations' }
QuizMigrations class >> m001_initialSchema [
	^ '
	CREATE TABLE IF NOT EXISTS USER (
		Id INTEGER PRIMARY KEY AUTOINCREMENT,
		Email VARCHAR(100),
		Username VARCHAR(50),
		PasswordHash VARCHAR(255),
		Role VARCHAR(20),
		CreatedOn TIMESTAMP
	);

	CREATE TABLE IF NOT EXISTS TOPIC (
		Id INTEGER PRIMARY KEY AUTOINCREMENT,
		Title VARCHAR(50),
		Description VARCHAR(255),
		CreatedOn TIMESTAMP
	);

	CREATE TABLE IF NOT EXISTS TEST_TASK (
		Id INTEGER PRIMARY KEY AUTOINCREMENT,
		TopicId INTEGER,
		Question VARCHAR(500),
		Difficulty INTEGER,
		Points INTEGER,
		CreatedOn TIMESTAMP,
		CONSTRAINT FK_TASK_TOPIC FOREIGN KEY (TopicId) REFERENCES TOPIC(Id)
	);

	CREATE TABLE IF NOT EXISTS TEST_ANSWER (
		Id INTEGER PRIMARY KEY AUTOINCREMENT,
		TestTaskId INTEGER,
		AnswerText VARCHAR(500),
		IsCorrect BOOLEAN,
		CreatedOn TIMESTAMP,
		CONSTRAINT FK_ANSWER_TASK FOREIGN KEY (TestTaskId) REFERENCES TEST_TASK(Id)
	);

	CREATE TABLE IF NOT EXISTS CODING_TASK (
		Id INTEGER PRIMARY KEY AUTOINCREMENT,
		TopicId INTEGER,
		TaskText VARCHAR(500),
		Difficulty INTEGER,
		Points INTEGER,
		CreatedOn TIMESTAMP,
		CONSTRAINT FK_CODING_TOPIC FOREIGN KEY (TopicId) REFERENCES TOPIC(Id)
	);'
]

{ #category : 'as yet unclassified' }
QuizMigrations class >> m002_addSoftDeleteColumns [
    ^ '
    ALTER TABLE USER ADD COLUMN Deleted INTEGER DEFAULT 0;
    ALTER TABLE USER ADD COLUMN DeletedAt TIMESTAMP;

    ALTER TABLE TOPIC ADD COLUMN Deleted INTEGER DEFAULT 0;
    ALTER TABLE TOPIC ADD COLUMN DeletedAt TIMESTAMP;

    ALTER TABLE TEST_TASK ADD COLUMN Deleted INTEGER DEFAULT 0;
    ALTER TABLE TEST_TASK ADD COLUMN DeletedAt TIMESTAMP;

    ALTER TABLE TEST_ANSWER ADD COLUMN Deleted INTEGER DEFAULT 0;
    ALTER TABLE TEST_ANSWER ADD COLUMN DeletedAt TIMESTAMP;

    ALTER TABLE CODING_TASK ADD COLUMN Deleted INTEGER DEFAULT 0;
    ALTER TABLE CODING_TASK ADD COLUMN DeletedAt TIMESTAMP;
    '
]

{ #category : 'as yet unclassified' }
QuizMigrations class >> m003_addEmailConfirmationFields [

	^ '
    ALTER TABLE USER ADD COLUMN EmailConfirmed INTEGER DEFAULT 0;
    ALTER TABLE USER ADD COLUMN ConfirmationToken TEXT;
    '
]
