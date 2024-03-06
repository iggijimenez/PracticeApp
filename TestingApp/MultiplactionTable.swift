//
//  MultiplactionTable.swift
//  TestingApp
//
//  Created by jimenez on 3/5/24.
//

import SwiftUI

struct QuestionsA {
    let text: String
    let answer: Int
}

struct MultiplactionTable: View {
    @State private var ThisGameActive = false
    @State private var questions: [QuestionsA] = []
    @State private var questionIndex = 0
    @State private var multiplyBy = 2
    @State private var questionAskeds = 5
    @State private var userAnswer = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                if ThisGameActive {
                    ThisGameView(onSubmit: checkAnswer, userAnswer: $userAnswer, questions: questions[questionIndex])
                } else {
                    SettingsView(startthisGame: startthisGame, questionsAsked: $questionAskeds, mulitplyBy: $multiplyBy)
                }
            }
        }
    }
    
    func generateQuestionsA() {
        questions = (1...questionAskeds).map({ _ in
            let multip = Int.random(in: 1...12)
            let questText = "\(questionAskeds) x \(multip) = ?"
            return QuestionsA(text: questText, answer: (multip * multiplyBy))
        })
    }
    
    func startthisGame() {
        ThisGameActive = true
        generateQuestionsA()
    }
    
    func checkAnswer() {
        if questionIndex < questionAskeds - 1  {
            questionIndex +=  1
        } else {
            ThisGameActive = false
            questionIndex = 0
        }
        
    }
    
    
}

struct SettingsView: View {
    var startthisGame: () -> Void
    @Binding var questionsAsked: Int
    @Binding var mulitplyBy: Int
    
    var body: some View {
        NavigationStack {
            VStack {
                Stepper("Multiply by: \(mulitplyBy)", value: $mulitplyBy, in: 2...12)
                Stepper("number of Questions: \(questionsAsked)", value: $questionsAsked, in: 5...20, step: 5)
                Button {
                    startthisGame()
                } label: {
                    Text("Start Game")
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

struct ThisGameView: View {
    let onSubmit: () -> Void
    @Binding var userAnswer: String
    var questions: QuestionsA
    
    var body: some View {
        NavigationStack {
            Text(questions.text)
                .font(.largeTitle)
            
            TextField("Answer", text: $userAnswer)
                .padding(.horizontal, 20)
            
            Button("Next") {
                onSubmit()
            }
        }
    }
}


struct MultiplactionTable_Previews: PreviewProvider {
    static var previews: some View {
        MultiplactionTable()
    }
}
