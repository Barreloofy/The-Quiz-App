//
//  QuizModel.swift
//  The Quiz App
//
//  Created by Nils on 7/28/24.
//

import Foundation

struct QuizModel: Identifiable,Codable {
    var id = UUID()
    
    var title: String
    var questions: [Question]
    
    // only used for #preview
    init(title: String, questions: [Question]) {
        self.title = title
        self.questions = questions
    }
    init() {
        title = ""
        questions = [Question]()
    }
}

struct Question: Codable {
    var questionTitle: String
    var answers: [String]
    var correctAnswer: String
    
    // only used for #Preview
    init(questionTitle: String, answers: [String], correctAnswer: String) {
        self.questionTitle = questionTitle
        self.answers = answers
        self.correctAnswer = correctAnswer
    }
    init() {
        questionTitle = ""
        answers = [String]()
        correctAnswer = ""
    }
}
