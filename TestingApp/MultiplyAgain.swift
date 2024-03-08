//
//  MultiplyAgain.swift
//  TestingApp
//
//  Created by jimenez on 3/7/24.
//

import SwiftUI

struct Question {
    let text: String
    let answer: Int
}


struct MultiplyAgain: View {
    @State private var isGameActive = false
    @State private var multiplyBy = 2
    @State private var numOfQuestion = 5
    @State private var questions: [Question] = []
    @State private var userAnswer = ""
    @State private var currentIndex = 0
    
    
    var body: some View {
        NavigationStack {
            if isGameActive {
                GameView(question: questions[currentIndex], onSubmit: checkAnswer, userAnswer: $userAnswer)
            } else {
                SettingsViews(multiplyBy: $multiplyBy, numOfQuestion: $numOfQuestion, startGame: startGame)
            }
        }
    }
     
    func startGame() {
        isGameActive = true
        generateQuestion()
    }
    
    func checkAnswer() {
        if currentIndex < numOfQuestion - 1 {
            currentIndex += 1
            userAnswer = ""
        } else {
            isGameActive = false
            currentIndex = 0
        }
        
    }
    
    func generateQuestion() {
        questions = (1...numOfQuestion).map({ _ in
            let randomNumber = Int.random(in: 1...12)
            let text = "\(multiplyBy) x \(randomNumber) = ?"
            let answer = multiplyBy * randomNumber
            return Question(text: text, answer: answer)
        })
        
    }
    
}

struct GameView: View {
    var question: Question
    var onSubmit: () -> Void
    @Binding var userAnswer: String
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("\(question.answer)")
                    .font(.subheadline)
                    
                Text("\(question.text)")
                    .font(.largeTitle)
                
                TextField("Answer", text: $userAnswer)
                    .padding(.horizontal, 30)
                    .keyboardType(.decimalPad)
                
                Button("Next") {
                    onSubmit()
                }
                .padding()
            }
            
        }
    }
}

struct SettingsViews: View {
    @Binding var multiplyBy: Int
    @Binding var numOfQuestion: Int
    var startGame: () -> Void
    
    var body: some View {
        NavigationStack {
            VStack {
                Stepper("Multiply \(multiplyBy)", value: $multiplyBy, in: 2...12)
                
                Stepper("Questions \(numOfQuestion)", value: $numOfQuestion, in: 5...20, step: 5)
                
                Button("Start") {
                    startGame()
                }
            }
            .padding(.horizontal, 20)
        }
    }
    
}

struct MultiplyAgain_Previews: PreviewProvider {
    static var previews: some View {
        MultiplyAgain()
    }
}
