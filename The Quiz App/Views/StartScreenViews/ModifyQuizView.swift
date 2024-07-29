//
//  ModifyQuizView.swift
//  The Quiz App
//
//  Created by Nils on 7/29/24.
//

import SwiftUI

struct ModifyQuizView: View {
    
    @State var quiz: QuizModel
    var body: some View {
        NavigationStack {
            ZStack {
                AppColor.background.ignoresSafeArea()
                Form {
                    Section("Quiz Title") {
                        TextField("Enter a Quiz Title", text: $quiz.title)
                    }
                    .listRowBackground(AppColor.accent.blur(radius: 50))
                    Section("Question & Answers") {
                        ForEach(quiz.questions.indices, id: \.self) { atIndex in
                            NavigationLink("\(quiz.questions[atIndex].questionTitle.isEmpty ? "New Question" : quiz.questions[atIndex].questionTitle)") {
                                ModifyQuestionView(question: $quiz.questions[atIndex])
                            }
                        }
                        Button(action: {
                            quiz.questions.append(Question())
                        }) {
                            HStack {
                                Spacer()
                                Image(systemName: "plus")
                                Spacer()
                            }
                        }
                    }
                    .listRowBackground(AppColor.accent.blur(radius: 50))
                }
                .scrollContentBackground(.hidden)
            }
            .tint(AppColor.accent)
        }
    }
}

#Preview {
    ModifyQuizView(quiz: QuizModel(title: "Test Quiz", questions: [Question(questionTitle: "Test Question", answers: ["Yes","No"], correctAnswer: "Yes")]))
}
