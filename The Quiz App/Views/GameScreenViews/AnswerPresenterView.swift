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
    var body: some View {
        LazyHGrid(rows: Array(repeating: GridItem(.fixed(50)), count: 2)) {
            ForEach(question.answers) { answer in
                Text(answer.answerText)
                    .containerRelativeFrame(.horizontal) { length, _ in
                        length / 3
                    }
                    .padding(5)
                    .border(AppColor.gradient, width: 3)
                    .padding(5)
                    .border(loggedAnswer == answer.answerText ? .black : .clear, width: 2)
                    .onTapGesture {
                        loggedAnswer = answer.answerText
                    }
            }
        }
    }
}

#Preview {
    AnswerPresenterView(question: Question(questionTitle: "Test Question", answers: [Answer(answerText: "Answer 1"),Answer(answerText: "Answer 2"),Answer(answerText: "Answer  3"),Answer(answerText: "Answer 4")], correctAnswer: "Answer 1"),loggedAnswer: .constant(nil))
}
