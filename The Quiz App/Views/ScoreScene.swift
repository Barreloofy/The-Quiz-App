//
//  ScoreScene.swift
//  The Quiz App
//
//  Created by Nils on 8/3/24.
//

import SwiftUI

struct ScoreScene: View {
    
    @EnvironmentObject private var viewModel: GameViewModel
    var body: some View {
        NavigationStack {
            ZStack {
                AppColor.background.ignoresSafeArea()
                VStack {
                    HStack {
                        Text("\(viewModel.correctGuessCount)")
                        Text("/")
                        Text("\(viewModel.questions.count)")
                    }
                        .padding(.top,100)
                        .bold()
                        .font(.system(size: 20))
                    Text(viewModel.scoreMessage())
                        .padding(5)
                        .bold()
                        .font(.system(size: 20))
                        .underline()
                    Spacer()
                    
                    Button(action: {}) {
                        NavigationLink(destination: GameScene(viewModel: GameViewModel(currentQuiz: viewModel.currentQuiz))) {
                            Text("Play again!")
                                .bold()
                                .font(.system(size: 25))
                        }
                    }
                    .padding(25)
                    .buttonStyle(SimpleButtonStyle(tint: .white, decoration: true))
                    
                    Button {
                        viewModel.dismiss = true
                    } label: {
                        Text("Home")
                            .bold()
                            .font(.system(size: 25))
                    }
                    .buttonStyle(SimpleButtonStyle(tint: .white, decoration: true))
                    .navigationDestination(isPresented: $viewModel.dismiss) {
                        StartScene()
                    }
                    
                    Spacer()
                    Spacer()
                }
            }
            .navigationBarBackButtonHidden()
            .tint(AppColor.accent)
        }
    }
}

#Preview {
    ScoreScene()
        .environmentObject(GameViewModel(currentQuiz: Quiz()))
}
