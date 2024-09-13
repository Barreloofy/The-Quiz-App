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
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(5)
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(style: StrokeStyle())
                                .background {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Material.ultraThin)
                                        .opacity(0.3)
                                }
                        }
                        .padding(5)
                        .shadow(
                            color: loggedAnswer == answer.answerText ? AppColor.accent.opacity(0.5) : .clear,
                            radius: loggedAnswer == answer.answerText ? 15 : 0,
                            x: 0,
                            y: 0)
                        .scaleEffect(loggedAnswer == answer.answerText ? 1.1 : 1.0 )
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
