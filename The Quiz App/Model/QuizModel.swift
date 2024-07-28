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
}

struct Question: Codable {
    var questionTitle: String
    var answers: [String]
    var correctAnswer: String
}
