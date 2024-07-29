//
//  StartScreen.swift
//  The Quiz App
//
//  Created by Nils on 7/29/24.
//

import SwiftUI

struct StartScreen: View {
    
    @EnvironmentObject private var quizData: QuizData
    @State private var isShowingSheet = false
    var body: some View {
        NavigationStack {
            ZStack {
                AppColor.background.ignoresSafeArea()
                if !quizData.quizArray.isEmpty {
                    List {
                        ForEach(quizData.quizArray) { quiz in
                            Text(quiz.title)
                        }
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
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Quiz App")
                        .font(.system(size: 35))
                        .bold()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isShowingSheet.toggle()
                    }) {
                        Image(systemName: "lightspectrum.horizontal")
                    }
                    .sheet(isPresented: $isShowingSheet) {
                        SheetView(isShowingSheet: $isShowingSheet)
                    }
                }
            }
            .tint(AppColor.accent)
        }
    }
}

#Preview {
    StartScreen()
        .environmentObject(QuizData())
}
