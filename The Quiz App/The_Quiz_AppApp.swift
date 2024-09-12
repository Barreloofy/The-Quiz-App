//
//  The_Quiz_AppApp.swift
//  The Quiz App
//
//  Created by Nils on 7/28/24.
//

import SwiftUI

@main
struct The_Quiz_AppApp: App {
    
    @StateObject private var viewModel = QuizArrayViewModel()
    var body: some Scene {
        WindowGroup {
            StartScene()
                .environmentObject(viewModel)
                .onAppear {
                    viewModel.load()
                }
        }
    }
}
