//
//  AnswerPresenterView.swift
//  The Quiz App
//
//  Created by Nils on 8/1/24.
//

import SwiftUI

struct AnswerPresenterView: View {
    
    let gradient = LinearGradient(stops: [.init(color: .white.opacity(0.3), location: 0),.init(color: .orange.opacity(0.5), location: 0.4),.init(color: .orange, location: 0.5)], startPoint: .topLeading, endPoint: .bottomTrailing)
    var question: Question
    var body: some View {
        LazyHGrid(rows: Array(repeating: GridItem(.fixed(50)), count: 2)) {
            ForEach(question.answers, id: \.self) { answer in
                Text(answer)
                    .containerRelativeFrame(.horizontal) { length, _ in
                        length / 3
                    }
                    .padding(5)
                    .border(gradient, width: 3)
            }
        }
    }
}

#Preview {
    AnswerPresenterView(question: Question(questionTitle: "Test Question", answers: ["Answer 1","Answer 2","Answer 3","Answer 4"], correctAnswer: "Answer 1"))
}
