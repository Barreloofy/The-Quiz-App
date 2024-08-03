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
            ForEach(question.answers, id: \.self) { answer in
                Text(answer)
                    .containerRelativeFrame(.horizontal) { length, _ in
                        length / 3
                    }
                    .padding(5)
                    .border(AppColor.gradient, width: 3)
                    .padding(5)
                    .border(loggedAnswer == answer ? .black : .clear, width: 2)
                    .onTapGesture {
                        loggedAnswer = answer
                    }
            }
        }
    }
}

#Preview {
    AnswerPresenterView(question: Question(questionTitle: "Test Question", answers: ["Answer 1","Answer 2","Answer 3","Answer 4"], correctAnswer: "Answer 1"),loggedAnswer: .constant(nil))
}
