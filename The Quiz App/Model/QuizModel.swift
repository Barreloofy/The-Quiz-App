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
    
    func titleIsEmpty(_ atIndex: Int) -> (Bool, String) {
        let title = questions[atIndex].questionTitle
        return title.isEmpty ? (true,"") : (false,title)
    }
    
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
    
    var pickerProvider: [String] {
        guard let firstElement = answers.first else { return ["-"] }
        if firstElement != "" {
            return answers
        } else {
            return ["-"]
        }
    }
    
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
