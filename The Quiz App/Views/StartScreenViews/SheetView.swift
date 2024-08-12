//
//  SheetView.swift
//  The Quiz App
//
//  Created by Nils on 7/29/24.
//

import SwiftUI

struct SheetView: View {
    
    @EnvironmentObject private var quizData: QuizData
    @Binding var isShowingSheet: Bool
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack {
            ZStack {
                AppColor.background.ignoresSafeArea()
                VStack {
                    if !quizData.empty {
                        List {
                            ForEach(quizData.quizArray) { quiz in
                                NavigationLink("\(quiz.title.isEmpty ? "New Quiz" : quiz.title)") {
                                    ModifyQuizView(quiz: quiz)
                                }
                            }
                            .onDelete(perform: { indexSet in
                                quizData.remove(indexSet)
                            })
                            .listRowBackground(AppColor.accent.blur(radius: 50))
                            HStack {
                                Spacer()
                                Button(action: {
                                    quizData.add()
                                }) {
                                    Image(systemName: "plus")
                                }
                                Spacer()
                            }
                            .listRowBackground(AppColor.accent.blur(radius: 50))
                        }
                        .scrollContentBackground(.hidden)
                    } else {
                        VStack {
                            Spacer()
                            Text("Nothing here yet, let's add some!")
                                .multilineTextAlignment(.center)
                                .font(.system(size: 35))
                                .bold()
                            Button(action: {
                                quizData.add()
                            }) {
                                Image(systemName: "plus")
                            }
                            Spacer()
                            Spacer()
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Edit")
                        .font(.system(size: 35))
                        .bold()
                        .underline()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    SheetView(isShowingSheet: .constant(true))
        .environmentObject(QuizData())
}
