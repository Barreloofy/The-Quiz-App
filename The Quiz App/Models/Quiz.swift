//
//  Quiz.swift
//  The Quiz App
//
//  Created by Nils on 7/28/24.
//

import Foundation

struct Quiz: Identifiable,Codable {
    var id = UUID()
    
    var title: String
    var questions: [Question]
    
    func returnIndex(_ question: Question) -> Int? {
        guard let index = questions.firstIndex(where: { $0.id == question.id }) else { return nil }
        return index
    }
    
    func validQuiz() -> Bool {
        self.title.isEmpty || 
        self.questions.isEmpty ||
        self.questions[0].questionTitle.isEmpty ||
        (self.questions[0].answers.isEmpty || self.questions[0].answers[0].answerText == "") 
        ? true : false
    }
    
    init() {
        title = ""
        questions = [Question]()
    }
}

struct Question: Identifiable,Codable {
    var id = UUID()
    
    var questionTitle: String
    var answers: [Answer]  {
        didSet {
            guard !answers.isEmpty else { return }
            
            guard let firstAnswer = answers.first else { return }
            for answer in answers {
                if answer.answerText == correctAnswer {
                    return
                } else {
                    continue
                }
            }
            correctAnswer = firstAnswer.answerText
        }
    }
    
    var correctAnswer: String
    
    var pickerProvider: [String] {
        guard let firstElement = answers.first else { return ["-"] }
        return !firstElement.answerText.isEmpty ? answers.map { $0.answerText } : ["-"]
    }
    
    func titleIsEmpty() -> (Bool, String) {
        let title = self.questionTitle
        return title.isEmpty ? (true,"") : (false,title)
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

#if DEBUG
extension Question {
    
    init(questionTitle: String, answers: [Answer], correctAnswer: String) {
        self.questionTitle = questionTitle
        self.answers = answers
        self.correctAnswer = correctAnswer
    }
    
    static let testQuestion = Question(questionTitle: "Test Question", answers: [Answer(answerText: "Yes"),Answer(answerText: "No"),Answer(answerText: "Maybe")], correctAnswer: "Yes")
}

extension Quiz {
    init(title: String, questions: [Question]) {
        self.title = title
        self.questions = questions
    }
    
    static let testQuiz = Quiz(title: "Test Quiz", questions: [Question.testQuestion])
}

#endif
