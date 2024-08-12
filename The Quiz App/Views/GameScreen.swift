//
//  GameScreen.swift
//  The Quiz App
//
//  Created by Nils on 8/1/24.
//

import SwiftUI

struct GameScreen: View {
    
    @StateObject var gameData: GameData
    @State private var loggedAnswer: String? = nil
    @State private var presentScore = false
    var body: some View {
        NavigationStack {
            ZStack {
                AppColor.background.ignoresSafeArea()
                VStack {
                    HStack {
                        Text("\(gameData.questionCount+1)")
                            .onChange(of: gameData.questionCount) {
                                loggedAnswer = nil
                            }
                        Text("/")
                        Text("\(gameData.quizQuestions.count)")
                    }
                    .font(.system(size: 20))
                    .bold()
                    .padding(.top, 75)
                    Text(gameData.currentQuestion.questionTitle)
                        .font(.system(size: 35))
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.top, 10)
                    Spacer()
                    AnswerPresenterView(question: gameData.currentQuestion,loggedAnswer: $loggedAnswer)
                    if presentScore {
                        NavigationLink(destination: ScoreScreen().environmentObject(gameData)) {
                            Text("Score")
                                .bold()
                        }
                    } else {
                        Button(action: {
                            gameData.increment(loggedAnswer)
                            presentScore = gameData.increment()
                        }) {
                            Text("Next")
                                .bold()
                                .opacity(loggedAnswer != nil ? 1 : 0.5)
                                .foregroundStyle(loggedAnswer != nil ? .black : .gray)
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden()
            .tint(.black)
        }
    }
}

#Preview {
    GameScreen(gameData: GameData(currentQuiz: QuizModel(title: "Test Quiz", questions: [Question(questionTitle: "Test Question", answers: [Answer(answerText: "Yes"),Answer(answerText: "No")], correctAnswer: "Yes")])))
}
