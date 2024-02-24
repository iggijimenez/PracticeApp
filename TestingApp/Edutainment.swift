//
//  Edutainment.swift
//  TestingApp
//
//  Created by jimenez on 2/23/24.
//

import SwiftUI

struct Questions {
    let text: String
    let answer: Int
}

struct Edutainment: View {
    
    @State private var isGameActive = false
    @State private var selecetedMultiplyBy = 2
    @State private var selectedQuestionAsked = 5
    @State private var questions: [Questions] = []
    @State private var currentIndex = 0
    @State private var userAnswer = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                if isGameActive {
                    Text("active this is for gameview")
                } else {
                  Text("Not active this is for settings")
                    SettingView(startGame: startGame, selectedMultiplyBy: $selecetedMultiplyBy, selectedQuestionCount: $selectedQuestionAsked)
                }
            }
        }
    }
    
    func startGame() {
        generateQuestions()
        isGameActive = true
    }
    
    func generateQuestions() {
        questions = (1...selecetedMultiplyBy).map({ _ in
            let multiplier = Int.random(in: 1...12)
            let questionText = "\(selecetedMultiplyBy) x \(multiplier) = ?"
            return Questions(text: questionText, answer: (multiplier * selecetedMultiplyBy))
        })
        currentIndex = 0
        userAnswer = ""
    }
    
    func checkAnswer() {
        if currentIndex < selectedQuestionAsked - 1 {
            currentIndex += 1
            userAnswer = ""
        } else {
            endGame()
        }
    }
    
    func endGame() {
        isGameActive = false
    }
    
}

struct SettingView: View {
    var startGame: () -> Void
    @Binding var selectedMultiplyBy: Int
    @Binding var selectedQuestionCount: Int
    
    var body: some View {
        VStack {
            Stepper("Multiply by \(selectedMultiplyBy)", value: $selectedMultiplyBy)
                .padding()
        }
    }
}

struct GameView: View {
    
    var body: some View {
        VStack {
            
        }
    }
}

struct Edutainment_Previews: PreviewProvider {
    static var previews: some View {
        Edutainment()
    }
}
