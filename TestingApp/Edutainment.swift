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
    @State private var selectedQuestionCount = 5
    @State private var questions: [Questions] = []
    @State private var currentIndex = 0
    @State private var userAnswer = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                if isGameActive {
//                    Text("active this is for gameview")
                    GameView(question: questions[currentIndex], userAnswer: $userAnswer, onSubmit: checkAnswer)
                } else {
                  Text("Not active this is for settings")
                    SettingView(startGame: startGame, selectedMultiplyBy: $selecetedMultiplyBy, selectedQuestionCount: $selectedQuestionCount)
                }
            }
        }
    }
    
    func startGame() {
        isGameActive = true
        generateQuestions()
    }
    
    func generateQuestions() {
        questions = (1...selectedQuestionCount).map({ _ in
            let multiplier = Int.random(in: 1...12)
            let questionText = "\(selecetedMultiplyBy) x \(multiplier) = ?"
            return Questions(text: questionText, answer: multiplier * selecetedMultiplyBy)
        })
        currentIndex = 0
        userAnswer = ""
    }
    
    func checkAnswer() {
        if currentIndex < selectedQuestionCount - 1 {
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
            Stepper("Multiply by \(selectedMultiplyBy)", value: $selectedMultiplyBy, in: 2...12)
                .padding(.horizontal)
            
            Stepper("Number of questions \(selectedQuestionCount)", value: $selectedQuestionCount, in: 5...20, step: 5)
                .padding(.horizontal)
            
            Button("Start Game") {
                startGame()
            }
        }
    }
}

struct GameView: View {
    let question: Questions // pass question struct
    @Binding var userAnswer: String // user input
    var onSubmit: () -> Void // onsumbit button
    
    var body: some View {
        VStack {
            Text(question.text)
                .font(.title)
            TextField("Your answer", text: $userAnswer, onCommit: onSubmit)
            
            Button("submit") {
                onSubmit()
            }
        }
    }
}

struct Edutainment_Previews: PreviewProvider {
    static var previews: some View {
        Edutainment()
    }
}
