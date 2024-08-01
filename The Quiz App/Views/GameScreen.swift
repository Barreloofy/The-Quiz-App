//
//  GameScreen.swift
//  The Quiz App
//
//  Created by Nils on 8/1/24.
//

import SwiftUI

struct GameScreen: View {
    
    @StateObject var gameData: GameData
    var body: some View {
        NavigationStack {
            ZStack {
                AppColor.background.ignoresSafeArea()
                VStack {
                    HStack {
                        Text("\(gameData.questionCount)")
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
                    AnswerPresenterView(question: gameData.currentQuestion)
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    GameScreen(gameData: GameData(currentQuiz: QuizModel(title: "Test Quiz", questions: [Question(questionTitle: "Test Question", answers: ["Yes","No"], correctAnswer: "Yes")])))
}
