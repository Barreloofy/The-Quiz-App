//
//  GameData.swift
//  The Quiz App
//
//  Created by Nils on 7/28/24.
//

import Foundation

class GameData: ObservableObject {
    
    @Published private(set) var questionCount = 0
    private(set) var correctGuessCount = 0
    let currentQuiz: QuizModel
    
    var quizQuestions: [Question] {
        currentQuiz.questions
    }
    
    var currentQuestion: Question {
        quizQuestions[questionCount]
    }
    
    private var quizCorrectAnswer: String {
        quizQuestions[questionCount].correctAnswer
    }
    
    func increment() {
        if questionCount < quizQuestions.count-1 {
            questionCount += 1
        }
    }
    
    func increment(_ loggedAnswer: String) {
        if loggedAnswer == quizCorrectAnswer {
            correctGuessCount += 1
        }
    }
    
    init(currentQuiz: QuizModel) {
        self.currentQuiz = currentQuiz
    }
}
