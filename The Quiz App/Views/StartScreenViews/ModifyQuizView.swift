//
//  ModifyQuizView.swift
//  The Quiz App
//
//  Created by Nils on 7/29/24.
//

import SwiftUI

struct ModifyQuizView: View {
    
    @EnvironmentObject private var quizData: QuizData
    @State var quiz: QuizModel
    @Environment(\.dismiss) private var dismiss
    @State private var showAlert = false
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
                        ForEach(quiz.questions) { question in
                            let (isEmpty,title) = quiz.titleIsEmpty(question)
                            NavigationLink("\(isEmpty ? "New Question" : title)") {
                                ModifyQuestionView(question: $quiz.questions[quiz.returnIndex(question)!])
                            }
                        }
                        .onDelete(perform: { indexSet in
                            quiz.questions.remove(atOffsets: indexSet)
                        })
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
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        if quiz.validQuiz() {
                            showAlert.toggle()
                        } else {
                            quizData.saveModifiedQuiz(quiz)
                            dismiss()
                        }
                    }
                    .alert("A quiz needs a title, question, and answer.", isPresented: $showAlert) {
                        Button("OK") {}
                            .tint(AppColor.accent)
                    }
                }
            }
        }
    }
}

#Preview {
    ModifyQuizView(quiz: QuizModel(title: "Test Quiz", questions: [Question(questionTitle: "Test Question", answers: [Answer(answerText: "Yes"),Answer(answerText: "No")], correctAnswer: "Yes")]))
}
