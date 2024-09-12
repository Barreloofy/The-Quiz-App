//
//  GameScene.swift
//  The Quiz App
//
//  Created by Nils on 8/1/24.
//

import SwiftUI

struct GameScene: View {
    
    @StateObject var viewModel: GameViewModel
    @State private var loggedAnswer: String? = nil
    @State private var presentScore = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                AppColor.background.ignoresSafeArea()
                
                VStack {
                    VStack {
                        HStack {
                            Text("\(viewModel.questionCount + 1)")
                                .onChange(of: viewModel.questionCount) {
                                    loggedAnswer = nil
                                }
                            Text("/")
                            Text("\(viewModel.questions.count)")
                        }
                        .font(.system(size: 20))
                        .bold()
                        .padding(.top, 75)
                        
                        Text(viewModel.currentQuestion.questionTitle)
                            .font(.system(size: 35))
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding(.top, 10)
                    }
                    .padding(.bottom, 10)
                    
                    Spacer()
                    
                    AnswerPresenterView(question: viewModel.currentQuestion, loggedAnswer: $loggedAnswer)
                        .frame(maxHeight: 300)
                        .padding(.bottom, 10)
                    
                    Group {
                        if presentScore {
                            NavigationLink(destination: ScoreScene().environmentObject(viewModel)) {
                                Text("Score")
                            }
                        } else {
                            Button(action: {
                                viewModel.increment(loggedAnswer)
                                presentScore = viewModel.increment()
                            }) {
                                Text("Next")
                                    .opacity(loggedAnswer != nil ? 1 : 0.5)
                                    .foregroundStyle(loggedAnswer != nil ? .black : .gray)
                            }
                        }
                    }
                    .bold()
                    .padding(.bottom, 10)
                }
                .padding()
            }
            .navigationBarBackButtonHidden()
            .tint(.black)
        }
    }
}

#Preview {
    GameScene(viewModel: GameViewModel())
}
