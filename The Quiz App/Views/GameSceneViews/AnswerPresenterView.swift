//
//  AnswerPresenterView.swift
//  The Quiz App
//
//  Created by Nils on 8/1/24.
//

import SwiftUI

struct AnswerPresenterView: View {
    
    var question: Question
    @Binding var loggedAnswer: String?
    
    private let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(question.answers) { answer in
                    Text(answer.answerText)
                        .frame(maxWidth: .infinity)
                        .padding(5)
                        .border(AppColor.gradient, width: 3)
                        .padding(5)
                        .border(loggedAnswer == answer.answerText ? .black : .clear, width: 2)
                        .onTapGesture {
                            loggedAnswer = answer.answerText
                        }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AnswerPresenterView(question: Question(questionTitle: "Test Question", answers: [Answer(answerText: "Answer 1"),Answer(answerText: "Answer 2"),Answer(answerText: "Answer  3"),Answer(answerText: "Answer 4")], correctAnswer: "Answer 1"),loggedAnswer: .constant(nil))
}
