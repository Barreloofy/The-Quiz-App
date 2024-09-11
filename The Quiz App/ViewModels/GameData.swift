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
    
    func increment() -> Bool {
        if questionCount < quizQuestions.count-1 {
            questionCount += 1
            return false
        } else {
            return true
        }
    }
    
    func increment(_ loggedAnswer: String?) {
        guard let answer = loggedAnswer else { return }
        if answer == quizCorrectAnswer {
            correctGuessCount += 1
        }
    }
    
    func scoreMessage() -> String {
        let score = Double(correctGuessCount) / Double(quizQuestions.count)
        switch score {
        case 1.0:
            return "Perfect score!"
        case 0.8...0.99:
            return "Great job!"
        case 0.5...0.79:
            return "Good effort!"
        case 0.0...0.49:
            return "Keep trying!"
        default:
            return "Invalid score"
        }
    }
    
    init(currentQuiz: QuizModel) {
        self.currentQuiz = currentQuiz
    }
}
