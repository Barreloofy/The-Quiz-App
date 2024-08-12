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
    
    func titleIsEmpty(_ question: Question) -> (Bool, String) {
        let title = question.questionTitle
        return title.isEmpty ? (true,"") : (false,title)
    }
    
    func returnIndex(_ question: Question) -> Int? {
        guard let index = questions.firstIndex(where: { $0.id == question.id }) else { return nil }
        return index
    }
    
    func validQuiz() -> Bool {
        self.title.isEmpty || self.questions.isEmpty || self.questions[0].questionTitle.isEmpty || (self.questions[0].answers.isEmpty || self.questions[0].answers[0].answerText == "") ? true : false
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

struct Question: Identifiable,Codable {
    var id = UUID()
    
    var questionTitle: String
    var answers: [Answer]
    var correctAnswer: String
    
    var pickerProvider: [String] {
        guard let firstElement = answers.first else { return ["-"] }
        if firstElement.answerText != "" {
            var answerArray = [String]()
            for answer in answers {
                answerArray.append(answer.answerText)
            }
            return answerArray
        } else {
            return ["-"]
        }
    }
    
    func returnIndex(_ answer: Answer) -> Int? {
        guard let index = self.answers.firstIndex(where: { $0.id == answer.id }) else { return nil }
        return index
    }
    
    enum CodingKeys: String,CodingKey {
        case id
        case questionTitle
        case answers
        case correctAnswer
    }
    
    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        id = try value.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
        questionTitle = try value.decode(String.self, forKey: .questionTitle)
        answers = try value.decode([Answer].self, forKey: .answers)
        correctAnswer = try value.decode(String.self, forKey: .correctAnswer)
    }
    
    // only used for #Preview
    init(questionTitle: String, answers: [Answer], correctAnswer: String) {
        self.questionTitle = questionTitle
        self.answers = answers
        self.correctAnswer = correctAnswer
    }
    init() {
        questionTitle = ""
        answers = [Answer]()
        correctAnswer = ""
    }
}

struct Answer: Identifiable,Codable {
    var id = UUID()
    
    var answerText: String
}
