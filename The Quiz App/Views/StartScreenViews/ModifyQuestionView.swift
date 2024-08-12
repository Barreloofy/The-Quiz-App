//
//  ModifyQuestionView.swift
//  The Quiz App
//
//  Created by Nils on 7/29/24.
//

import SwiftUI

struct ModifyQuestionView: View {
    
    @Binding var question: Question
    @Environment (\.dismiss) private var dismiss
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
                    ForEach(question.answers) { answer in
                        TextField("Answer", text: $question.answers[question.returnIndex(answer)!].answerText)
                    }
                    .onDelete(perform: { indexSet in
                        question.answers.remove(atOffsets: indexSet)
                    })
                    HStack {
                        Spacer()
                        Button(action: {
                            question.answers.append(Answer(answerText: ""))
                        }) {
                            Image(systemName: "plus")
                        }
                        Spacer()
                    }
                }
                .listRowBackground(AppColor.accent.blur(radius: 50))
                Section("") {
                    Picker("Correct Answer:", selection: $question.correctAnswer) {
                        ForEach(question.pickerProvider, id: \.self) { answers in
                            Text(answers)
                        }
                    }
                    .onChange(of: question.pickerProvider) {
                        if question.pickerProvider != ["-"] {
                            question.correctAnswer = question.answers.first?.answerText ?? ""
                        }
                    }
                }
                .listRowBackground(AppColor.accent.blur(radius: 50))
                .tint(AppColor.accent).contrast(1.2)
                .pickerStyle(InlinePickerStyle())
            }
            .scrollContentBackground(.hidden)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Done") {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    ModifyQuestionView(question: .constant(Question(questionTitle: "Test Question", answers: [Answer(answerText: "Yes"),Answer(answerText: "No"),Answer(answerText: "Maybe")], correctAnswer: "Yes")))
}
