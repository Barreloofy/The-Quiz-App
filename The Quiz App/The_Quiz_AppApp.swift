//
//  The_Quiz_AppApp.swift
//  The Quiz App
//
//  Created by Nils on 7/28/24.
//

import SwiftUI

@main
struct The_Quiz_AppApp: App {
    
    @StateObject private var quizData = QuizData()
    var body: some Scene {
        WindowGroup {
            StartScene()
                .environmentObject(quizData)
                .onAppear {
                    quizData.load()
                }
        }
    }
}
