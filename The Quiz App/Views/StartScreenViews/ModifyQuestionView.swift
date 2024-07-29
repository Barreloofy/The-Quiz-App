//
//  ModifyQuestionView.swift
//  The Quiz App
//
//  Created by Nils on 7/29/24.
//

import SwiftUI

struct ModifyQuestionView: View {
    
    @Binding var question: Question
    var body: some View {
        ZStack {
            AppColor.background.ignoresSafeArea()
            Form {
                Section("Question") {
                    ZStack {
                        if question.questionTitle.isEmpty {
                            TextEditor(text: .constant("Question"))
                                .opacity(0.25)
                        }
                        TextEditor(text: $question.questionTitle)
                        Text(question.questionTitle)
                            .opacity(0)
                    }
                }
                .listRowBackground(AppColor.accent.blur(radius: 50))
                Section("Answers") {
                    ForEach(question.answers.indices, id: \.self) { atIndex in
                        TextField("Answer", text: $question.answers[atIndex])
                    }
                    .onDelete(perform: { indexSet in
                        question.answers.remove(atOffsets: indexSet)
                    })
                    Button(action: {
                        question.answers.append("")
                    }) {
                        Image(systemName: "plus")
                    }
                }
                .listRowBackground(AppColor.accent.blur(radius: 50))
            }
            .scrollContentBackground(.hidden)
        }
        .tint(AppColor.accent)
    }
}

#Preview {
    ModifyQuestionView(question: .constant(Question(questionTitle: "Test Question", answers: ["Yes","No","Maybe"], correctAnswer: "Yes")))
}
