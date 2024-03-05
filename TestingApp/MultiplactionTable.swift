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
    
    var body: some View {
        NavigationStack {
            VStack {
                if ThisGameActive {
                    ThisGameView(questions: questions[questionIndex])
                } else {
                    SettingsView(startthisGame: startthisGame, questionsAsked: $questionAskeds, mulitplyBy: $multiplyBy)
                }
            }
        }
    }
    
    func startthisGame() {
        ThisGameActive = true
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
    var questions: QuestionsA
    
    var body: some View {
        NavigationStack {
            Text(questions.text)
        }
    }
}


struct MultiplactionTable_Previews: PreviewProvider {
    static var previews: some View {
        MultiplactionTable()
    }
}
