//
//  QuizData.swift
//  The Quiz App
//
//  Created by Nils on 7/28/24.
//

import Foundation

class QuizData: ObservableObject {
    @Published var quizArray = [QuizModel]()
    
    private var quizDataUrl: URL {
        do {
            let documentsDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            return documentsDirectory.appendingPathComponent("quizData", conformingTo: .json)
        } catch {
            fatalError("An Error has occured while fetching the Url: \(error)")
        }
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(quizArray)
            try data.write(to: quizDataUrl)
        } catch {
            fatalError("An Error has occured while saving: \(error)")
        }
    }
    
    func load() {
        guard FileManager.default.isReadableFile(atPath: quizDataUrl.path(percentEncoded: false)) else {return}
        do {
            let data = try Data(contentsOf: quizDataUrl)
            quizArray = try JSONDecoder().decode([QuizModel].self, from: data)
        } catch {
            fatalError("An Error has occured while loading: \(error)")
        }
    }
}
