# PharoQuiz

A web-based testing platform designed for knowledge assessment in the Pharo programming language. This project was developed as part of a course project to explore the capabilities of the Pharo ecosystem and the Seaside framework.

## Features

* **User Authentication:** Secure login and user session management.
* **Testing Engine:** Automated test delivery with support for multiple-choice questions.
* **Result Analysis:** Automatic scoring and instant feedback generation.
* **Admin Dashboard:** Full lifecycle management for study topics and test questions (CRUD operations).
* **Data Layer:** Persistent storage managed via SQLite and Glorp ORM.

## Tech Stack

* **Language & IDE:** Pharo (Smalltalk-based environment)
* **Web Framework:** Seaside
* **Database:** SQLite
* **ORM:** Glorp
* **Testing:** SUnit
* **Version Control:** Git & GitHub

## Project Structure

* **PharoQuizCore:** The central business logic, scoring, and user management.
* **PharoQuizClient:** Handles web interface components and user interactions.
* **PharoQuizData:** Persistence layer and ORM configurations.
* **PharoQuizModel:** Domain objects (User, Question, Answer, Test).
* **PharoQuizTests:** Unit tests for system stability.

## Running the Application
After loading the dependencies and the project code, start the Seaside server:


```smalltalk
WADevelopmentServer startOn: 8080.
```

You can then access the application at http://localhost:8080.
