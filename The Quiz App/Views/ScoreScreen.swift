//
//  ScoreScreen.swift
//  The Quiz App
//
//  Created by Nils on 8/3/24.
//

import SwiftUI

struct ScoreScreen: View {
    
    @EnvironmentObject private var gameData: GameData
    var body: some View {
        NavigationStack {
            ZStack {
                AppColor.background.ignoresSafeArea()
                VStack {
                    Text("\(gameData.questionCount)")
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    ScoreScreen()
        .environmentObject(GameData(currentQuiz: QuizModel()))
}
