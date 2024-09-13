//
//  SheetView.swift
//  The Quiz App
//
//  Created by Nils on 7/29/24.
//

import SwiftUI

struct SheetView: View {
    
    @EnvironmentObject private var viewModel: QuizArrayViewModel
    @Binding var isShowingSheet: Bool
    @Environment(\.dismiss) private var dismiss
    @State private var isPressed = true
    var body: some View {
        NavigationStack {
            ZStack {
                AppColor.background.ignoresSafeArea()
                VStack {
                    if !viewModel.empty {
                        List {
                            ForEach(viewModel.quizArray) { quiz in
                                NavigationLink(destination: ModifyQuizView(quiz: quiz)) {
                                    Text("\(quiz.title.isEmpty ? "New Quiz" : quiz.title)")
                                }
                            }
                            .onDelete(perform: { indexSet in
                                viewModel.remove(indexSet)
                            })
                                .listRowBackground(AppColor.accent.blur(radius: 50))
                            
                            AddButton(title: "Add Quiz", action: { viewModel.add() })
                                .listRowBackground(Color.clear)
                        }
                        .scrollContentBackground(.hidden)
                        .listRowSpacing(10)
                        .shadow(radius: 30)
                    } else {
                        VStack {
                            Spacer()
                            Text("Nothing here yet, let's add some!")
                                .multilineTextAlignment(.center)
                                .font(.system(size: 35))
                                .bold()
                            AddButton(title: "Add Quiz", action: { viewModel.add() })
                            .padding()
                            .shadow(radius: 30)
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
            .toolbarBackground(.ultraThinMaterial, for: .automatic)
        }
    }
}

#Preview {
    SheetView(isShowingSheet: .constant(true))
        .environmentObject(QuizArrayViewModel())
}


/*
 NavigationLink(destination: ModifyQuizView(quiz: quiz)) {
     Text("\(quiz.title.isEmpty ? "New Quiz" : quiz.title)")
 }
 */
