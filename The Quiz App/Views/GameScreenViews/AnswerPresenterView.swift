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
                Text(answer.answer)
                    .containerRelativeFrame(.horizontal) { length, _ in
                        length / 3
                    }
                    .padding(5)
                    .border(AppColor.gradient, width: 3)
                    .padding(5)
                    .border(loggedAnswer == answer.answer ? .black : .clear, width: 2)
                    .onTapGesture {
                        loggedAnswer = answer.answer
                    }
            }
        }
    }
}

#Preview {
    AnswerPresenterView(question: Question(questionTitle: "Test Question", answers: [Answer(answer: "Answer 1"),Answer(answer: "Answer 2"),Answer(answer: "Answer  3"),Answer(answer: "Answer 4")], correctAnswer: "Answer 1"),loggedAnswer: .constant(nil))
}
