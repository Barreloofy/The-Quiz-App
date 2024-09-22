//
//  StartScene.swift
//  The Quiz App
//
//  Created by Nils on 7/29/24.
//

import SwiftUI

struct StartScene: View {
    
    @EnvironmentObject private var viewModel: QuizArrayViewModel
    @State private var isShowingSheet = false
    var body: some View {
        NavigationStack {
            ZStack {
                AppColor.background.ignoresSafeArea()
                if !viewModel.validQuizArray.isEmpty {
                    List {
                        ForEach(viewModel.validQuizArray) { quiz in
                            NavigationLink("\(quiz.title)") {
                                GameScene(viewModel: GameViewModel(currentQuiz: quiz))
                            }
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
                        Spacer()
                        Spacer()
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Quiz App")
                        .font(.system(size: 35))
                        .bold()
                        .underline()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isShowingSheet.toggle()
                    }) {
                        Image(systemName: "plus.app")
                    }
                    .sheet(isPresented: $isShowingSheet) {
                        SheetView(isShowingSheet: $isShowingSheet)
                    }
                    .shadow(radius: 10)
                    .buttonStyle(SimpleButtonStyle(tint: Color.black))
                }
            }
            .tint(.black)
            .toolbarBackground(.ultraThinMaterial, for: .automatic)
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    StartScene()
        .environmentObject(QuizArrayViewModel())
}
