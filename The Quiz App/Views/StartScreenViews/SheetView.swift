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
    var body: some View {
        NavigationStack {
            ZStack {
                AppColor.background.ignoresSafeArea()
                VStack {
                    if !quizData.quizArray.isEmpty {
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
                        }
                        .scrollContentBackground(.hidden)
                    } else {
                        VStack {
                            Spacer()
                            Text("No quiz yet, let`s add some!")
                                .multilineTextAlignment(.center)
                                .font(.system(size: 35))
                                .bold()
                            Spacer()
                            Spacer()
                        }
                    }
                    Button(action: {
                        quizData.add()
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationTitle("Edit")
        }
    }
}

#Preview {
    SheetView(isShowingSheet: .constant(true))
        .environmentObject(QuizData())
}
