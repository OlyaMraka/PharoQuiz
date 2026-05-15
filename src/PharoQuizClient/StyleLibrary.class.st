"
I am a specialized file library responsible for managing and serving the CSS stylesheets for the PharoQuiz application.

Responsibilities:
- Centralize all visual styling logic by providing CSS methods for various application components.
- Serve CSS dynamically to the browser, ensuring a consistent look and feel across the platform.
- Modularize styles into specific methods to keep the codebase maintainable (e.g., separating header, landing page, and form styles).

Methods & Categories:
- #styles: Holds the main CSS definitions or coordinates the inclusion of individual style methods.
- #headerCss: Defines the styling for the top navigation bar.
- #signUpFormCss / #signInFormCss: Contains the visual layout for authentication overlays.
- #errorModalCss: Manages the appearance of error notifications.

Collaboration:
- I am typically utilized by the #updateRoot: method of the Root component or individual components to inject styles into the HTML <head> section.

Example:

```smalltalk
(anHtmlRoot stylesheet) url: (StyleLibrary / #mainCss).
"
Class {
	#name : 'StyleLibrary',
	#superclass : 'WAFileLibrary',
	#category : 'PharoQuizClient',
	#package : 'PharoQuizClient'
}

{ #category : 'styles' }
StyleLibrary >> answerInputCss [
	^ '
@import url("https://fonts.googleapis.com/css2?family=Outfit:wght@400;600;700;800&family=Lexend:wght@500;600&display=swap");

.answer-input-block-e {
    position: relative;
    background: rgba(21, 27, 38, 0.6);
    backdrop-filter: blur(10px);
    border: 1px solid var(--border);
    border-radius: 10px;
    padding: 12px;
    margin-bottom: 10px;
    transition: all 0.3s ease;
    overflow: hidden;
}

.answer-input-block-e::before {
    content: "";
    position: absolute;
    left: 0;
    top: 0;
    bottom: 0;
    width: 0;
    background: linear-gradient(180deg, var(--emerald), var(--cyan));
    transition: width 0.3s ease;
    box-shadow: 0 0 8px var(--emerald);
}

.answer-input-block-e:focus-within {
    border-color: rgba(16, 185, 129, 0.5);
    box-shadow: 0 2px 12px rgba(16, 185, 129, 0.15);
}

.answer-input-block-e:focus-within::before {
    width: 3px;
}

.answer-text-input-e {
    display: flex;
    flex-direction: column;
    gap: 10px;
    position: relative;
    z-index: 10;
}

.answer-text-area-e {
    font-family: "Lexend", sans-serif;
    font-size: 0.9rem;
    color: var(--text);
    width: 100%;
    min-height: 60px;
    padding: 10px 12px;
    background: rgba(255, 255, 255, 0.03);
    border: 1px solid var(--border);
    border-radius: 8px;
    outline: none;
    transition: all 0.3s ease;
    box-sizing: border-box;
    resize: vertical;
    line-height: 1.4;
}

.answer-text-area-e::placeholder {
    color: var(--text-dim);
    opacity: 0.5;
}

.answer-text-area-e:hover {
    background: rgba(255, 255, 255, 0.05);
    border-color: rgba(16, 185, 129, 0.3);
}

.answer-text-area-e:focus {
    background: rgba(255, 255, 255, 0.06);
    border-color: var(--emerald);
    box-shadow: 
        0 0 0 3px rgba(16, 185, 129, 0.1),
        0 0 15px rgba(16, 185, 129, 0.15);
}

.is-correct-block-e {
    display: flex;
    align-items: center;
    gap: 8px;
    padding: 8px 12px;
    background: rgba(255, 255, 255, 0.02);
    border: 1px solid var(--border);
    border-radius: 6px;
    transition: all 0.3s ease;
}

.is-correct-block-e:hover {
    background: rgba(255, 255, 255, 0.04);
    border-color: rgba(16, 185, 129, 0.2);
}

.is-correct-label-e {
    font-family: "Lexend", sans-serif;
    font-size: 0.85rem;
    font-weight: 500;
    color: var(--text-dim);
    margin: 0;
    cursor: pointer;
    user-select: none;
}

.is-correct-checkbox-e {
    width: 18px;
    height: 18px;
    cursor: pointer;
    appearance: none;
    background: rgba(255, 255, 255, 0.03);
    border: 2px solid var(--border);
    border-radius: 4px;
    position: relative;
    transition: all 0.3s ease;
    flex-shrink: 0;
}

.is-correct-checkbox-e:hover {
    border-color: var(--emerald);
    background: rgba(16, 185, 129, 0.05);
}

.is-correct-checkbox-e:checked {
    background: linear-gradient(135deg, var(--emerald), var(--cyan));
    border-color: var(--emerald);
    box-shadow: 0 0 10px rgba(16, 185, 129, 0.4);
}

.is-correct-checkbox-e:checked::before {
    content: "✓";
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: var(--dark);
    font-size: 12px;
    font-weight: 700;
}

.is-correct-checkbox-e:focus {
    outline: none;
    box-shadow: 0 0 0 3px rgba(16, 185, 129, 0.2);
}

.edit-operations {
    display: flex;
    gap: 6px;
    justify-content: flex-end;
    margin-top: 2px;
}

.edit-save-button,
.edit-cancel-button {
    width: 32px;
    height: 32px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 6px;
    color: var(--text-dim);
    text-decoration: none;
    font-size: 1.1rem;
    cursor: pointer;
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
    flex-shrink: 0;
    border: none;
}

.edit-save-button {
    background: rgba(16, 185, 129, 0.1);
    border: 1px solid var(--emerald);
}

.edit-save-button::before {
    content: "";
    position: absolute;
    inset: 0;
    background: linear-gradient(135deg, rgba(16, 185, 129, 0.2), rgba(6, 182, 212, 0.2));
    opacity: 0;
    transition: opacity 0.3s ease;
}

.edit-save-button:hover {
    color: var(--emerald);
    border-color: var(--mint);
    background: rgba(16, 185, 129, 0.15);
    transform: scale(1.1);
    box-shadow: 0 2px 8px rgba(16, 185, 129, 0.3);
}

.edit-save-button:hover::before {
    opacity: 1;
}

.edit-cancel-button {
    background: rgba(239, 68, 68, 0.1);
    border: 1px solid rgba(239, 68, 68, 0.3);
}

.edit-cancel-button::before {
    content: "";
    position: absolute;
    inset: 0;
    background: linear-gradient(135deg, rgba(239, 68, 68, 0.2), rgba(248, 113, 113, 0.2));
    opacity: 0;
    transition: opacity 0.3s ease;
}

.edit-cancel-button:hover {
    color: var(--error-red);
    border-color: var(--error-red);
    background: rgba(239, 68, 68, 0.15);
    transform: scale(1.1);
    box-shadow: 0 2px 8px rgba(239, 68, 68, 0.3);
}

.edit-cancel-button:hover::before {
    opacity: 1;
}

.edit-save-button:active,
.edit-cancel-button:active {
    transform: scale(0.95);
}

@media (max-width: 640px) {
    .answer-input-block-e {
        padding: 10px;
    }
    
    .answer-text-area-e {
        min-height: 55px;
        padding: 8px 10px;
        font-size: 0.85rem;
    }
    
    .is-correct-label-e {
        font-size: 0.8rem;
    }
    
    .edit-save-button,
    .edit-cancel-button {
        width: 28px;
        height: 28px;
        font-size: 1rem;
    }
}
'
]

{ #category : 'styles' }
StyleLibrary >> answerViewCss [
	^ '
@import url("https://fonts.googleapis.com/css2?family=Outfit:wght@400;600;700;800&family=Lexend:wght@500;600&display=swap");

.answer-input-block-v {
    position: relative;
    background: rgba(21, 27, 38, 0.4);
    backdrop-filter: blur(10px);
    border: 1px solid var(--border);
    border-radius: 10px;
    padding: 12px 14px;
    margin-bottom: 10px;
    transition: all 0.3s ease;
    overflow: hidden;
}

.answer-input-block-v::before {
    content: "";
    position: absolute;
    left: 0;
    top: 0;
    bottom: 0;
    width: 0;
    background: linear-gradient(180deg, var(--emerald), var(--cyan));
    transition: all 0.3s ease;
    box-shadow: 0 0 8px var(--emerald);
}

.answer-input-block-v:hover {
    background: rgba(21, 27, 38, 0.6);
    border-color: rgba(16, 185, 129, 0.3);
    transform: translateX(4px);
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
}

.answer-input-block-v:hover::before {
    width: 3px;
}

.answer-text-input-v {
    display: flex;
    flex-direction: column;
    gap: 8px;
}

.answer-text-v {
    font-family: "Lexend", sans-serif;
    font-size: 0.9rem;
    font-weight: 500;
    color: var(--text);
    margin: 0;
    line-height: 1.5;
    padding-left: 14px;
    position: relative;
}

.answer-text-v::before {
    content: "•";
    position: absolute;
    left: 0;
    top: -1px;
    color: var(--emerald);
    font-size: 1.1rem;
    opacity: 0.7;
}

.is-correct-block-v {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 5px 10px;
    background: rgba(255, 255, 255, 0.02);
    border: 1px solid rgba(31, 41, 55, 0.6);
    border-radius: 6px;
    transition: all 0.3s ease;
    align-self: flex-start;
}

.is-correct-label-v {
    font-family: "Lexend", sans-serif;
    font-size: 0.8rem;
    font-weight: 500;
    color: var(--text-dim);
    margin: 0;
    user-select: none;
    white-space: nowrap;
}

.is-correct-checkbox-v {
    width: 16px;
    height: 16px;
    appearance: none;
    background: rgba(255, 255, 255, 0.04);
    border: 2px solid var(--border);
    border-radius: 4px;
    position: relative;
    transition: all 0.3s ease;
    flex-shrink: 0;
    cursor: not-allowed;
    margin: 0;
    order: -1;
}

.is-correct-checkbox-v:checked {
    background: linear-gradient(135deg, var(--emerald), var(--cyan));
    border-color: var(--emerald);
    box-shadow: 0 0 10px rgba(16, 185, 129, 0.4);
}

.is-correct-checkbox-v:checked::before {
    content: "✓";
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: var(--dark);
    font-size: 11px;
    font-weight: 700;
}

.answer-operations {
    display: flex;
    gap: 6px;
    justify-content: flex-end;
    margin-top: 6px;
}

.answer-operations .edit-button {
    width: 30px;
    height: 30px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: rgba(255, 255, 255, 0.03);
    border: 1px solid var(--border);
    border-radius: 7px;
    color: var(--text-dim);
    text-decoration: none;
    font-size: 1rem;
    cursor: pointer;
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
}

.answer-operations .edit-button::before {
    content: "";
    position: absolute;
    inset: 0;
    background: linear-gradient(135deg, rgba(16, 185, 129, 0.15), rgba(6, 182, 212, 0.15));
    opacity: 0;
    transition: opacity 0.3s ease;
}

.answer-operations .edit-button:hover {
    color: var(--emerald);
    border-color: var(--emerald);
    background: rgba(16, 185, 129, 0.1);
    transform: scale(1.08);
    box-shadow: 0 2px 10px rgba(16, 185, 129, 0.3);
}

.answer-operations .edit-button:hover::before {
    opacity: 1;
}

.answer-operations .edit-button:nth-child(2) {
    border-color: rgba(239, 68, 68, 0.3);
}

.answer-operations .edit-button:nth-child(2):hover {
    color: var(--error-red);
    border-color: var(--error-red);
    background: rgba(239, 68, 68, 0.1);
    box-shadow: 0 2px 10px rgba(239, 68, 68, 0.3);
}

.answer-operations .edit-button:nth-child(2)::before {
    background: linear-gradient(135deg, rgba(239, 68, 68, 0.15), rgba(248, 113, 113, 0.15));
}

.answer-operations .edit-button:active {
    transform: scale(0.95);
}

/* Correct answer highlight */
.answer-input-block-v.correct {
    border-color: rgba(16, 185, 129, 0.5);
    background: rgba(16, 185, 129, 0.08);
    box-shadow: 0 0 0 1px rgba(16, 185, 129, 0.2);
}

.answer-input-block-v.correct::before {
    width: 3px;
    background: linear-gradient(180deg, var(--emerald), var(--cyan));
    box-shadow: 0 0 12px rgba(16, 185, 129, 0.6);
}

.answer-input-block-v.correct .answer-text-v {
    color: var(--mint);
    font-weight: 600;
}

.answer-input-block-v.correct .answer-text-v::before {
    content: "✓";
    color: var(--emerald);
    opacity: 1;
    font-weight: 700;
    font-size: 1.2rem;
}

.answer-input-block-v.correct:hover {
    border-color: rgba(16, 185, 129, 0.6);
    background: rgba(16, 185, 129, 0.12);
    box-shadow: 0 2px 12px rgba(16, 185, 129, 0.25);
}

@media (max-width: 640px) {
    .answer-input-block-v {
        padding: 10px 12px;
    }
    
    .answer-text-v {
        font-size: 0.85rem;
        padding-left: 12px;
    }
    
    .is-correct-label-v {
        font-size: 0.75rem;
    }
    
    .answer-operations .edit-button {
        width: 28px;
        height: 28px;
        font-size: 0.95rem;
    }
}
'
]

{ #category : 'styles' }
StyleLibrary >> choseTopicCss [
	^ '
@import url("https://fonts.googleapis.com/css2?family=Outfit:wght@400;600;700;800&family=Lexend:wght@500;600&display=swap");

.chose-topic-block {
    position: fixed;
    left: 280px;
    top: 0;
    right: 0;
    bottom: 0;
    background: var(--darker);
    padding: 30px;
    box-sizing: border-box;
    overflow-y: auto;
}

.chose-topic-block::-webkit-scrollbar {
    width: 6px;
}

.chose-topic-block::-webkit-scrollbar-track {
    background: var(--darker);
}

.chose-topic-block::-webkit-scrollbar-thumb {
    background: var(--emerald);
    border-radius: 3px;
}

.chose-topic-block::-webkit-scrollbar-thumb:hover {
    background: var(--mint);
}

.section-heading {
    font-family: "Outfit", sans-serif;
    font-size: 2rem;
    font-weight: 800;
    color: var(--text);
    margin: 0 0 30px 0;
    position: relative;
    padding-left: 20px;
    padding-bottom: 20px;
    border-bottom: 1px solid var(--border);
}

.section-heading::before {
    content: "▸";
    position: absolute;
    left: 0;
    color: var(--emerald);
    font-size: 1.8rem;
    animation: heading-pulse 2s ease-in-out infinite;
    filter: drop-shadow(0 0 8px var(--emerald));
}

@keyframes heading-pulse {
    0%, 100% { opacity: 1; transform: translateX(0); }
    50% { opacity: 0.7; transform: translateX(4px); }
}

.section-heading::after {
    content: "";
    position: absolute;
    bottom: -1px;
    left: 0;
    width: 100px;
    height: 2px;
    background: linear-gradient(90deg, var(--emerald), transparent);
    box-shadow: 0 0 10px var(--emerald);
    animation: line-expand 3s ease-in-out infinite;
}

@keyframes line-expand {
    0%, 100% { width: 100px; opacity: 0.6; }
    50% { width: 200px; opacity: 1; }
}

.topic-block {
    position: relative;
}

.topic-block::before {
    content: "";
    position: absolute;
    top: -30px;
    right: 10%;
    width: 400px;
    height: 400px;
    background: radial-gradient(circle, rgba(16, 185, 129, 0.06), transparent 70%);
    pointer-events: none;
    animation: block-pulse 5s ease-in-out infinite;
}

@keyframes block-pulse {
    0%, 100% { opacity: 0.4; transform: scale(1); }
    50% { opacity: 0.7; transform: scale(1.1); }
}

.topic-block ul {
    list-style: none;
    padding: 0;
    margin: 0;
    display: flex;
    flex-direction: column;
    gap: 12px;
}

.not-found-message {
    text-align: center;
    padding: 80px 40px;
    margin: 60px auto;
    max-width: 500px;
    color: var(--text-dim);
    font-family: "Lexend", sans-serif;
    font-size: 1.2rem;
    font-weight: 500;
    background: rgba(255, 255, 255, 0.02);
    border: 2px dashed var(--border);
    border-radius: 16px;
    position: relative;
    animation: fade-in 0.5s ease;
}

@keyframes fade-in {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
}

.not-found-message::before {
    content: "📋";
    display: block;
    font-size: 4rem;
    margin-bottom: 20px;
    opacity: 0.5;
    animation: empty-float 3s ease-in-out infinite;
}

@keyframes empty-float {
    0%, 100% { transform: translateY(0); }
    50% { transform: translateY(-10px); }
}

.not-found-message::after {
    content: "";
    position: absolute;
    top: 10px;
    left: 10px;
    width: 30px;
    height: 30px;
    border-top: 2px solid var(--emerald);
    border-left: 2px solid var(--emerald);
    opacity: 0.3;
}

@media (max-width: 1024px) {
    .chose-topic-block {
        left: 240px;
        padding: 24px;
    }
    
    .section-heading {
        font-size: 1.6rem;
    }
}

@media (max-width: 768px) {
    .chose-topic-block {
        left: 70px;
        padding: 20px;
    }
    
    .section-heading {
        font-size: 1.4rem;
        margin-bottom: 24px;
    }
    
    .not-found-message {
        padding: 60px 30px;
        font-size: 1rem;
    }
}

@media (max-width: 480px) {
    .chose-topic-block {
        left: 0;
        padding: 16px;
    }
    
    .section-heading {
        font-size: 1.2rem;
        padding-left: 16px;
    }
}
'
]

{ #category : 'styles' }
StyleLibrary >> createTestFormCss [

	^ ' 
:root {
    --emerald: #10B981;
    --mint: #34D399;
    --cyan: #06B6D4;
    --teal: #14B8A6;
    --dark: #0A0E14;
    --darker: #050810;
    --card: #151B26;
    --border: #1F2937;
    --text: #E5E7EB;
    --text-dim: #9CA3AF;
}

body {
    margin: 0;
    background: var(--darker);
}

.form-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    background: rgba(5, 8, 16, 0.7);
    backdrop-filter: blur(10px);
    z-index: 100;
    display: flex;
    justify-content: center;
    align-items: center;
}

.close-button {
    position: absolute;
    top: 20px;
    right: 20px;
    font-size: 24px;
    color: var(--text-dim);
    cursor: pointer;
    line-height: 1;
    transition: all 0.3s ease;
    z-index: 102;
    text-decoration: none;
}

.close-button:hover {
    color: var(--emerald);
    transform: scale(1.2) rotate(90deg);
    text-shadow: 0 0 10px var(--emerald);
}

.create-test-block {
    max-width: 800px;
    min-width: 500px;
    margin: 60px auto;
    padding: 32px;
    background: var(--card);
    border-radius: 16px;
    border: 1px solid var(--border);
    box-shadow:
       0 8px 32px rgba(0,0,0,0.4),
       0 0 0 1px rgba(16,185,129,0.1);
    position: relative;
    overflow: hidden;
}

.create-test-block::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 3px;
    background: linear-gradient(90deg, var(--emerald), var(--cyan));
    box-shadow: 0 0 15px rgba(16,185,129,0.5);
}

.create-test-block::after {
    content: "";
    position: absolute;
    top: 50%;
    right: -100px;
    width: 300px;
    height: 300px;
    background: radial-gradient(circle, rgba(16,185,129,0.08), transparent 70%);
    transform: translateY(-50%);
    pointer-events: none;
    animation: form-glow 4s ease-in-out infinite;
}

@keyframes form-glow {
    0%,100% { opacity:0.5; transform: translateY(-50%) scale(1); }
    50% { opacity:0.8; transform: translateY(-50%) scale(1.1); }
}

.create-test-title {
    font-family: "Outfit", sans-serif;
    font-size: 1.6rem;
    font-weight: 800;
    color: var(--text);
    margin: 0 0 20px 0;
    text-align: center;
    position: relative;
    z-index: 10;
}

.create-test-title::after {
    content: "";
    display: block;
    width: 60px;
    height: 3px;
    background: linear-gradient(90deg, var(--emerald), var(--cyan));
    margin: 12px auto 0;
    border-radius: 2px;
    box-shadow: 0 0 10px var(--emerald);
}

.test-content-input {
    margin-bottom: 20px;
    position: relative;
    z-index: 10;
}

.test-content-label {
    font-family: "Lexend", sans-serif;
    font-size: 0.9rem;
    color: var(--text-dim);
    display: block;
    margin-bottom: 8px;
}

.content-text-area {
    font-family: "Lexend", sans-serif;
    width: 100%;
    min-height: 90px;
    padding: 12px 16px;
    color: var(--text);
    background: rgba(255,255,255,0.03);
    border: 1px solid var(--border);
    border-radius: 10px;
    outline: none;
    resize: vertical;
    transition: all 0.3s ease;
    box-sizing: border-box;
    font-size: 0.95rem;
    line-height: 1.5;
}

.content-text-area:hover {
    background: rgba(255,255,255,0.05);
    border-color: rgba(16,185,129,0.3);
}

.content-text-area:focus {
    background: rgba(255,255,255,0.06);
    border-color: var(--emerald);
    box-shadow:
       0 0 0 3px rgba(16,185,129,0.1),
       0 0 20px rgba(16,185,129,0.2);
}

.answers-block {
    margin-bottom: 20px;
    display: flex;
    flex-direction: column;
    gap: 12px;
}

.answer-list {
    max-height: 220px;
    overflow-y: auto;
    padding-right: 8px;
}

.answer-list ul {
    list-style: none;
    padding: 0;
    margin: 0;
}

.answer-list::-webkit-scrollbar {
    width: 6px;
}

.answer-list::-webkit-scrollbar-thumb {
    background: var(--emerald);
    border-radius: 3px;
}

.add-answer-button {
    font-family: "Lexend", sans-serif;
    font-size: 0.9rem;
    font-weight: 600;
    color: var(--text);
    text-decoration: none;
    display: block;
    padding: 12px;
    background: rgba(255, 255, 255, 0.03);
    border: 2px dashed var(--border);
    border-radius: 10px;
    cursor: pointer;
    transition: all 0.3s ease;
    text-align: center;
    position: relative;
    overflow: hidden;
}

.add-answer-button::before {
    content: "+ ";
    font-size: 1.2rem;
    font-weight: 700;
    color: var(--emerald);
    transition: transform 0.3s ease;
}

.add-answer-button::after {
    content: "";
    position: absolute;
    inset: 0;
    background: linear-gradient(135deg, rgba(16, 185, 129, 0.08), rgba(6, 182, 212, 0.08));
    opacity: 0;
    transition: opacity 0.3s ease;
    z-index: -1;
}

.add-answer-button:hover {
    border-color: var(--emerald);
    background: rgba(16, 185, 129, 0.05);
    color: var(--emerald);
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(16, 185, 129, 0.15);
}

.add-answer-button:hover::after {
    opacity: 1;
}

.add-answer-button:active {
    transform: translateY(0);
}

.create-task-submit {
    font-family: "Lexend", sans-serif;
    font-size: 1rem;
    font-weight: 600;
    width: 100%;
    padding: 14px;
    color: var(--dark);
    background: linear-gradient(135deg, var(--emerald), var(--cyan));
    border: none;
    border-radius: 10px;
    cursor: pointer;
    margin-top: 8px;
    position: relative;
    overflow: hidden;
    transition: all 0.3s ease;
    box-shadow:
       0 4px 16px rgba(16,185,129,0.4),
       0 0 30px rgba(16,185,129,0.2);
    z-index: 10;
}

.create-task-submit:hover {
    transform: translateY(-2px);
    box-shadow:
       0 8px 24px rgba(16,185,129,0.6),
       0 0 40px rgba(16,185,129,0.4);
}

.create-task-submit:active {
    transform: translateY(0);
}

@media (max-width: 640px) {
    .create-test-block {
        max-width: 90%;
        padding: 28px 20px;
        margin: 40px auto;
    }
    
    .create-test-title {
        font-size: 1.4rem;
    }
    
    .content-text-area {
        padding: 10px 14px;
        font-size: 0.9rem;
        min-height: 80px;
    }
    
    .create-task-submit {
        padding: 12px;
        font-size: 0.95rem;
    }
}
'
]

{ #category : 'styles' }
StyleLibrary >> dashboardCss [

	^ '
.dashboard-main-container {
    display: flex;
    min-height: 100vh;
    width: 100%;
}

/* Область контенту (справа) */
.content-area {
    flex-grow: 1;
    background-color: #f9f9f9; 
    margin-left: 280px; 
}'
]

{ #category : 'styles' }
StyleLibrary >> editTopicCss [
	^ '
@import url("https://fonts.googleapis.com/css2?family=Outfit:wght@400;600;700;800&family=Lexend:wght@500;600&display=swap");

.edit-topic-block {
    position: relative;
    background: rgba(21, 27, 38, 0.8);
    backdrop-filter: blur(10px);
    border: 1px solid var(--emerald);
    border-radius: 12px;
    padding: 20px;
    margin-bottom: 16px;
    transition: all 0.3s ease;
    overflow: hidden;
    z-index: 1;
    box-shadow: 
        0 4px 16px rgba(0, 0, 0, 0.3), 
        0 0 20px rgba(16, 185, 129, 0.2);
}

.edit-topic-block::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 3px;
    background: linear-gradient(90deg, var(--emerald), var(--cyan));
    border-radius: 12px 12px 0 0;
    box-shadow: 0 0 15px var(--emerald);
}

.edit-topic-block::after {
    content: "";
    position: absolute;
    top: 50%;
    right: -50px;
    width: 200px;
    height: 200px;
    background: radial-gradient(circle, rgba(16, 185, 129, 0.12), transparent 70%);
    transform: translateY(-50%);
    pointer-events: none;
    animation: edit-glow 4s ease-in-out infinite;
}

@keyframes edit-glow {
    0%, 100% { opacity: 0.6; transform: translateY(-50%) scale(1); }
    50% { opacity: 0.9; transform: translateY(-50%) scale(1.1); }
}

.edit-topic-header {
    display: flex;
    align-items: center;
    gap: 12px;
    margin-bottom: 16px;
    position: relative;
    z-index: 10;
}

.edit-title-input {
    font-family: "Outfit", sans-serif;
    font-size: 1.3rem;
    font-weight: 700;
    color: var(--text);
    flex: 1;
    padding: 14px 18px;
    background: rgba(255, 255, 255, 0.03);
    border: 1px solid var(--border);
    border-radius: 10px;
    outline: none;
    transition: all 0.3s ease;
    box-sizing: border-box;
}

.edit-title-input::placeholder {
    color: var(--text-dim);
    opacity: 0.5;
}

.edit-title-input:hover {
    background: rgba(255, 255, 255, 0.05);
    border-color: rgba(16, 185, 129, 0.3);
}

.edit-title-input:focus {
    background: rgba(255, 255, 255, 0.06);
    border-color: var(--emerald);
    box-shadow: 
        0 0 0 3px rgba(16, 185, 129, 0.1),
        0 0 20px rgba(16, 185, 129, 0.2);
}

.edit-operations {
    display: flex;
    gap: 8px;
    flex-shrink: 0;
}

.edit-save-button,
.edit-cancel-button {
    width: 46px;
    height: 46px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 8px;
    color: var(--text-dim);
    text-decoration: none;
    font-size: 1.3rem;
    cursor: pointer;
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
    flex-shrink: 0;
}

.edit-save-button {
    background: rgba(16, 185, 129, 0.1);
    border: 1px solid var(--emerald);
}

.edit-save-button::before {
    content: "";
    position: absolute;
    inset: 0;
    background: linear-gradient(135deg, rgba(16, 185, 129, 0.2), rgba(6, 182, 212, 0.2));
    opacity: 0;
    transition: opacity 0.3s ease;
}

.edit-save-button:hover {
    color: var(--emerald);
    border-color: var(--mint);
    background: rgba(16, 185, 129, 0.15);
    transform: scale(1.1);
    box-shadow: 0 2px 8px rgba(16, 185, 129, 0.3);
}

.edit-save-button:hover::before {
    opacity: 1;
}

.edit-cancel-button {
    background: rgba(239, 68, 68, 0.1);
    border: 1px solid rgba(239, 68, 68, 0.3);
}

.edit-cancel-button::before {
    content: "";
    position: absolute;
    inset: 0;
    background: linear-gradient(135deg, rgba(239, 68, 68, 0.2), rgba(248, 113, 113, 0.2));
    opacity: 0;
    transition: opacity 0.3s ease;
}

.edit-cancel-button:hover {
    color: var(--error-red);
    border-color: var(--error-red);
    background: rgba(239, 68, 68, 0.15);
    transform: scale(1.1);
    box-shadow: 0 2px 8px rgba(239, 68, 68, 0.3);
}

.edit-cancel-button:hover::before {
    opacity: 1;
}

.edit-save-button:active,
.edit-cancel-button:active {
    transform: scale(0.95);
}

.edit-decription-area {
    font-family: "Lexend", sans-serif;
    font-size: 0.95rem;
    color: var(--text);
    width: 100%;
    min-height: 120px;
    padding: 14px 18px;
    background: rgba(255, 255, 255, 0.03);
    border: 1px solid var(--border);
    border-radius: 10px;
    outline: none;
    transition: all 0.3s ease;
    box-sizing: border-box;
    resize: vertical;
    line-height: 1.6;
    position: relative;
    z-index: 10;
}

.edit-decription-area::placeholder {
    color: var(--text-dim);
    opacity: 0.5;
}

.edit-decription-area:hover {
    background: rgba(255, 255, 255, 0.05);
    border-color: rgba(16, 185, 129, 0.3);
}

.edit-decription-area:focus {
    background: rgba(255, 255, 255, 0.06);
    border-color: var(--emerald);
    box-shadow: 
        0 0 0 3px rgba(16, 185, 129, 0.1),
        0 0 20px rgba(16, 185, 129, 0.2);
}

@media (max-width: 768px) {
    .edit-topic-header {
        flex-wrap: wrap;
    }
    
    .edit-title-input {
        font-size: 1.1rem;
        padding: 12px 16px;
    }
    
    .edit-save-button,
    .edit-cancel-button {
        width: 42px;
        height: 42px;
        font-size: 1.1rem;
    }
}

@media (max-width: 480px) {
    .edit-topic-block {
        padding: 16px;
    }
    
    .edit-title-input {
        width: 100%;
        flex: none;
    }
    
    .edit-operations {
        width: 100%;
        justify-content: flex-end;
    }
    
    .edit-save-button,
    .edit-cancel-button {
        width: 40px;
        height: 40px;
        font-size: 1rem;
    }
    
    .edit-decription-area {
        min-height: 100px;
        padding: 12px 16px;
        font-size: 0.9rem;
    }
}
'
]

{ #category : 'styles' }
StyleLibrary >> editUserFormCss [
	^ '
:root {
    --emerald: #10B981;
    --mint: #34D399;
    --cyan: #06B6D4;
    --teal: #14B8A6;
    --dark: #0A0E14;
    --darker: #050810;
    --card: #151B26;
    --border: #1F2937;
    --text: #E5E7EB;
    --text-dim: #9CA3AF;
}

body {
    margin: 0;
    background: var(--darker);
}

.form-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    background: rgba(5, 8, 16, 0.7);
    backdrop-filter: blur(10px);
    z-index: 100;
    display: flex;
    justify-content: center;
    align-items: center;
}

.edit-user-form {
    max-width: 600px;
    min-width: 500px;
    margin: 80px auto;
    padding: 40px;
    background: var(--card);
    border-radius: 16px;
    border: 1px solid var(--border);
    box-shadow: 
        0 8px 32px rgba(0, 0, 0, 0.4),
        0 0 0 1px rgba(16, 185, 129, 0.1);
    position: relative;
    overflow: hidden;
}

.edit-user-form::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 3px;
    background: linear-gradient(90deg, var(--emerald), var(--cyan));
    box-shadow: 0 0 15px rgba(16, 185, 129, 0.5);
}

.close-button {
    position: absolute;
    top: 20px;
    right: 20px;
    font-size: 24px;
    color: var(--text-dim);
    cursor: pointer;
    line-height: 1;
    transition: all 0.3s ease;
    z-index: 102;
    text-decoration: none;
}

.close-button:hover {
    color: var(--emerald);
    transform: scale(1.2) rotate(90deg);
    text-shadow: 0 0 10px var(--emerald);
}

.edit-user-form h1 {
    font-family: "Outfit", sans-serif;
    font-size: 1.8rem;
    font-weight: 800;
    color: var(--text);
    margin: 0 0 32px 0;
    text-align: center;
    position: relative;
    z-index: 10;
}

.edit-user-form h1::after {
    content: "";
    display: block;
    width: 60px;
    height: 4px;
    background: linear-gradient(90deg, var(--emerald), var(--cyan));
    margin: 16px auto 0;
    border-radius: 2px;
    box-shadow: 0 0 10px var(--emerald);
}

.edit-username-block,
.edit-email-block {
    margin-bottom: 28px;
    position: relative;
    z-index: 10;
}

.username-label,
.email-label {
    font-family: "Lexend", sans-serif;
    font-size: 0.9rem;
    font-weight: 500;
    color: var(--text-dim);
    display: block;
    margin-bottom: 10px;
    transition: color 0.3s ease;
}

.username-input,
.email-input {
    font-family: "Lexend", sans-serif;
    width: 100%;
    padding: 14px 18px;
    font-size: 1rem;
    color: var(--text);
    background: rgba(255, 255, 255, 0.03);
    border: 1px solid var(--border);
    border-radius: 10px;
    outline: none;
    transition: all 0.3s ease;
    box-sizing: border-box;
}

.username-input::placeholder,
.email-input::placeholder {
    color: var(--text-dim);
    opacity: 0.5;
}

.username-input:hover,
.email-input:hover {
    background: rgba(255, 255, 255, 0.05);
    border-color: rgba(16, 185, 129, 0.3);
}

.username-input:focus,
.email-input:focus {
    background: rgba(255, 255, 255, 0.06);
    border-color: var(--emerald);
    box-shadow: 
        0 0 0 3px rgba(16, 185, 129, 0.1),
        0 0 20px rgba(16, 185, 129, 0.2);
}

.edit-username-block::before,
.edit-email-block::before {
    content: "";
    position: absolute;
    left: 0;
    top: 28px;
    width: 3px;
    height: 0;
    background: linear-gradient(180deg, var(--emerald), var(--cyan));
    border-radius: 2px;
    transition: height 0.3s ease;
    box-shadow: 0 0 8px var(--emerald);
}

.edit-username-block:focus-within::before,
.edit-email-block:focus-within::before {
    height: calc(100% - 28px);
}

.update-user-button {
    font-family: "Lexend", sans-serif;
    font-size: 1rem;
    font-weight: 600;
    width: 100%;
    padding: 16px;
    color: var(--dark);
    background: linear-gradient(135deg, var(--emerald), var(--cyan));
    border: none;
    border-radius: 10px;
    cursor: pointer;
    margin-top: 12px;
    position: relative;
    overflow: hidden;
    transition: all 0.3s ease;
    box-shadow: 
        0 4px 16px rgba(16, 185, 129, 0.4),
        0 0 30px rgba(16, 185, 129, 0.2);
    z-index: 10;
}

.update-user-button::before {
    content: "";
    position: absolute;
    top: 50%;
    left: 50%;
    width: 0;
    height: 0;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.3);
    transform: translate(-50%, -50%);
    transition: width 0.6s ease, height 0.6s ease;
}

.update-user-button::after {
    content: "✓";
    position: absolute;
    right: 20px;
    top: 50%;
    transform: translateY(-50%);
    font-size: 1.4rem;
    transition: transform 0.3s ease;
}

.update-user-button:hover::before {
    width: 400px;
    height: 400px;
}

.update-user-button:hover::after {
    transform: translateY(-50%) scale(1.2);
}

.update-user-button:hover {
    transform: translateY(-2px);
    box-shadow: 
        0 8px 24px rgba(16, 185, 129, 0.6),
        0 0 40px rgba(16, 185, 129, 0.4);
}

.update-user-button:active {
    transform: translateY(0);
}

@media (max-width: 640px) {
    .edit-user-form {
        max-width: 90%;
        min-width: auto;
        padding: 32px 24px;
        margin: 40px auto;
    }
    
    .edit-user-form h1 {
        font-size: 1.5rem;
    }
    
    .username-input,
    .email-input {
        padding: 12px 16px;
        font-size: 0.95rem;
    }
    
    .update-user-button {
        padding: 14px;
        font-size: 0.95rem;
    }
}
'
]

{ #category : 'styles' }
StyleLibrary >> errorModalCss [
	^ '
:root {
    --error-red: #EF4444;
    --error-light: #F87171;
    --error-glow: rgba(239, 68, 68, 0.4);
}

.form-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    background: rgba(5, 8, 16, 0.85);
    backdrop-filter: blur(15px);
    z-index: 200;
    display: flex;
    justify-content: center;
    align-items: center;
}

.error-modal-block {
    max-width: 500px;
    width: 90%;
    padding: 40px;
    background: var(--card);
    border-radius: 16px;
    border: 1px solid var(--border);
    box-shadow: 
        0 8px 32px rgba(0, 0, 0, 0.4),
        0 0 0 1px rgba(239, 68, 68, 0.2);
    position: relative;
    overflow: hidden;
    animation: error-slide-in 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
}

@keyframes error-slide-in {
    from { 
        transform: translateY(-50px) scale(0.9); 
        opacity: 0; 
    }
    to { 
        transform: translateY(0) scale(1); 
        opacity: 1; 
    }
}

.error-modal-block::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 3px;
    background: linear-gradient(90deg, var(--error-red), var(--error-light));
    box-shadow: 0 0 15px var(--error-glow);
}

.error-modal-block::after {
    content: "";
    position: absolute;
    top: 50%;
    right: -100px;
    width: 300px;
    height: 300px;
    background: radial-gradient(circle, rgba(239, 68, 68, 0.08), transparent 70%);
    transform: translateY(-50%);
    pointer-events: none;
    animation: error-glow 3s ease-in-out infinite;
}

@keyframes error-glow {
    0%, 100% { opacity: 0.5; transform: translateY(-50%) scale(1); }
    50% { opacity: 0.8; transform: translateY(-50%) scale(1.1); }
}

.error-modal-title {
    font-family: "Outfit", sans-serif;
    font-size: 1.8rem;
    font-weight: 800;
    color: var(--error-red);
    margin: 0 0 24px 0;
    text-align: center;
    position: relative;
    z-index: 10;
    text-transform: uppercase;
    letter-spacing: 1px;
}

.error-modal-title::after {
    content: "";
    display: block;
    width: 60px;
    height: 4px;
    background: linear-gradient(90deg, var(--error-red), var(--error-light));
    margin: 12px auto 0;
    border-radius: 2px;
    box-shadow: 0 0 10px var(--error-red);
}

.error-list-block {
    list-style: none;
    padding: 0;
    margin: 0 0 28px 0;
    position: relative;
    z-index: 10;
}

.error-item {
    font-family: "Lexend", sans-serif;
    color: var(--text);
    background: rgba(239, 68, 68, 0.08);
    padding: 14px 18px;
    border-left: 3px solid var(--error-red);
    margin-bottom: 12px;
    border-radius: 8px;
    font-size: 0.95rem;
    position: relative;
    transition: all 0.3s ease;
}

.error-item::before {
    content: "⚠";
    position: absolute;
    left: -12px;
    top: 50%;
    transform: translateY(-50%);
    font-size: 1.2rem;
    color: var(--error-red);
    background: var(--card);
    padding: 2px 4px;
    border-radius: 50%;
}

.error-item:hover {
    background: rgba(239, 68, 68, 0.12);
    transform: translateX(5px);
}

.close-modal-button {
    font-family: "Lexend", sans-serif;
    font-size: 1rem;
    font-weight: 600;
    width: 100%;
    padding: 14px;
    color: var(--error-red);
    background: transparent;
    border: 2px solid var(--error-red);
    border-radius: 10px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
    transition: all 0.3s ease;
    z-index: 10;
}

.close-modal-button:hover {
    border-color: var(--error-light);
    box-shadow: 
        0 4px 16px var(--error-glow),
        0 0 30px var(--error-glow);
    transform: translateY(-2px);
}

.close-modal-button:active {
    transform: translateY(0);
}

@media (max-width: 640px) {
    .error-modal-block {
        max-width: 90%;
        padding: 32px 24px;
    }
    
    .error-modal-title {
        font-size: 1.4rem;
    }
    
    .error-item {
        padding: 12px 16px;
        font-size: 0.9rem;
    }
}
'
]

{ #category : 'styles' }
StyleLibrary >> headerCss [

	^ '
@import url("https://fonts.googleapis.com/css2?family=Outfit:wght@400;600;700;800&family=Lexend:wght@500;600&display=swap");

:root {
    --emerald: #10B981;
    --mint: #34D399;
    --cyan: #06B6D4;
    --teal: #14B8A6;
    --dark: #0A0E14;
    --darker: #050810;
    --card: #151B26;
    --border: #1F2937;
    --text: #E5E7EB;
    --text-dim: #9CA3AF;
}

body {
    margin: 0;
    background: var(--darker);
}

.header {
    position: relative;
    background: var(--dark);
    padding: 24px 7%;
    border-bottom: 1px solid var(--border);
    box-shadow: 0 4px 24px rgba(0, 0, 0, 0.4);
    display: flex;
    justify-content: space-between;
    align-items: center;
    overflow: hidden;
}

.header::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 2px;
    background: linear-gradient(90deg, transparent, var(--emerald), var(--cyan), transparent);
    opacity: 0.8;
    animation: line-glow 3s ease-in-out infinite;
}

@keyframes line-glow {
    0%, 100% { opacity: 0.6; }
    50% { opacity: 1; }
}

.header::after {
    content: "";
    position: absolute;
    top: 50%;
    right: 5%;
    width: 500px;
    height: 500px;
    background: radial-gradient(circle, rgba(16, 185, 129, 0.12), transparent 70%);
    transform: translateY(-50%);
    pointer-events: none;
    animation: pulse-glow 4s ease-in-out infinite;
}

@keyframes pulse-glow {
    0%, 100% { opacity: 0.4; transform: translateY(-50%) scale(1); }
    50% { opacity: 0.7; transform: translateY(-50%) scale(1.15); }
}

.header-glow-left {
    position: absolute;
    top: 50%;
    left: 0;
    width: 300px;
    height: 300px;
    background: radial-gradient(circle, rgba(6, 182, 212, 0.08), transparent 70%);
    transform: translateY(-50%);
    pointer-events: none;
    animation: pulse-glow-alt 5s ease-in-out infinite;
}

@keyframes pulse-glow-alt {
    0%, 100% { opacity: 0.3; transform: translateY(-50%) scale(1); }
    50% { opacity: 0.5; transform: translateY(-50%) scale(1.2); }
}

.header-logo {
    font-family: "Outfit", sans-serif;
    font-size: 2rem;
    font-weight: 800;
    color: var(--text);
    letter-spacing: -0.5px;
    cursor: pointer;
    position: relative;
    transition: all 0.3s ease;
    z-index: 10;
    display: flex;
    align-items: center;
    gap: 12px;
}

.header-logo h1 {
    margin: 0;
    font-size: inherit;
    font-weight: inherit;
    color: inherit;
}

.header-logo::before {
    content: "▸";
    color: var(--emerald);
    font-size: 1.5rem;
    display: inline-block;
    transition: all 0.3s ease;
    animation: arrow-pulse 2s ease-in-out infinite;
    filter: drop-shadow(0 0 8px var(--emerald));
}

@keyframes arrow-pulse {
    0%, 100% { transform: translateX(0); opacity: 1; }
    50% { transform: translateX(4px); opacity: 0.7; }
}

.header-logo:hover::before {
    color: var(--mint);
    animation: none;
    transform: translateX(8px);
}

.header-logo::after {
    content: "";
    position: absolute;
    bottom: -6px;
    left: 30px;
    width: 40px;
    height: 3px;
    background: linear-gradient(90deg, var(--emerald), var(--cyan));
    border-radius: 2px;
    transition: width 0.4s ease;
    box-shadow: 0 0 8px var(--emerald);
}

.header-logo:hover {
    color: var(--emerald);
}

.header-logo:hover::after {
    width: calc(100% - 30px);
}

.logo-dots {
    position: absolute;
    left: -15px;
    top: 50%;
    transform: translateY(-50%);
    display: flex;
    flex-direction: column;
    gap: 4px;
}

.logo-dots span {
    width: 4px;
    height: 4px;
    background: var(--emerald);
    border-radius: 50%;
    opacity: 0.6;
    animation: dot-blink 1.5s ease-in-out infinite;
}

.logo-dots span:nth-child(2) {
    animation-delay: 0.3s;
}

.logo-dots span:nth-child(3) {
    animation-delay: 0.6s;
}

@keyframes dot-blink {
    0%, 100% { opacity: 0.3; transform: scale(1); }
    50% { opacity: 1; transform: scale(1.3); }
}

.nav-wrapper {
    display: flex;
    align-items: center;
    gap: 30px;
    position: relative;
    z-index: 10;
}

.nav-menu {
    display: flex;
    list-style: none;
    margin: 0;
    padding: 0;
    gap: 8px;
    background: rgba(21, 27, 38, 0.6);
    backdrop-filter: blur(10px);
    padding: 6px;
    border-radius: 12px;
    border: 1px solid var(--border);
    box-shadow: 0 0 20px rgba(16, 185, 129, 0.1);
}

.nav-menu li {
    font-family: "Lexend", sans-serif;
    font-size: 0.95rem;
    font-weight: 500;
    color: var(--text-dim);
    padding: 12px 24px;
    cursor: pointer;
    position: relative;
    transition: all 0.3s ease;
    border-radius: 8px;
    overflow: hidden;
}

.nav-menu li::before {
    content: "";
    position: absolute;
    inset: 0;
    background: linear-gradient(135deg, rgba(16, 185, 129, 0.15), rgba(6, 182, 212, 0.15));
    opacity: 0;
    transition: opacity 0.3s ease;
}

.nav-menu li::after {
    content: "";
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 0;
    height: 2px;
    background: linear-gradient(90deg, var(--emerald), var(--cyan));
    transition: width 0.3s ease;
    box-shadow: 0 0 8px var(--emerald);
}

.nav-menu li:hover {
    color: var(--text);
    background: rgba(16, 185, 129, 0.08);
}

.nav-menu li:hover::before {
    opacity: 1;
}

.nav-menu li:hover::after {
    width: 70%;
}

.nav-menu li.active {
    color: var(--emerald);
    background: rgba(16, 185, 129, 0.15);
    font-weight: 600;
    box-shadow: inset 0 0 20px rgba(16, 185, 129, 0.15);
}

.nav-menu li.active::before {
    opacity: 1;
}

.nav-menu li.active::after {
    width: 90%;
    height: 3px;
}

.nav-icon {
    position: absolute;
    left: 8px;
    top: 50%;
    transform: translateY(-50%);
    width: 3px;
    height: 16px;
    background: var(--emerald);
    border-radius: 2px;
    box-shadow: 0 0 8px var(--emerald);
}

.cta-button {
	 text-decoration: none;
    font-family: "Lexend", sans-serif;
    font-size: 0.95rem;
    font-weight: 600;
    color: var(--dark);
    background: linear-gradient(135deg, var(--emerald), var(--cyan));
    padding: 12px 28px;
    border-radius: 10px;
    border: none;
    cursor: pointer;
    position: relative;
    overflow: hidden;
    transition: all 0.3s ease;
    box-shadow: 0 4px 16px rgba(16, 185, 129, 0.4), 0 0 30px rgba(16, 185, 129, 0.2);
}

.cta-button::before {
    content: "";
    position: absolute;
    top: 50%;
    left: 50%;
    width: 0;
    height: 0;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.3);
    transform: translate(-50%, -50%);
    transition: width 0.5s ease, height 0.5s ease;
}

.cta-button:hover::before {
    width: 300px;
    height: 300px;
}

.cta-button:hover::after {
    transform: translateY(-50%) translateX(4px);
}

.cta-button:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 24px rgba(16, 185, 129, 0.6), 0 0 40px rgba(16, 185, 129, 0.3);
}

.corner-accent {
    position: absolute;
    top: 0;
    left: 0;
    width: 60px;
    height: 60px;
    border-top: 3px solid var(--emerald);
    border-left: 3px solid var(--emerald);
    opacity: 0.5;
    box-shadow: 0 0 15px rgba(16, 185, 129, 0.3);
}

.corner-accent-bottom {
    position: absolute;
    bottom: 0;
    right: 0;
    width: 60px;
    height: 60px;
    border-bottom: 3px solid var(--cyan);
    border-right: 3px solid var(--cyan);
    opacity: 0.5;
    box-shadow: 0 0 15px rgba(6, 182, 212, 0.3);
}

.accent-line-left {
    position: absolute;
    top: 20%;
    left: 3%;
    width: 2px;
    height: 60%;
    background: linear-gradient(180deg, transparent, var(--emerald), transparent);
    opacity: 0.3;
    animation: line-flow 3s ease-in-out infinite;
}

.accent-line-right {
    position: absolute;
    top: 20%;
    right: 3%;
    width: 2px;
    height: 60%;
    background: linear-gradient(180deg, transparent, var(--cyan), transparent);
    opacity: 0.3;
    animation: line-flow 3s ease-in-out infinite reverse;
}

@keyframes line-flow {
    0%, 100% { opacity: 0.2; transform: scaleY(1); }
    50% { opacity: 0.5; transform: scaleY(1.1); }
}

.particle {
    position: absolute;
    width: 3px;
    height: 3px;
    background: var(--emerald);
    border-radius: 50%;
    opacity: 0.4;
    animation: float-particle 6s ease-in-out infinite;
}

.particle:nth-child(1) {
    top: 20%;
    left: 15%;
    animation-delay: 0s;
}

.particle:nth-child(2) {
    top: 60%;
    left: 25%;
    animation-delay: 1s;
}

.particle:nth-child(3) {
    top: 40%;
    right: 20%;
    animation-delay: 2s;
    background: var(--cyan);
}

.sign-in-button {
    text-decoration: none;
    font-family: "Lexend", sans-serif;
    font-size: 0.95rem;
    font-weight: 600;
    color: var(--text-dim);
    background: rgba(21, 27, 38, 0.6);
    backdrop-filter: blur(10px);
    padding: 11px 24px; 
    border-radius: 10px; 
    border: 1px solid var(--border);
    cursor: pointer;
    position: relative;
    transition: all 0.3s ease;
    display: inline-block;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.sign-in-button:hover {
    color: var(--emerald);
    border-color: var(--emerald);
    background: rgba(16, 185, 129, 0.05);
    box-shadow: 0 0 20px rgba(16, 185, 129, 0.1);
    transform: translateY(-1px);
}

.sign-in-button:active {
    transform: translateY(1px);
    background: rgba(16, 185, 129, 0.15);
}

@keyframes float-particle {
    0%, 100% { transform: translateY(0) scale(1); opacity: 0.3; }
    50% { transform: translateY(-20px) scale(1.3); opacity: 0.7; }
}

.scan-line {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 1px;
    background: linear-gradient(90deg, transparent, var(--emerald), transparent);
    opacity: 0.6;
    animation: scan 4s linear infinite;
}

@keyframes scan {
    0% { transform: translateX(-100%); }
    100% { transform: translateX(100%); }
}

@media (max-width: 968px) {
    .header {
        padding: 20px 5%;
    }
    .header-logo {
        font-size: 1.7rem;
    }
    .nav-wrapper {
        gap: 15px;
    }
    .nav-menu li {
        padding: 10px 18px;
        font-size: 0.9rem;
    }
    .cta-button {
        padding: 10px 20px;
        font-size: 0.85rem;
    }
    .particle, .accent-line-left, .accent-line-right {
        display: none;
    }
}

@media (max-width: 640px) {
    .header-logo {
        font-size: 1.5rem;
    }
    .nav-menu {
        display: none;
    }
    .cta-button {
        padding: 10px 18px;
        font-size: 0.85rem;
    }
}
'
]

{ #category : 'styles' }
StyleLibrary >> landingPageContentCss [

	^ '
	
	body {
    background: radial-gradient(circle at 50% 50%, #0d1117 0%, #050810 100%);
    overflow-x: hidden;
}

body::before, body::after {
    content: "";
    position: fixed;
    width: 300px;
    height: 300px;
    filter: blur(100px);
    z-index: -1;
    opacity: 0.15;
    border-radius: 50%;
    animation: move-bg 20s infinite alternate;
}

body::before { background: var(--emerald); top: 10%; left: 10%; }
body::after { background: var(--cyan); bottom: 10%; right: 10%; animation-delay: -10s; }

@keyframes move-bg {
    0% { transform: translate(0, 0); }
    100% { transform: translate(200px, 100px); }
}

.landing-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    min-height: 80vh;
    padding: 40px 20px;
    color: var(--text);
    font-family: ''Lexend'', sans-serif;
	 background-image: 
        linear-gradient(rgba(16, 185, 129, 0.05) 1px, transparent 1px),
        linear-gradient(90deg, rgba(16, 185, 129, 0.05) 1px, transparent 1px);
    background-size: 50px 50px;
}

.hero-section {
    text-align: center;
    margin-bottom: 60px;
    max-width: 800px;
    animation: fadeIn 1s ease-out;
}

.landing-title {
    font-family: ''Outfit'', sans-serif;
    font-size: clamp(3rem, 8vw, 5.5rem);
    font-weight: 900;
    margin: 0 0 20px 0;
    background: linear-gradient(90deg, var(--emerald), var(--cyan));
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    filter: drop-shadow(0 0 20px rgba(16, 185, 129, 0.4));
    letter-spacing: -2px;
    text-transform: uppercase;
}

.landing-subtitle {
    font-size: 1.25rem;
    color: var(--text-dim);
    line-height: 1.6;
    margin-bottom: 40px;
}

.cta-button-large {
    display: inline-block;
    padding: 18px 45px;
    font-size: 1.2rem;
    font-weight: 700;
    color: var(--dark);
    text-decoration: none;
    background: linear-gradient(135deg, var(--emerald), var(--cyan));
    border-radius: 50px;
    box-shadow: 0 10px 30px rgba(16, 185, 129, 0.3);
    transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
    cursor: pointer;
}

.cta-button-large:hover {
    transform: scale(1.05) translateY(-3px);
    box-shadow: 0 15px 40px rgba(16, 185, 129, 0.5);
}

.features-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 25px;
    width: 100%;
    max-width: 1100px;
    margin-top: 20px;
}

.feature-card {
    background: rgba(255, 255, 255, 0.03);
    backdrop-filter: blur(10px);
    border: 1px solid var(--border);
    padding: 35px;
    border-radius: 20px;
    transition: all 0.4s ease;
    position: relative;
    overflow: hidden;
}

.feature-card::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(135deg, rgba(16, 185, 129, 0.1), transparent);
    opacity: 0;
    transition: opacity 0.4s ease;
}

.feature-card:hover {
    transform: translateY(-10px);
    border-color: var(--emerald);
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
}

.feature-card:hover::before {
    opacity: 1;
}

.feature-card h3 {
    font-size: 1.4rem;
    color: var(--emerald);
    margin: 0 0 15px 0;
    position: relative;
}

.feature-card p {
    font-size: 1rem;
    color: var(--text-dim);
    line-height: 1.5;
    margin: 0;
    position: relative;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(30px); }
    to { opacity: 1; transform: translateY(0); }
}

@media (max-width: 768px) {
    .landing-title { font-size: 3.5rem; }
    .features-grid { grid-template-columns: 1fr; }
}
	'
]

{ #category : 'styles' }
StyleLibrary >> registrationSuccessCss [
	^ '
:root {
    --neon-yellow: #E2FF43;
    --neon-glow: #f0ff91;
    --neon-amber: #FFD700;
    --dark: #0A0E14;
    --darker: #050810;
    --card: #151B26;
    --border: #1F2937;
    --text: #E5E7EB;
    --text-dim: #9CA3AF;
}

.form-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    background: rgba(5, 8, 16, 0.8);
    backdrop-filter: blur(10px);
    z-index: 1000;
    display: flex;
    justify-content: center;
    align-items: center;
}

.registration-success-block {
    max-width: 600px;
    min-width: 500px;
    padding: 40px;
    background: var(--card);
    border-radius: 16px;
    border: 1px solid var(--border);
    box-shadow: 
        0 8px 32px rgba(0, 0, 0, 0.4),
        0 0 0 1px rgba(226, 255, 67, 0.1);
    position: relative;
    overflow: hidden;
    box-sizing: border-box;
    text-align: center;
}

.registration-success-block::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 3px;
    background: linear-gradient(90deg, var(--neon-yellow), var(--neon-amber));
    box-shadow: 0 0 15px rgba(226, 255, 67, 0.5);
}

.registration-success-block::after {
    content: "";
    position: absolute;
    top: 50%;
    right: -100px;
    width: 300px;
    height: 300px;
    background: radial-gradient(circle, rgba(226, 255, 67, 0.08), transparent 70%);
    transform: translateY(-50%);
    pointer-events: none;
    animation: success-glow 4s ease-in-out infinite;
}

@keyframes success-glow {
    0%, 100% { opacity: 0.4; transform: translateY(-50%) scale(1); }
    50% { opacity: 0.7; transform: translateY(-50%) scale(1.15); }
}

.registration-success-block h2 {
    font-family: "Outfit", sans-serif;
    font-size: 2rem;
    font-weight: 800;
    color: var(--text);
    margin: 0 0 24px 0;
    position: relative;
    z-index: 10;
}

.registration-success-block h2::before {
    content: "✓";
    display: block;
    font-size: 4rem;
    color: var(--neon-yellow);
    margin-bottom: 16px;
    text-shadow: 0 0 20px var(--neon-yellow);
    animation: check-pulse 2s ease-in-out infinite;
}

@keyframes check-pulse {
    0%, 100% { transform: scale(1); opacity: 1; }
    50% { transform: scale(1.1); opacity: 0.9; }
}

.registration-success-block h2::after {
    content: "";
    display: block;
    width: 60px;
    height: 4px;
    background: linear-gradient(90deg, var(--neon-yellow), var(--neon-amber));
    margin: 16px auto 0;
    border-radius: 2px;
    box-shadow: 0 0 10px var(--neon-yellow);
}

.registration-success-block p {
    font-family: "Lexend", sans-serif;
    font-size: 1rem;
    color: var(--text);
    line-height: 1.6;
    margin: 0 0 32px 0;
    position: relative;
    z-index: 10;
}

.registration-success-button {
    font-family: "Lexend", sans-serif;
    font-size: 1rem;
    font-weight: 700;
    width: 100%;
    padding: 16px;
    color: var(--darker);
    background: linear-gradient(135deg, var(--neon-yellow), var(--neon-amber));
    border: none;
    border-radius: 10px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
    transition: all 0.3s ease;
    box-shadow: 
        0 4px 16px rgba(226, 255, 67, 0.3),
        0 0 30px rgba(226, 255, 67, 0.1);
    z-index: 10;
}

.registration-success-button::before {
    content: "";
    position: absolute;
    top: 50%;
    left: 50%;
    width: 0;
    height: 0;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.3);
    transform: translate(-50%, -50%);
    transition: width 0.6s ease, height 0.6s ease;
}

.registration-success-button:hover::before {
    width: 400px;
    height: 400px;
}

.registration-success-button:hover {
    transform: translateY(-2px);
    box-shadow: 
        0 8px 24px rgba(226, 255, 67, 0.5),
        0 0 40px rgba(226, 255, 67, 0.3);
}

.registration-success-button:active {
    transform: translateY(0);
}

@media (max-width: 640px) {
    .registration-success-block {
        max-width: 90%;
        min-width: auto;
        padding: 32px 24px;
    }
    
    .registration-success-block h2 {
        font-size: 1.6rem;
    }
    
    .registration-success-block h2::before {
        font-size: 3rem;
    }
    
    .registration-success-block p {
        font-size: 0.95rem;
    }
    
    .registration-success-button {
        padding: 14px;
        font-size: 0.95rem;
    }
}
'
]

{ #category : 'styles' }
StyleLibrary >> saveTopicFormCss [

	^ '
@import url("https://fonts.googleapis.com/css2?family=Outfit:wght@400;600;700;800&family=Lexend:wght@500;600&display=swap");

:root {
    --emerald: #10B981;
    --mint: #34D399;
    --cyan: #06B6D4;
    --dark: #0A0E14;
    --darker: #050810;
    --card: #151B26;
    --border: #1F2937;
    --text: #E5E7EB;
    --text-dim: #9CA3AF;
}

body {
    margin: 0;
    background: var(--darker);
}

.form-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    background: rgba(5, 8, 16, 0.85);
    backdrop-filter: blur(15px);
    z-index: 100;
    display: flex;
    justify-content: center;
    align-items: center;
}

.close-button {
    position: absolute;
    top: 20px;
    right: 20px;
    font-size: 24px;
    color: var(--text-dim);
    cursor: pointer;
    line-height: 1;
    transition: all 0.3s ease;
    z-index: 102;
    text-decoration: none;
}

.close-button:hover {
    color: var(--emerald);
    transform: scale(1.2) rotate(90deg);
    text-shadow: 0 0 10px var(--emerald);
}

.save-topic-block {
    max-width: 600px;
    min-width: 500px;
    padding: 40px;
    background: var(--card);
    border-radius: 16px;
    border: 1px solid var(--border);
    box-shadow: 
        0 8px 32px rgba(0, 0, 0, 0.4),
        0 0 0 1px rgba(16, 185, 129, 0.1);
    position: relative;
    overflow: hidden;
    animation: form-slide-in 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
}

@keyframes form-slide-in {
    from { 
        transform: translateY(-50px) scale(0.9); 
        opacity: 0; 
    }
    to { 
        transform: translateY(0) scale(1); 
        opacity: 1; 
    }
}

.save-topic-block::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 3px;
    background: linear-gradient(90deg, var(--emerald), var(--cyan));
    box-shadow: 0 0 15px rgba(16, 185, 129, 0.5);
}

.save-topic-block::after {
    content: "";
    position: absolute;
    top: 50%;
    right: -100px;
    width: 300px;
    height: 300px;
    background: radial-gradient(circle, rgba(16, 185, 129, 0.08), transparent 70%);
    transform: translateY(-50%);
    pointer-events: none;
    animation: form-glow 4s ease-in-out infinite;
}

@keyframes form-glow {
    0%, 100% { opacity: 0.5; transform: translateY(-50%) scale(1); }
    50% { opacity: 0.8; transform: translateY(-50%) scale(1.1); }
}

.topic-input-block,
.description-input-block {
    margin-bottom: 28px;
    position: relative;
    z-index: 10;
}

.description-input{
	height: 200px;
}

.topic-label,
.description-label {
    font-family: "Lexend", sans-serif;
    font-size: 0.9rem;
    font-weight: 500;
    color: var(--text-dim);
    display: block;
    margin-bottom: 10px;
    transition: color 0.3s ease;
}

.topic-input,
.description-input {
    font-family: "Lexend", sans-serif;
    width: 100%;
    padding: 14px 18px;
    font-size: 1rem;
    color: var(--text);
    background: rgba(255, 255, 255, 0.03);
    border: 1px solid var(--border);
    border-radius: 10px;
    outline: none;
    transition: all 0.3s ease;
    box-sizing: border-box;
}

.topic-input::placeholder,
.description-input::placeholder {
    color: var(--text-dim);
    opacity: 0.5;
}

.topic-input:hover,
.description-input:hover {
    background: rgba(255, 255, 255, 0.05);
    border-color: rgba(16, 185, 129, 0.3);
}

.topic-input:focus,
.description-input:focus {
    background: rgba(255, 255, 255, 0.06);
    border-color: var(--emerald);
    box-shadow: 
        0 0 0 3px rgba(16, 185, 129, 0.1),
        0 0 20px rgba(16, 185, 129, 0.2);
}

.topic-input-block::before,
.description-input-block::before {
    content: "";
    position: absolute;
    left: 0;
    top: 28px;
    width: 3px;
    height: 0;
    background: linear-gradient(180deg, var(--emerald), var(--cyan));
    border-radius: 2px;
    transition: height 0.3s ease;
    box-shadow: 0 0 8px var(--emerald);
}

.topic-input-block:focus-within::before,
.description-input-block:focus-within::before {
    height: calc(100% - 28px);
}

.submit-topic-button {
    font-family: "Lexend", sans-serif;
    font-size: 1rem;
    font-weight: 600;
    width: 100%;
    padding: 16px;
    color: var(--dark);
    background: linear-gradient(135deg, var(--emerald), var(--cyan));
    border: none;
    border-radius: 10px;
    cursor: pointer;
    margin-top: 12px;
    position: relative;
    overflow: hidden;
    transition: all 0.3s ease;
    box-shadow: 
        0 4px 16px rgba(16, 185, 129, 0.4),
        0 0 30px rgba(16, 185, 129, 0.2);
    z-index: 10;
}

.submit-topic-button::before {
    content: "";
    position: absolute;
    top: 50%;
    left: 50%;
    width: 0;
    height: 0;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.3);
    transform: translate(-50%, -50%);
    transition: width 0.6s ease, height 0.6s ease;
}

.submit-topic-button::after {
    content: "→";
    position: absolute;
    right: 20px;
    top: 50%;
    transform: translateY(-50%);
    font-size: 1.4rem;
    transition: transform 0.3s ease;
}

.submit-topic-button:hover::before {
    width: 400px;
    height: 400px;
}

.submit-topic-button:hover::after {
    transform: translateY(-50%) translateX(5px);
}

.submit-topic-button:hover {
    transform: translateY(-2px);
    box-shadow: 
        0 8px 24px rgba(16, 185, 129, 0.6),
        0 0 40px rgba(16, 185, 129, 0.4);
}

.submit-topic-button:active {
    transform: translateY(0);
}

@media (max-width: 640px) {
    .save-topic-block {
        max-width: 90%;
        min-width: 320px;
        padding: 32px 24px;
    }
    
    .topic-input,
    .description-input {
        padding: 12px 16px;
        font-size: 0.95rem;
    }
    
    .submit-topic-button {
        padding: 14px;
        font-size: 0.95rem;
    }
}
'
]

{ #category : 'styles' }
StyleLibrary >> sidebarCss [
	^ '
@import url("https://fonts.googleapis.com/css2?family=Outfit:wght@400;600;700;800&family=Lexend:wght@500;600&display=swap");

:root {
    --emerald: #10B981;
    --mint: #34D399;
    --cyan: #06B6D4;
    --dark: #0A0E14;
    --darker: #050810;
    --card: #151B26;
    --border: #1F2937;
    --text: #E5E7EB;
    --text-dim: #9CA3AF;
    --error-red: #EF4444;
}

body {
    margin: 0;
    background: var(--darker);
    padding: 0;
}

.sidebar-block {
    position: fixed;
    left: 0;
    top: 0;
    height: 100vh;
    width: 280px;
    background: var(--dark);
    border-right: 1px solid var(--border);
    padding: 30px 20px;
    display: flex;
    flex-direction: column;
    box-sizing: border-box;
    z-index: 50;
    overflow-y: auto;
    box-shadow: 4px 0 24px rgba(0, 0, 0, 0.4);
}

.sidebar-block::before {
    content: "";
    position: absolute;
    top: 0;
    right: 0;
    width: 2px;
    height: 100%;
    background: linear-gradient(180deg, transparent, var(--emerald), var(--cyan), transparent);
    opacity: 0.8;
    animation: sidebar-glow 3s ease-in-out infinite;
}

@keyframes sidebar-glow {
    0%, 100% { opacity: 0.6; }
    50% { opacity: 1; }
}

.sidebar-block::after {
    content: "";
    position: absolute;
    top: 50%;
    left: -50px;
    width: 300px;
    height: 300px;
    background: radial-gradient(circle, rgba(16, 185, 129, 0.08), transparent 70%);
    transform: translateY(-50%);
    pointer-events: none;
    animation: sidebar-pulse 4s ease-in-out infinite;
}

@keyframes sidebar-pulse {
    0%, 100% { opacity: 0.4; transform: translateY(-50%) scale(1); }
    50% { opacity: 0.7; transform: translateY(-50%) scale(1.1); }
}

.sidebar-block::-webkit-scrollbar {
    width: 6px;
}

.sidebar-block::-webkit-scrollbar-track {
    background: var(--darker);
}

.sidebar-block::-webkit-scrollbar-thumb {
    background: var(--emerald);
    border-radius: 3px;
}

.sidebar-block::-webkit-scrollbar-thumb:hover {
    background: var(--mint);
}

.user-info-block {
    position: relative;
    margin-bottom: 25px;
    padding: 24px;
    background: rgba(21, 27, 38, 0.6);
    backdrop-filter: blur(10px);
    border-radius: 12px;
    border: 1px solid var(--border);
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.3);
    flex-shrink: 0;
    z-index: 10;
}

.user-info-block::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 3px;
    background: linear-gradient(90deg, var(--emerald), var(--cyan));
    border-radius: 12px 12px 0 0;
    box-shadow: 0 0 10px var(--emerald);
}

.user-info-block::after {
    content: "";
    position: absolute;
    bottom: 10px;
    right: 10px;
    width: 4px;
    height: 4px;
    background: var(--emerald);
    border-radius: 50%;
    box-shadow: 
        -8px 0 0 var(--emerald),
        0 -8px 0 var(--emerald),
        -8px -8px 0 var(--emerald);
    opacity: 0.3;
}

.username-info {
    font-family: "Outfit", sans-serif;
    font-size: 1.4rem;
    font-weight: 800;
    color: var(--text);
    margin: 0 0 8px 0;
    position: relative;
    padding-left: 20px;
}

.username-info::before {
    content: "▸";
    position: absolute;
    left: 0;
    color: var(--emerald);
    font-size: 1.2rem;
    animation: arrow-pulse 2s ease-in-out infinite;
    filter: drop-shadow(0 0 6px var(--emerald));
}

@keyframes arrow-pulse {
    0%, 100% { opacity: 1; transform: translateX(0); }
    50% { opacity: 0.6; transform: translateX(3px); }
}

.role-info {
    font-family: "Lexend", sans-serif;
    color: var(--emerald);
    font-size: 0.85rem;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 1.5px;
    margin: 0 0 12px 0;
    text-shadow: 0 0 10px rgba(16, 185, 129, 0.5);
}

.email-info {
    font-family: "Lexend", sans-serif;
    color: var(--text-dim);
    font-size: 0.9rem;
    word-break: break-all;
    margin: 0;
}

.operations-menu {
    display: flex;
    flex-direction: column;
    gap: 12px;
    flex-grow: 1;
    position: relative;
    z-index: 10;
}

.admin-pannel {
    margin-top: 20px;
    padding-top: 20px;
    border-top: 1px solid var(--border);
    display: flex;
    flex-direction: column;
    gap: 12px;
    position: relative;
}

.admin-pannel::before {
    content: "";
    position: absolute;
    top: -4px;
    left: 50%;
    transform: translateX(-50%);
    width: 6px;
    height: 6px;
    background: var(--emerald);
    border-radius: 50%;
    box-shadow: 0 0 10px var(--emerald);
    animation: dot-pulse 2s ease-in-out infinite;
}

@keyframes dot-pulse {
    0%, 100% { opacity: 1; transform: translateX(-50%) scale(1); }
    50% { opacity: 0.5; transform: translateX(-50%) scale(1.3); }
}

.operation-button {
    font-family: "Lexend", sans-serif;
    font-size: 0.95rem;
    font-weight: 500;
    color: var(--text-dim);
    text-decoration: none;
    padding: 14px 20px 14px 30px;
    background: rgba(255, 255, 255, 0.03);
    border: 1px solid var(--border);
    border-radius: 10px;
    cursor: pointer;
    position: relative;
    transition: all 0.3s ease;
    overflow: hidden;
    display: block;
}

.operation-button::before {
    content: "•";
    position: absolute;
    left: 12px;
    top: 50%;
    transform: translateY(-50%);
    color: var(--emerald);
    font-size: 1.2rem;
    opacity: 0.6;
    transition: all 0.3s ease;
}

.operation-button::after {
    content: "";
    position: absolute;
    left: 0;
    top: 0;
    bottom: 0;
    width: 0;
    background: linear-gradient(180deg, var(--emerald), var(--cyan));
    transition: width 0.3s ease;
    box-shadow: 0 0 8px var(--emerald);
}

.operation-button:hover {
    color: var(--text);
    background: rgba(16, 185, 129, 0.08);
    border-color: var(--emerald);
    transform: translateX(5px);
    box-shadow: 0 4px 12px rgba(16, 185, 129, 0.2);
}

.operation-button:hover::before {
    opacity: 1;
    color: var(--mint);
}

.operation-button:hover::after {
    width: 3px;
}

.operation-button.active {
    color: var(--emerald);
    background: rgba(16, 185, 129, 0.15);
    border-color: var(--emerald);
    font-weight: 600;
    box-shadow: inset 0 0 20px rgba(16, 185, 129, 0.15);
}

.operation-button.active::before {
    opacity: 1;
}

.operation-button.active::after {
    width: 3px;
}

.log-out-button {
    margin-top: 20px;
    padding: 14px;
    color: var(--text-dim);
    text-decoration: none;
    text-align: center;
    background: rgba(255, 255, 255, 0.02);
    border: 1px solid var(--border);
    border-radius: 10px;
    font-family: "Lexend", sans-serif;
    font-weight: 500;
    font-size: 0.9rem;
    transition: all 0.3s ease;
    flex-shrink: 0;
    display: block;
    position: relative;
    z-index: 10;
}

.log-out-button:hover {
    color: #F87171;
    background: rgba(239, 68, 68, 0.05);
    border-color: rgba(239, 68, 68, 0.3);
    box-shadow: 0 2px 8px rgba(239, 68, 68, 0.15);
}

.log-out-button:active {
    transform: scale(0.98);
}

@media (max-width: 1024px) {
    .sidebar-block {
        width: 240px;
    }
}

@media (max-width: 768px) {
    .sidebar-block {
        width: 70px;
        padding: 20px 10px;
    }
    
    .username-info, .role-info, .email-info {
        display: none;
    }
    
    .operation-button {
        padding: 12px;
        text-align: center;
    }
}

@media (max-width: 480px) {
    .sidebar-block {
        transform: translateX(-100%);
    }
    
    .sidebar-block.open {
        transform: translateX(0);
    }
}
'
]

{ #category : 'styles' }
StyleLibrary >> signInFormCss [

	^ '
:root {
    --neon-yellow: #E2FF43;
    --neon-glow: #f0ff91;
    --neon-amber: #FFD700;
    --dark: #0A0E14;
    --darker: #050810;
    --card: #151B26;
    --border: #1F2937;
    --text: #E5E7EB;
    --text-dim: #9CA3AF;
}

.form-overlay {
    position: fixed;
    top: 0; left: 0;
    width: 100vw; height: 100vh;
    background: rgba(5, 8, 16, 0.8);
    backdrop-filter: blur(10px);    
    z-index: 1000;    
    display: flex;
    justify-content: center;
    align-items: center;
}

.sign-in-form-block {
    max-width: 800px;
    min-width: 500px;
    padding: 30px;
    background: var(--card);
    border-radius: 16px;
    border: 1px solid var(--border);
    box-shadow: 
        0 8px 32px rgba(0, 0, 0, 0.4),
        0 0 0 1px rgba(226, 255, 67, 0.1);
    position: relative;
    overflow: hidden;
    box-sizing: border-box;
}

.sign-in-form-block::before {
    content: "";
    position: absolute;
    top: 0; left: 0; right: 0;
    height: 3px;
    background: linear-gradient(90deg, var(--neon-yellow), var(--neon-amber));
    box-shadow: 0 0 15px rgba(226, 255, 67, 0.5);
}

.sign-in-form-block::after {
    content: "";
    position: absolute;
    top: 50%;
    right: -100px;
    width: 300px; height: 300px;
    background: radial-gradient(circle, rgba(226, 255, 67, 0.08), transparent 70%);
    transform: translateY(-50%);
    pointer-events: none;
    animation: form-glow-yellow 4s ease-in-out infinite;
}

@keyframes form-glow-yellow {
    0%, 100% { opacity: 0.4; transform: translateY(-50%) scale(1); }
    50% { opacity: 0.7; transform: translateY(-50%) scale(1.15); }
}

.sign-in-form-block h2 {
    font-family: "Outfit", sans-serif;
    font-size: 2rem;
    font-weight: 800;
    color: var(--text);
    margin: 0 0 20px 0;
    text-align: center;
    position: relative;
    z-index: 10;
}

.sign-in-form-block h2::after {
    content: "";
    display: block;
    width: 60px; height: 4px;
    background: linear-gradient(90deg, var(--neon-yellow), var(--neon-amber));
    margin: 16px auto 0;
    border-radius: 2px;
    box-shadow: 0 0 10px var(--neon-yellow);
}

.info-input {
    margin-bottom: 15px;
    position: relative;
    z-index: 10;
    display: flex;
    flex-direction: column;
}

.info-label {
    font-family: "Lexend", sans-serif;
    font-size: 0.9rem;
    font-weight: 500;
    color: var(--text-dim);
    margin-bottom: 10px;
}

input.info-input {
    box-sizing: border-box;
    font-family: "Lexend", sans-serif;
    width: 100%;
    padding: 14px 18px;
    font-size: 1rem;
    color: var(--text);
    background: rgba(255, 255, 255, 0.03);
    border: 1px solid var(--border);
    border-radius: 10px;
    outline: none;
    transition: all 0.3s ease;
}

input.info-input:hover {
    background: rgba(255, 255, 255, 0.05);
    border-color: rgba(226, 255, 67, 0.3);
}

input.info-input:focus {
    background: rgba(255, 255, 255, 0.06);
    border-color: var(--neon-yellow);
    box-shadow: 
        0 0 0 3px rgba(226, 255, 67, 0.1),
        0 0 20px rgba(226, 255, 67, 0.2);
}

.close-button {
    position: absolute;
    top: 20px;
    right: 20px;
    font-size: 24px;
    color: var(--text-dim);
    cursor: pointer;
    line-height: 1;
    transition: all 0.3s ease;
    z-index: 102;
    text-decoration: none;
}

.close-button:hover {
    color: var(--neon-amber);
    transform: scale(1.2) rotate(90deg);
    text-shadow: 0 0 10px var(--neon-amber);
}

.sign-up-form h2 {
    font-family: "Outfit", sans-serif;
    font-size: 2rem;
    font-weight: 800;
    color: var(--text);
    margin: 0 0 32px 0;
    text-align: center;
    position: relative;
    z-index: 10;
}

.info-input::before {
    content: "";
    position: absolute;
    left: -20px;
    top: 35px;
    width: 3px; height: 0;
    background: linear-gradient(180deg, var(--neon-yellow), var(--neon-amber));
    border-radius: 2px;
    transition: height 0.3s ease;
    box-shadow: 0 0 8px var(--neon-yellow);
}

.info-input:focus-within::before {
    height: 40px;
}

.submit-button {
    font-family: "Lexend", sans-serif;
    font-size: 1rem;
    font-weight: 700;
    width: 100%;
    padding: 16px;
    color: var(--darker);
    background: linear-gradient(135deg, var(--neon-yellow), var(--neon-amber));
    border: none;
    border-radius: 10px;
    cursor: pointer;
    margin-top: 12px;
    position: relative;
    overflow: hidden;
    transition: all 0.3s ease;
    box-shadow: 
        0 4px 16px rgba(226, 255, 67, 0.3),
        0 0 30px rgba(226, 255, 67, 0.1);
    z-index: 10;
}

.submit-button:hover {
    transform: translateY(-2px);
    box-shadow: 
        0 8px 24px rgba(226, 255, 67, 0.5),
        0 0 40px rgba(226, 255, 67, 0.3);
}

.submit-button:active {
    transform: translateY(0);
}
	'
]

{ #category : 'styles' }
StyleLibrary >> signUpFormCss [

	^ '
:root {
    --emerald: #10B981;
    --mint: #34D399;
    --cyan: #06B6D4;
    --teal: #14B8A6;
    --dark: #0A0E14;
    --darker: #050810;
    --card: #151B26;
    --border: #1F2937;
    --text: #E5E7EB;
    --text-dim: #9CA3AF;
}

body {
    margin: 0;
    background: var(--darker);
}

.form-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    background: rgba(5, 8, 16, 0.7);
    backdrop-filter: blur(10px);    
    z-index: 100;    
    display: flex;
    justify-content: center;
    align-items: center;
}

.sign-up-form {
    max-width: 800px;
	 min-width: 500px;
    margin: 80px auto;
    padding: 40px;
    background: var(--card);
    border-radius: 16px;
    border: 1px solid var(--border);
    box-shadow: 
        0 8px 32px rgba(0, 0, 0, 0.4),
        0 0 0 1px rgba(16, 185, 129, 0.1);
    position: relative;
    overflow: hidden;
}

.sign-up-form::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 3px;
    background: linear-gradient(90deg, var(--emerald), var(--cyan));
    box-shadow: 0 0 15px rgba(16, 185, 129, 0.5);
}

.sign-up-form::after {
    content: "";
    position: absolute;
    top: 50%;
    right: -100px;
    width: 300px;
    height: 300px;
    background: radial-gradient(circle, rgba(16, 185, 129, 0.08), transparent 70%);
    transform: translateY(-50%);
    pointer-events: none;
    animation: form-glow 4s ease-in-out infinite;
}

@keyframes form-glow {
    0%, 100% { opacity: 0.5; transform: translateY(-50%) scale(1); }
    50% { opacity: 0.8; transform: translateY(-50%) scale(1.1); }
}

.close-button {
    position: absolute;
    top: 20px;
    right: 20px;
    font-size: 24px;
    color: var(--text-dim);
    cursor: pointer;
    line-height: 1;
    transition: all 0.3s ease;
    z-index: 102;
    text-decoration: none;
}

.close-button:hover {
    color: var(--emerald);
    transform: scale(1.2) rotate(90deg);
    text-shadow: 0 0 10px var(--emerald);
}

.sign-up-form h2 {
    font-family: "Outfit", sans-serif;
    font-size: 2rem;
    font-weight: 800;
    color: var(--text);
    margin: 0 0 32px 0;
    text-align: center;
    position: relative;
    z-index: 10;
}

.sign-up-form h2::after {
    content: "";
    display: block;
    width: 60px;
    height: 4px;
    background: linear-gradient(90deg, var(--emerald), var(--cyan));
    margin: 16px auto 0;
    border-radius: 2px;
    box-shadow: 0 0 10px var(--emerald);
}

.input-block {
    margin-bottom: 28px;
    position: relative;
    z-index: 10;
}

.value-label {
    font-family: "Lexend", sans-serif;
    font-size: 0.9rem;
    font-weight: 500;
    color: var(--text-dim);
    display: block;
    margin-bottom: 10px;
    transition: color 0.3s ease;
}

.value-input {
    font-family: "Lexend", sans-serif;
    width: 100%;
    padding: 14px 18px;
    font-size: 1rem;
    color: var(--text);
    background: rgba(255, 255, 255, 0.03);
    border: 1px solid var(--border);
    border-radius: 10px;
    outline: none;
    transition: all 0.3s ease;
    box-sizing: border-box;
}

.value-input::placeholder {
    color: var(--text-dim);
    opacity: 0.5;
}

.value-input:hover {
    background: rgba(255, 255, 255, 0.05);
    border-color: rgba(16, 185, 129, 0.3);
}

.value-input:focus {
    background: rgba(255, 255, 255, 0.06);
    border-color: var(--emerald);
    box-shadow: 
        0 0 0 3px rgba(16, 185, 129, 0.1),
        0 0 20px rgba(16, 185, 129, 0.2);
}

.input-block::before {
    content: "";
    position: absolute;
    left: 0;
    top: 28px;
    width: 3px;
    height: 0;
    background: linear-gradient(180deg, var(--emerald), var(--cyan));
    border-radius: 2px;
    transition: height 0.3s ease;
    box-shadow: 0 0 8px var(--emerald);
}

.input-block:focus-within::before {
    height: calc(100% - 28px);
}

.submit-button {
    font-family: "Lexend", sans-serif;
    font-size: 1rem;
    font-weight: 600;
    width: 100%;
    padding: 16px;
    color: var(--dark);
    background: linear-gradient(135deg, var(--emerald), var(--cyan));
    border: none;
    border-radius: 10px;
    cursor: pointer;
    margin-top: 12px;
    position: relative;
    overflow: hidden;
    transition: all 0.3s ease;
    box-shadow: 
        0 4px 16px rgba(16, 185, 129, 0.4),
        0 0 30px rgba(16, 185, 129, 0.2);
    z-index: 10;
}

.submit-button::before {
    content: "";
    position: absolute;
    top: 50%;
    left: 50%;
    width: 0;
    height: 0;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.3);
    transform: translate(-50%, -50%);
    transition: width 0.6s ease, height 0.6s ease;
}

.submit-button::after {
    content: "→";
    position: absolute;
    right: 20px;
    top: 50%;
    transform: translateY(-50%);
    font-size: 1.4rem;
    transition: transform 0.3s ease;
}

.submit-button:hover::before {
    width: 400px;
    height: 400px;
}

.submit-button:hover::after {
    transform: translateY(-50%) translateX(5px);
}

.submit-button:hover {
    transform: translateY(-2px);
    box-shadow: 
        0 8px 24px rgba(16, 185, 129, 0.6),
        0 0 40px rgba(16, 185, 129, 0.4);
}

.submit-button:active {
    transform: translateY(0);
}

@media (max-width: 640px) {
    .sign-up-form {
        max-width: 90%;
        padding: 32px 24px;
        margin: 40px auto;
    }
    
    .sign-up-form h2 {
        font-size: 1.6rem;
    }
    
    .username-input,
    .password-input {
        padding: 12px 16px;
        font-size: 0.95rem;
    }
    
    .submit-button {
        padding: 14px;
        font-size: 0.95rem;
    }
}
'
]

{ #category : 'styles' }
StyleLibrary >> testTaskConfigCss [

	^ '
@import url("https://fonts.googleapis.com/css2?family=Outfit:wght@400;600;700;800&family=Lexend:wght@500;600&display=swap");

.test-task-config-block {
    position: fixed;
    left: 280px;
    top: 0;
    right: 0;
    bottom: 0;
    background: var(--darker);
    padding: 30px;
    box-sizing: border-box;
    overflow-y: auto;
}

.test-task-config-block::-webkit-scrollbar {
    width: 6px;
}

.test-task-config-block::-webkit-scrollbar-track {
    background: var(--darker);
}

.test-task-config-block::-webkit-scrollbar-thumb {
    background: var(--emerald);
    border-radius: 3px;
}

.test-task-config-block::-webkit-scrollbar-thumb:hover {
    background: var(--mint);
}

.test-task-config-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 30px;
    padding-bottom: 20px;
    border-bottom: 1px solid var(--border);
    position: relative;
}

.test-task-config-header::after {
    content: "";
    position: absolute;
    bottom: -1px;
    left: 0;
    width: 120px;
    height: 2px;
    background: linear-gradient(90deg, var(--emerald), transparent);
    box-shadow: 0 0 10px var(--emerald);
    animation: header-line 3s ease-in-out infinite;
}

@keyframes header-line {
    0%, 100% { width: 120px; opacity: 0.6; }
    50% { width: 200px; opacity: 1; }
}

.test-task-config-header .topic-title {
    font-family: "Outfit", sans-serif;
    font-size: 2rem;
    font-weight: 800;
    color: var(--text);
    margin: 0;
    position: relative;
    padding-left: 20px;
}

.test-task-config-header .topic-title::before {
    content: "▸";
    position: absolute;
    left: 0;
    color: var(--emerald);
    font-size: 1.8rem;
    animation: title-pulse 2s ease-in-out infinite;
    filter: drop-shadow(0 0 8px var(--emerald));
}

@keyframes title-pulse {
    0%, 100% { opacity: 1; transform: translateX(0); }
    50% { opacity: 0.7; transform: translateX(4px); }
}

.create-task-button {
    font-family: "Lexend", sans-serif;
    font-size: 0.95rem;
    font-weight: 600;
    color: var(--dark);
    text-decoration: none;
    padding: 12px 24px;
    background: linear-gradient(135deg, var(--emerald), var(--cyan));
    border-radius: 10px;
    cursor: pointer;
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
    box-shadow: 
        0 4px 16px rgba(16, 185, 129, 0.4),
        0 0 30px rgba(16, 185, 129, 0.2);
    flex-shrink: 0;
}

.create-task-button::before {
    content: "";
    position: absolute;
    top: 50%;
    left: 50%;
    width: 0;
    height: 0;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.3);
    transform: translate(-50%, -50%);
    transition: width 0.6s ease, height 0.6s ease;
}

.create-task-button:hover::before {
    width: 300px;
    height: 300px;
}

.create-task-button:hover::after {
    transform: translateY(-50%) rotate(90deg);
}

.create-task-button:hover {
    transform: translateY(-2px);
    box-shadow: 
        0 8px 24px rgba(16, 185, 129, 0.6),
        0 0 40px rgba(16, 185, 129, 0.4);
}

.create-task-button:active {
    transform: translateY(0);
}

.test-tasks-block {
    position: relative;
}

.test-tasks-block::before {
    content: "";
    position: absolute;
    top: -20px;
    right: 10%;
    width: 400px;
    height: 400px;
    background: radial-gradient(circle, rgba(16, 185, 129, 0.06), transparent 70%);
    pointer-events: none;
    animation: block-pulse 5s ease-in-out infinite;
}

@keyframes block-pulse {
    0%, 100% { opacity: 0.4; transform: scale(1); }
    50% { opacity: 0.7; transform: scale(1.1); }
}

.test-tasks-block ul {
    list-style: none;
    padding: 0;
    margin: 0;
    display: flex;
    flex-direction: column;
    gap: 14px;
}

.test-task-config-block .not-found-message {
    text-align: center;
    padding: 80px 40px;
    margin: 60px auto;
    max-width: 500px;
    color: var(--text-dim);
    font-family: "Lexend", sans-serif;
    font-size: 1.2rem;
    font-weight: 500;
    background: rgba(255, 255, 255, 0.02);
    border: 2px dashed var(--border);
    border-radius: 16px;
    position: relative;
    animation: fade-in 0.5s ease;
}

@keyframes fade-in {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
}

.test-task-config-block .not-found-message::before {
    content: "📝";
    display: block;
    font-size: 4rem;
    margin-bottom: 20px;
    opacity: 0.5;
    animation: empty-float 3s ease-in-out infinite;
}

@keyframes empty-float {
    0%, 100% { transform: translateY(0); }
    50% { transform: translateY(-10px); }
}

.test-task-config-block .not-found-message::after {
    content: "";
    position: absolute;
    top: 10px;
    left: 10px;
    width: 30px;
    height: 30px;
    border-top: 2px solid var(--emerald);
    border-left: 2px solid var(--emerald);
    opacity: 0.3;
}

@media (max-width: 1024px) {
    .test-task-config-block {
        left: 240px;
        padding: 24px;
    }
    
    .test-task-config-header .topic-title {
        font-size: 1.6rem;
    }
}

@media (max-width: 768px) {
    .test-task-config-block {
        left: 70px;
        padding: 20px;
    }
    
    .test-task-config-header {
        flex-direction: column;
        align-items: flex-start;
        gap: 16px;
    }
    
    .test-task-config-header .topic-title {
        font-size: 1.4rem;
    }
    
    .create-task-button {
        width: 100%;
        text-align: center;
    }
    
    .test-task-config-block .not-found-message {
        padding: 60px 30px;
        font-size: 1rem;
    }
}

@media (max-width: 480px) {
    .test-task-config-block {
        left: 0;
        padding: 16px;
    }
    
    .test-task-config-header .topic-title {
        font-size: 1.2rem;
        padding-left: 16px;
    }
    
    .create-task-button {
        padding: 10px 20px;
        font-size: 0.9rem;
    }
}
'
]

{ #category : 'styles' }
StyleLibrary >> testTaskEditCss [
	^ '
@import url("https://fonts.googleapis.com/css2?family=Outfit:wght@400;600;700;800&family=Lexend:wght@500;600&display=swap");

.test-task-component-e {
    position: relative;
    background: rgba(21, 27, 38, 0.6);
    backdrop-filter: blur(10px);
    border: 1px solid var(--emerald);
    border-radius: 12px;
    padding: 20px;
    margin-bottom: 16px;
    transition: all 0.3s ease;
    overflow: hidden;
    box-shadow: 
        0 4px 16px rgba(0, 0, 0, 0.3), 
        0 0 20px rgba(16, 185, 129, 0.2);
}

.test-task-component-e::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 3px;
    background: linear-gradient(90deg, var(--emerald), var(--cyan));
    border-radius: 12px 12px 0 0;
    box-shadow: 0 0 15px var(--emerald);
}

.test-task-component-e::after {
    content: "";
    position: absolute;
    top: 50%;
    right: -50px;
    width: 200px;
    height: 200px;
    background: radial-gradient(circle, rgba(16, 185, 129, 0.12), transparent 70%);
    transform: translateY(-50%);
    pointer-events: none;
    animation: task-glow 4s ease-in-out infinite;
}

@keyframes task-glow {
    0%, 100% { opacity: 0.6; transform: translateY(-50%) scale(1); }
    50% { opacity: 0.9; transform: translateY(-50%) scale(1.1); }
}

.test-task-question-e {
    font-family: "Lexend", sans-serif;
    font-size: 1rem;
    color: var(--text);
    width: 100%;
    min-height: 100px;
    padding: 14px 18px;
    background: rgba(255, 255, 255, 0.03);
    border: 1px solid var(--border);
    border-radius: 10px;
    outline: none;
    transition: all 0.3s ease;
    box-sizing: border-box;
    resize: vertical;
    line-height: 1.6;
    margin-bottom: 16px;
    position: relative;
    z-index: 10;
}

.test-task-question-e::placeholder {
    color: var(--text-dim);
    opacity: 0.5;
}

.test-task-question-e:hover {
    background: rgba(255, 255, 255, 0.05);
    border-color: rgba(16, 185, 129, 0.3);
}

.test-task-question-e:focus {
    background: rgba(255, 255, 255, 0.06);
    border-color: var(--emerald);
    box-shadow: 
        0 0 0 3px rgba(16, 185, 129, 0.1),
        0 0 20px rgba(16, 185, 129, 0.2);
}

.answer-list-block {
    margin-bottom: 16px;
    max-height: 300px;
    overflow-y: auto;
    padding-right: 8px;
    position: relative;
    z-index: 10;
}

.answer-list-block::-webkit-scrollbar {
    width: 6px;
}

.answer-list-block::-webkit-scrollbar-track {
    background: var(--darker);
    border-radius: 3px;
}

.answer-list-block::-webkit-scrollbar-thumb {
    background: var(--emerald);
    border-radius: 3px;
}

.answer-list-block::-webkit-scrollbar-thumb:hover {
    background: var(--mint);
}

.answer-list-block ul {
    list-style: none;
    padding: 0;
    margin: 0;
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.not-found-message {
    text-align: center;
    padding: 40px 20px;
    margin: 0;
    color: var(--text-dim);
    font-family: "Lexend", sans-serif;
    font-size: 0.95rem;
    font-weight: 500;
    background: rgba(255, 255, 255, 0.02);
    border: 2px dashed var(--border);
    border-radius: 10px;
    position: relative;
    animation: fade-in 0.5s ease;
}

@keyframes fade-in {
    from { opacity: 0; transform: translateY(10px); }
    to { opacity: 1; transform: translateY(0); }
}

.not-found-message::before {
    content: "📋";
    display: block;
    font-size: 2.5rem;
    margin-bottom: 12px;
    opacity: 0.4;
}

.footer-e {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 16px;
    margin-top: 16px;
    padding-top: 16px;
    border-top: 1px solid var(--border);
    position: relative;
    z-index: 10;
}

.points-input-block {
    display: flex;
    align-items: center;
    gap: 12px;
    flex: 1;
}

.points-input-label {
    font-family: "Lexend", sans-serif;
    font-size: 0.9rem;
    font-weight: 500;
    color: var(--text-dim);
    white-space: nowrap;
}

.points-input {
    font-family: "Lexend", sans-serif;
    font-size: 0.95rem;
    color: var(--text);
    width: 80px;
    padding: 10px 14px;
    background: rgba(255, 255, 255, 0.03);
    border: 1px solid var(--border);
    border-radius: 8px;
    outline: none;
    transition: all 0.3s ease;
    box-sizing: border-box;
}

.points-input:hover {
    background: rgba(255, 255, 255, 0.05);
    border-color: rgba(16, 185, 129, 0.3);
}

.points-input:focus {
    background: rgba(255, 255, 255, 0.06);
    border-color: var(--emerald);
    box-shadow: 
        0 0 0 3px rgba(16, 185, 129, 0.1),
        0 0 15px rgba(16, 185, 129, 0.15);
}

.footer-e .edit-operations {
    display: flex;
    gap: 8px;
    flex-shrink: 0;
}

.footer-e .edit-save-button,
.footer-e .edit-cancel-button {
    width: 40px;
    height: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 8px;
    color: var(--text-dim);
    text-decoration: none;
    font-size: 1.3rem;
    cursor: pointer;
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
    flex-shrink: 0;
    border: none;
}

.footer-e .edit-save-button {
    background: rgba(16, 185, 129, 0.1);
    border: 1px solid var(--emerald);
}

.footer-e .edit-save-button::before {
    content: "";
    position: absolute;
    inset: 0;
    background: linear-gradient(135deg, rgba(16, 185, 129, 0.2), rgba(6, 182, 212, 0.2));
    opacity: 0;
    transition: opacity 0.3s ease;
}

.footer-e .edit-save-button:hover {
    color: var(--emerald);
    border-color: var(--mint);
    background: rgba(16, 185, 129, 0.15);
    transform: scale(1.1);
    box-shadow: 0 2px 8px rgba(16, 185, 129, 0.3);
}

.footer-e .edit-save-button:hover::before {
    opacity: 1;
}

.footer-e .edit-cancel-button {
    background: rgba(239, 68, 68, 0.1);
    border: 1px solid rgba(239, 68, 68, 0.3);
}

.footer-e .edit-cancel-button::before {
    content: "";
    position: absolute;
    inset: 0;
    background: linear-gradient(135deg, rgba(239, 68, 68, 0.2), rgba(248, 113, 113, 0.2));
    opacity: 0;
    transition: opacity 0.3s ease;
}

.footer-e .edit-cancel-button:hover {
    color: var(--error-red);
    border-color: var(--error-red);
    background: rgba(239, 68, 68, 0.15);
    transform: scale(1.1);
    box-shadow: 0 2px 8px rgba(239, 68, 68, 0.3);
}

.footer-e .edit-cancel-button:hover::before {
    opacity: 1;
}

.footer-e .edit-save-button:active,
.footer-e .edit-cancel-button:active {
    transform: scale(0.95);
}

@media (max-width: 768px) {
    .test-task-component-e {
        padding: 16px;
    }
    
    .test-task-question-e {
        min-height: 80px;
        padding: 12px 16px;
        font-size: 0.95rem;
    }
    
    .answer-list-block {
        max-height: 250px;
    }
    
    .footer-e {
        flex-direction: column;
        align-items: stretch;
    }
    
    .points-input-block {
        justify-content: space-between;
    }
    
    .footer-e .edit-operations {
        justify-content: flex-end;
    }
}

@media (max-width: 480px) {
    .test-task-component-e {
        padding: 14px;
    }
    
    .footer-e .edit-save-button,
    .footer-e .edit-cancel-button {
        width: 36px;
        height: 36px;
        font-size: 1.1rem;
    }
}
'
]

{ #category : 'styles' }
StyleLibrary >> testTaskViewCss [
	^ '
@import url("https://fonts.googleapis.com/css2?family=Outfit:wght@400;600;700;800&family=Lexend:wght@500;600&display=swap");

.test-task-component-v {
    position: relative;
    background: rgba(21, 27, 38, 0.4);
    backdrop-filter: blur(10px);
    border: 1px solid var(--border);
    border-radius: 12px;
    padding: 18px;
    margin-bottom: 14px;
    transition: all 0.3s ease;
    overflow: hidden;
}

.test-task-component-v::before {
    content: "";
    position: absolute;
    left: 0;
    top: 0;
    bottom: 0;
    width: 0;
    background: linear-gradient(180deg, var(--emerald), var(--cyan));
    transition: all 0.3s ease;
    box-shadow: 0 0 8px var(--emerald);
}

.test-task-component-v:hover {
    background: rgba(21, 27, 38, 0.6);
    border-color: rgba(16, 185, 129, 0.2);
    transform: translateX(4px);
}

.test-task-component-v:hover::before {
    width: 3px;
}

.test-task-question-v {
    font-family: "Lexend", sans-serif;
    font-size: 1rem;
    font-weight: 600;
    color: var(--text);
    margin: 0 0 16px 0;
    line-height: 1.6;
    padding-left: 16px;
    position: relative;
}

.test-task-question-v::before {
    content: "Q";
    position: absolute;
    left: 0;
    top: 0;
    font-family: "Outfit", sans-serif;
    font-size: 1.1rem;
    font-weight: 800;
    color: var(--emerald);
    opacity: 0.7;
}

.disabled-mode {
    pointer-events: none;
    opacity: 0.9;
}

.test-task-component-v .answer-list-block {
    margin-bottom: 16px;
    max-height: 300px;
    overflow-y: auto;
    padding-right: 8px;
}

.test-task-component-v .answer-list-block::-webkit-scrollbar {
    width: 6px;
}

.test-task-component-v .answer-list-block::-webkit-scrollbar-track {
    background: var(--darker);
    border-radius: 3px;
}

.test-task-component-v .answer-list-block::-webkit-scrollbar-thumb {
    background: rgba(16, 185, 129, 0.4);
    border-radius: 3px;
}

.test-task-component-v .answer-list-block::-webkit-scrollbar-thumb:hover {
    background: rgba(16, 185, 129, 0.6);
}

.test-task-component-v .answer-list-block ul {
    list-style: none;
    padding: 0;
    margin: 0;
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.test-task-component-v .not-found-message {
    text-align: center;
    padding: 30px 20px;
    margin: 0 0 16px 0;
    color: var(--text-dim);
    font-family: "Lexend", sans-serif;
    font-size: 0.9rem;
    font-weight: 500;
    background: rgba(255, 255, 255, 0.02);
    border: 1px dashed var(--border);
    border-radius: 10px;
    opacity: 0.7;
}

.test-task-component-v .not-found-message::before {
    content: "📋";
    display: block;
    font-size: 2rem;
    margin-bottom: 10px;
    opacity: 0.3;
}

.footer-v {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 16px;
    padding-top: 14px;
    border-top: 1px solid var(--border);
}

.footer-v .points-input-block {
    display: flex;
    align-items: center;
    gap: 10px;
    flex: 1;
}

.points-label {
    font-family: "Lexend", sans-serif;
    font-size: 0.85rem;
    font-weight: 500;
    color: var(--text-dim);
    white-space: nowrap;
}

.points-span {
    font-family: "Outfit", sans-serif;
    font-size: 1.1rem;
    font-weight: 700;
    color: var(--emerald);
    padding: 6px 12px;
    background: rgba(16, 185, 129, 0.08);
    border: 1px solid rgba(16, 185, 129, 0.3);
    border-radius: 6px;
    display: inline-block;
}

.operations-v {
    display: flex;
    gap: 8px;
    flex-shrink: 0;
}

.operations-v .edit-button {
    width: 36px;
    height: 36px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: rgba(255, 255, 255, 0.03);
    border: 1px solid var(--border);
    border-radius: 7px;
    color: var(--text-dim);
    text-decoration: none;
    font-size: 1.05rem;
    cursor: pointer;
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
}

.operations-v .edit-button::before {
    content: "";
    position: absolute;
    inset: 0;
    background: linear-gradient(135deg, rgba(16, 185, 129, 0.15), rgba(6, 182, 212, 0.15));
    opacity: 0;
    transition: opacity 0.3s ease;
}

.operations-v .edit-button:hover {
    color: var(--emerald);
    border-color: var(--emerald);
    background: rgba(16, 185, 129, 0.1);
    transform: scale(1.08);
    box-shadow: 0 2px 10px rgba(16, 185, 129, 0.3);
}

.operations-v .edit-button:hover::before {
    opacity: 1;
}

.operations-v .edit-button:nth-child(2) {
    border-color: rgba(239, 68, 68, 0.3);
}

.operations-v .edit-button:nth-child(2):hover {
    color: var(--error-red);
    border-color: var(--error-red);
    background: rgba(239, 68, 68, 0.1);
    box-shadow: 0 2px 10px rgba(239, 68, 68, 0.3);
}

.operations-v .edit-button:nth-child(2)::before {
    background: linear-gradient(135deg, rgba(239, 68, 68, 0.15), rgba(248, 113, 113, 0.15));
}

.operations-v .edit-button:active {
    transform: scale(0.95);
}

@media (max-width: 768px) {
    .test-task-component-v {
        padding: 16px;
    }
    
    .test-task-question-v {
        font-size: 0.95rem;
        padding-left: 14px;
    }
    
    .test-task-component-v .answer-list-block {
        max-height: 250px;
    }
    
    .footer-v {
        flex-direction: column;
        align-items: stretch;
    }
    
    .footer-v .points-input-block {
        justify-content: space-between;
    }
    
    .operations-v {
        justify-content: flex-end;
    }
}

@media (max-width: 480px) {
    .test-task-component-v {
        padding: 14px;
    }
    
    .operations-v .edit-button {
        width: 34px;
        height: 34px;
        font-size: 1rem;
    }
}
'
]

{ #category : 'styles' }
StyleLibrary >> topicComponentCss [
	^ '
@import url("https://fonts.googleapis.com/css2?family=Outfit:wght@400;600;700;800&family=Lexend:wght@500;600&display=swap");

:root {
    --emerald: #10B981;
    --mint: #34D399;
    --cyan: #06B6D4;
    --dark: #0A0E14;
    --darker: #050810;
    --card: #151B26;
    --border: #1F2937;
    --text: #E5E7EB;
    --text-dim: #9CA3AF;
    --error-red: #EF4444;
}

.topic-block {
    position: relative;
    background: rgba(21, 27, 38, 0.6);
    backdrop-filter: blur(10px);
    border: 1px solid var(--border);
    border-radius: 12px;
    padding: 20px;
    margin-bottom: 16px;
    transition: all 0.3s ease;
    overflow: hidden;
    z-index: 1;
}

.topic-block::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 3px;
    background: linear-gradient(90deg, var(--emerald), var(--cyan));
    border-radius: 12px 12px 0 0;
    opacity: 0;
    transition: opacity 0.3s ease;
}

.topic-block:hover::before {
    opacity: 1;
    box-shadow: 0 0 10px var(--emerald);
}

.topic-block::after {
    content: "";
    position: absolute;
    top: 50%;
    right: -50px;
    width: 200px;
    height: 200px;
    background: radial-gradient(circle, rgba(16, 185, 129, 0.08), transparent 70%);
    transform: translateY(-50%);
    pointer-events: none;
    opacity: 0;
    transition: opacity 0.3s ease;
}

.topic-block:hover {
    border-color: rgba(16, 185, 129, 0.3);
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.3), 0 0 20px rgba(16, 185, 129, 0.1);
    transform: translateY(-2px);
}

.topic-block:hover::after {
    opacity: 1;
}

.topic-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 12px;
    position: relative;
    z-index: 10;
}

.topic-title {
    font-family: "Outfit", sans-serif;
    font-size: 1.3rem;
    font-weight: 700;
    color: var(--text);
    margin: 0;
    position: relative;
    padding-left: 15px;
    transition: color 0.3s ease;
}

.topic-title::before {
    content: "•";
    position: absolute;
    left: 0;
    color: var(--emerald);
    font-size: 1.5rem;
    animation: title-pulse 2s ease-in-out infinite;
}

@keyframes title-pulse {
    0%, 100% { opacity: 0.6; }
    50% { opacity: 1; }
}

.topic-block:hover .topic-title {
    color: var(--emerald);
}

.topic-operations {
    display: flex;
    gap: 8px;
    align-items: center;
}

.edit-button {
    width: 36px;
    height: 36px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: rgba(255, 255, 255, 0.03);
    border: 1px solid var(--border);
    border-radius: 8px;
    color: var(--text-dim);
    text-decoration: none;
    font-size: 1.2rem;
    cursor: pointer;
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
}

.edit-button::before {
    content: "";
    position: absolute;
    inset: 0;
    background: linear-gradient(135deg, rgba(16, 185, 129, 0.15), rgba(6, 182, 212, 0.15));
    opacity: 0;
    transition: opacity 0.3s ease;
}

.edit-button:hover {
    color: var(--emerald);
    border-color: var(--emerald);
    background: rgba(16, 185, 129, 0.08);
    transform: scale(1.1);
    box-shadow: 0 2px 8px rgba(16, 185, 129, 0.2);
}

.edit-button:hover::before {
    opacity: 1;
}

.edit-button:active {
    transform: scale(0.95);
}

.edit-button:nth-child(2) {
    border-color: rgba(239, 68, 68, 0.2);
}

.edit-button:nth-child(2):hover {
    color: var(--error-red);
    border-color: var(--error-red);
    background: rgba(239, 68, 68, 0.08);
    box-shadow: 0 2px 8px rgba(239, 68, 68, 0.2);
}

.edit-button:nth-child(2)::before {
    background: linear-gradient(135deg, rgba(239, 68, 68, 0.15), rgba(248, 113, 113, 0.15));
}

.title-description {
    font-family: "Lexend", sans-serif;
    font-size: 0.95rem;
    color: var(--text-dim);
    line-height: 1.6;
    margin: 0;
    padding-left: 15px;
    position: relative;
    z-index: 10;
}

.title-description::before {
    content: "";
    position: absolute;
    left: 0;
    top: 0;
    bottom: 0;
    width: 2px;
    background: linear-gradient(180deg, var(--emerald), transparent);
    opacity: 0.3;
}

@media (max-width: 640px) {
    .topic-block {
        padding: 16px;
    }
    
    .topic-title {
        font-size: 1.1rem;
    }
    
    .edit-button {
        width: 32px;
        height: 32px;
        font-size: 1rem;
    }
    
    .title-description {
        font-size: 0.9rem;
    }
}
'
]

{ #category : 'styles' }
StyleLibrary >> topicConfigCss [

	^ '
@import url("https://fonts.googleapis.com/css2?family=Outfit:wght@400;600;700;800&family=Lexend:wght@500;600&display=swap");

body {
    margin: 0;
    padding: 0;
    background: var(--darker);
}

.topic-config-block {
    position: fixed;
    left: 280px;
    top: 0;
    right: 0;
    bottom: 0;
    background: var(--darker);
    padding: 30px;
    box-sizing: border-box;
    overflow-y: auto;
}

.topic-config-block::before {
    content: "";
    position: absolute;
    top: -50px;
    right: 10%;
    width: 400px;
    height: 400px;
    background: radial-gradient(circle, rgba(16, 185, 129, 0.06), transparent 70%);
    pointer-events: none;
    animation: config-pulse 5s ease-in-out infinite;
}

@keyframes config-pulse {
    0%, 100% { opacity: 0.4; transform: scale(1); }
    50% { opacity: 0.7; transform: scale(1.1); }
}

.topic-config-block::-webkit-scrollbar {
    width: 6px;
}

.topic-config-block::-webkit-scrollbar-track {
    background: var(--darker);
}

.topic-config-block::-webkit-scrollbar-thumb {
    background: var(--emerald);
    border-radius: 3px;
}

.topic-config-block::-webkit-scrollbar-thumb:hover {
    background: var(--mint);
}

.topic-config-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 30px;
    padding-bottom: 20px;
    border-bottom: 1px solid var(--border);
    position: relative;
}

.topic-config-header::after {
    content: "";
    position: absolute;
    bottom: -1px;
    left: 0;
    width: 100px;
    height: 2px;
    background: linear-gradient(90deg, var(--emerald), transparent);
    box-shadow: 0 0 10px var(--emerald);
    animation: line-expand 3s ease-in-out infinite;
}

@keyframes line-expand {
    0%, 100% { width: 100px; opacity: 0.6; }
    50% { width: 200px; opacity: 1; }
}

.section-title {
    font-family: "Outfit", sans-serif;
    font-size: 2rem;
    font-weight: 800;
    color: var(--text);
    margin: 0;
    position: relative;
    padding-left: 20px;
}

.section-title::before {
    content: "▸";
    position: absolute;
    left: 0;
    color: var(--emerald);
    font-size: 1.8rem;
    animation: arrow-pulse 2s ease-in-out infinite;
    filter: drop-shadow(0 0 8px var(--emerald));
}

@keyframes arrow-pulse {
    0%, 100% { opacity: 1; transform: translateX(0); }
    50% { opacity: 0.7; transform: translateX(4px); }
}

.add-topic-button {
    font-family: "Lexend", sans-serif;
    font-size: 0.95rem;
    font-weight: 600;
    color: var(--dark);
    text-decoration: none;
    background: linear-gradient(135deg, var(--emerald), var(--cyan));
    padding: 12px 28px;
    border-radius: 10px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
    transition: all 0.3s ease;
    box-shadow: 0 4px 16px rgba(16, 185, 129, 0.4), 0 0 30px rgba(16, 185, 129, 0.2);
    display: inline-flex;
    align-items: center;
    gap: 8px;
}

.add-topic-button::before {
    content: "";
    position: absolute;
    top: 50%;
    left: 50%;
    width: 0;
    height: 0;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.3);
    transform: translate(-50%, -50%);
    transition: width 0.5s ease, height 0.5s ease;
}

.add-topic-button:hover::before {
    width: 300px;
    height: 300px;
}

.add-topic-button:hover::after {
    transform: rotate(90deg);
}

.add-topic-button:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 24px rgba(16, 185, 129, 0.6), 0 0 40px rgba(16, 185, 129, 0.3);
}

.add-topic-button:active {
    transform: translateY(0);
}

.topic-config-block ul {
    list-style: none;
    padding: 0;
    margin: 0;
    display: flex;
    flex-direction: column;
    gap: 16px;
}

.not-found-message {
    text-align: center;
    padding: 80px 40px;
    margin: 60px auto;
    max-width: 500px;
    color: var(--text-dim);
    font-family: "Lexend", sans-serif;
    font-size: 1.2rem;
    font-weight: 500;
    background: rgba(255, 255, 255, 0.02);
    border: 2px dashed var(--border);
    border-radius: 16px;
    position: relative;
    animation: fade-in 0.5s ease;
}

@keyframes fade-in {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
}

.not-found-message::before {
    content: "📋";
    display: block;
    font-size: 4rem;
    margin-bottom: 20px;
    opacity: 0.5;
    animation: empty-float 3s ease-in-out infinite;
}

@keyframes empty-float {
    0%, 100% { transform: translateY(0); }
    50% { transform: translateY(-10px); }
}

.not-found-message::after {
    content: "";
    position: absolute;
    top: 10px;
    left: 10px;
    width: 30px;
    height: 30px;
    border-top: 2px solid var(--emerald);
    border-left: 2px solid var(--emerald);
    opacity: 0.3;
}

@media (max-width: 1024px) {
    .topic-config-block {
        left: 240px;
        padding: 24px;
    }
    
    .section-title {
        font-size: 1.6rem;
    }
}

@media (max-width: 768px) {
    .topic-config-block {
        left: 70px;
        padding: 20px;
    }
    
    .topic-config-header {
        flex-direction: column;
        align-items: flex-start;
        gap: 16px;
    }
    
    .section-title {
        font-size: 1.4rem;
    }
    
    .add-topic-button {
        width: 100%;
        justify-content: center;
    }
    
    .not-found-message {
        padding: 60px 30px;
        font-size: 1rem;
    }
}

@media (max-width: 480px) {
    .topic-config-block {
        left: 0;
        padding: 16px;
    }
}
'
]

{ #category : 'styles' }
StyleLibrary >> topicTabCss [
	^ '
@import url("https://fonts.googleapis.com/css2?family=Outfit:wght@400;600;700;800&family=Lexend:wght@500;600&display=swap");

.topic-tab-block {
    position: relative;
    background: rgba(21, 27, 38, 0.4);
    backdrop-filter: blur(10px);
    border: 1px solid var(--border);
    border-radius: 12px;
    padding: 16px 20px;
    margin-bottom: 12px;
    transition: all 0.3s ease;
    overflow: hidden;
    cursor: pointer;
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 16px;
}

.topic-tab-block::before {
    content: "";
    position: absolute;
    left: 0;
    top: 0;
    bottom: 0;
    width: 0;
    background: linear-gradient(180deg, var(--emerald), var(--cyan));
    transition: width 0.3s ease;
    box-shadow: 0 0 10px var(--emerald);
}

.topic-tab-block::after {
    content: "";
    position: absolute;
    top: 50%;
    right: -50px;
    width: 150px;
    height: 150px;
    background: radial-gradient(circle, rgba(16, 185, 129, 0.06), transparent 70%);
    transform: translateY(-50%);
    pointer-events: none;
    opacity: 0;
    transition: opacity 0.3s ease;
}

.topic-tab-block:hover::before {
    width: 4px;
}

.topic-tab-block:hover::after {
    opacity: 1;
}

.topic-tab-block:hover {
    background: rgba(21, 27, 38, 0.6);
    border-color: rgba(16, 185, 129, 0.3);
    transform: translateX(8px);
    box-shadow: 0 4px 16px rgba(16, 185, 129, 0.2);
}

.topic-title {
    font-family: "Outfit", sans-serif;
    font-size: 1.1rem;
    font-weight: 700;
    color: var(--text);
    margin: 0;
    position: relative;
    padding-left: 20px;
    flex: 1;
    transition: color 0.3s ease;
}

.topic-title::before {
    content: "▸";
    position: absolute;
    left: 0;
    color: var(--emerald);
    font-size: 1rem;
    opacity: 0;
    transition: all 0.3s ease;
    transform: translateX(-5px);
}

.topic-tab-block:hover .topic-title::before {
    opacity: 1;
    transform: translateX(0);
}

.topic-tab-block:hover .topic-title {
    color: var(--emerald);
}

.pick-topic-button {
    width: 36px;
    height: 36px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: rgba(255, 255, 255, 0.03);
    border: 1px solid var(--border);
    border-radius: 8px;
    color: var(--text-dim);
    text-decoration: none;
    font-size: 1.2rem;
    cursor: pointer;
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
    flex-shrink: 0;
}

.pick-topic-button::before {
    content: "";
    position: absolute;
    inset: 0;
    background: linear-gradient(135deg, rgba(16, 185, 129, 0.15), rgba(6, 182, 212, 0.15));
    opacity: 0;
    transition: opacity 0.3s ease;
}

.pick-topic-button:hover {
    color: var(--emerald);
    border-color: var(--emerald);
    background: rgba(16, 185, 129, 0.1);
    transform: scale(1.1) translateX(3px);
    box-shadow: 0 2px 8px rgba(16, 185, 129, 0.2);
}

.pick-topic-button:hover::before {
    opacity: 1;
}

.pick-topic-button:active {
    transform: scale(0.95);
}

.topic-tab-block {
    animation: tab-slide-in 0.3s ease;
}

@keyframes tab-slide-in {
    from {
        opacity: 0;
        transform: translateX(-20px);
    }
    to {
        opacity: 1;
        transform: translateX(0);
    }
}

@media (max-width: 640px) {
    .topic-tab-block {
        padding: 14px 16px;
    }
    
    .topic-title {
        font-size: 1rem;
        padding-left: 16px;
    }
    
    .pick-topic-button {
        width: 32px;
        height: 32px;
        font-size: 1rem;
    }
}
'
]

{ #category : 'styles' }
StyleLibrary >> userConfigCss [

	^ '
@import url("https://fonts.googleapis.com/css2?family=Outfit:wght@400;600;700;800&family=Lexend:wght@500;600&display=swap");

.user-config-block {
    position: fixed;
    left: 280px;
    top: 0;
    right: 0;
    bottom: 0;
    background: var(--darker);
    padding: 40px;
    box-sizing: border-box;
    overflow-y: auto;
    display: flex;
    flex-direction: column;
    gap: 40px;
}

.user-config-block::-webkit-scrollbar {
    width: 6px;
}

.user-config-block::-webkit-scrollbar-track {
    background: var(--darker);
}

.user-config-block::-webkit-scrollbar-thumb {
    background: var(--emerald);
    border-radius: 3px;
}

.user-config-block::-webkit-scrollbar-thumb:hover {
    background: var(--mint);
}

.greating-block {
    position: relative;
    padding: 50px 40px;
    background: linear-gradient(135deg, rgba(16, 185, 129, 0.1), rgba(6, 182, 212, 0.08));
    border: 1px solid var(--border);
    border-radius: 16px;
    overflow: hidden;
}

.greating-block::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 4px;
    background: linear-gradient(90deg, var(--emerald), var(--cyan));
    box-shadow: 0 0 15px rgba(16, 185, 129, 0.6);
}

.greating-block h1 {
    font-family: "Outfit", sans-serif;
    font-size: 2.5rem;
    font-weight: 800;
    color: var(--text);
    margin: 0;
    line-height: 1.2;
    position: relative;
    z-index: 10;
}

.user-info-block {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 24px;
    position: relative;
}

.username-block,
.useremail-block,
.operations-block {
    position: relative;
    padding: 28px 32px;
    background: rgba(21, 27, 38, 0.6);
    backdrop-filter: blur(10px);
    border: 1px solid var(--border);
    border-radius: 12px;
    transition: all 0.3s ease;
    overflow: hidden;
}

.username-block::before,
.useremail-block::before,
.operations-block::before {
    content: "";
    position: absolute;
    left: 0;
    top: 0;
    bottom: 0;
    width: 0;
    background: linear-gradient(180deg, var(--emerald), var(--cyan));
    transition: width 0.3s ease;
    box-shadow: 0 0 10px var(--emerald);
}

.username-block:hover::before,
.useremail-block:hover::before,
.operations-block:hover::before {
    width: 4px;
}

.username-block:hover,
.useremail-block:hover,
.operations-block:hover {
    background: rgba(21, 27, 38, 0.8);
    border-color: rgba(16, 185, 129, 0.3);
    transform: translateX(5px);
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.2);
}

.username-block h3,
.useremail-block h3 {
    font-family: "Lexend", sans-serif;
    font-size: 0.9rem;
    font-weight: 600;
    color: var(--text-dim);
    margin: 0 0 12px 0;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.username-block span,
.useremail-block span {
    font-family: "Outfit", sans-serif;
    font-size: 1.4rem;
    font-weight: 700;
    color: var(--emerald);
    display: block;
    line-height: 1.3;
    word-break: break-word;
}

.operations-block {
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 120px;
}

.edit-user-button {
    font-family: "Lexend", sans-serif;
    font-size: 1rem;
    font-weight: 600;
    color: var(--dark);
    text-decoration: none;
    padding: 14px 28px;
    background: linear-gradient(135deg, var(--emerald), var(--cyan));
    border-radius: 10px;
    cursor: pointer;
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
    box-shadow: 
        0 4px 16px rgba(16, 185, 129, 0.4),
        0 0 30px rgba(16, 185, 129, 0.2);
    display: inline-block;
}

.edit-user-button::before {
    content: "";
    position: absolute;
    top: 50%;
    left: 50%;
    width: 0;
    height: 0;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.3);
    transform: translate(-50%, -50%);
    transition: width 0.6s ease, height 0.6s ease;
}

.edit-user-button:hover::before {
    width: 300px;
    height: 300px;
}

.edit-user-button:hover::after {
    transform: translateY(-50%) translateX(3px);
}

.edit-user-button:hover {
    transform: translateY(-2px);
    box-shadow: 
        0 8px 24px rgba(16, 185, 129, 0.6),
        0 0 40px rgba(16, 185, 129, 0.4);
}

.edit-user-button:active {
    transform: translateY(0);
}

@media (max-width: 1024px) {
    .user-config-block {
        left: 240px;
        padding: 32px;
    }
    
    .greating-block h1 {
        font-size: 2rem;
    }
}

@media (max-width: 768px) {
    .user-config-block {
        left: 70px;
        padding: 24px;
        gap: 32px;
    }
    
    .greating-block {
        padding: 40px 30px;
    }
    
    .greating-block h1 {
        font-size: 1.8rem;
    }
    
    .user-info-block {
        grid-template-columns: 1fr;
        gap: 20px;
    }
    
    .username-block,
    .useremail-block,
    .operations-block {
        padding: 24px 28px;
    }
    
    .username-block span,
    .useremail-block span {
        font-size: 1.2rem;
    }
}

@media (max-width: 480px) {
    .user-config-block {
        left: 0;
        padding: 20px;
        gap: 24px;
    }
    
    .greating-block {
        padding: 32px 24px;
    }
    
    .greating-block h1 {
        font-size: 1.5rem;
    }
    
    .username-block,
    .useremail-block,
    .operations-block {
        padding: 20px 24px;
    }
    
    .username-block h3,
    .useremail-block h3 {
        font-size: 0.8rem;
    }
    
    .username-block span,
    .useremail-block span {
        font-size: 1.1rem;
    }
    
    .edit-user-button {
        padding: 12px 24px;
        font-size: 0.95rem;
    }
}
'
]
