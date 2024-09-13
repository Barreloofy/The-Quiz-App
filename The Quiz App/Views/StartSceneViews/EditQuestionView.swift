//
//  EditQuestionView.swift
//  The Quiz App
//
//  Created by Nils on 7/29/24.
//

import SwiftUI

struct EditQuestionView: View {
    
    @Binding var question: Question
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack {
            AppColor.background.ignoresSafeArea()
            Form {
                Group {
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
                    
                    Section("Answer") {
                        ForEach(question.answers.indices, id: \.self) { index in
                            TextField("Answer", text: $question.answers[index].answerText)
                        }
                        .onDelete(perform: { indexSet in
                            question.answers.remove(atOffsets: indexSet)
                        })
                    }
                    
                    Section {
                        AddButton(title: "Add Answer", action: { question.answers.append(Answer(answerText: "")) })
                            .listRowBackground(Color.clear)
                    }
                    
                    Section("Correct Answer") {
                        Picker("", selection: $question.correctAnswer) {
                            ForEach(question.pickerProvider, id: \.self) { answer in
                                Text(answer)
                            }
                        }
                        .labelsHidden()
                    }
                    .tint(AppColor.accent).contrast(1.2)
                    .pickerStyle(InlinePickerStyle())
                }
                .listRowBackground(AppColor.accent.blur(radius: 50))
            }
            .scrollContentBackground(.hidden)
            .shadow(radius: 30)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Done") {
                    dismiss()
                }
            }
        }
        .toolbarBackground(.ultraThinMaterial, for: .automatic)
    }
}

#Preview {
    EditQuestionView(question: .constant(Question.testQuestion))
}
