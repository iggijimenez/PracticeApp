//
//  Guess-The-Flag.swift
//  TestingApp
//
//  Created by jimenez on 3/1/24.
//

import SwiftUI

struct Guess_The_Flag: View {
    @State private var flags = ["one", "two", "three", "four", "five", "six", "seven", "eight"].shuffled()
    @State private var chosenNum = Int.random(in: 0...2)
    @State private var userRounds = 0
    @State private var userScore = 0
    @State private var isAlertPresented = false
    
    var body: some View {
        NavigationStack {
            
            Spacer()
            Text("Select this one: " + flags[chosenNum])
            Text("This is round \(userRounds) / 8")
            Text("This is score: \(userScore)")
            Spacer()
            
            ForEach(0..<3) { item in
                Spacer()
                Button {
                    if item == chosenNum {
                        checkFlag(item)
                        askQuestion()
                    } else {
                        checkFlag(item)
                        askQuestion()
                    }
                } label: {
                    Text(flags[item])
                }
            }
            .alert(isPresented: $isAlertPresented) {
                Alert(title: Text("Round Over"))
            }
            Spacer()
        }
    }
    
    func askQuestion() {
        flags.shuffle()
        chosenNum = Int.random(in: 0...2)
        
    }
    
    // check if its right
    func checkFlag(_ numberSel: Int) {
        if numberSel == chosenNum {
            userScore += 1
            rounds()
        } else {
            print("Wrong")
            rounds()
        }
        
    }
    
    func rounds() {
        if userRounds == 7 {
            isAlertPresented.toggle()
            restartRound()
        } else {
            userRounds += 1
        }
    }
    
    func restartRound() {
        userRounds = 0
        userScore = 0
    }
}

struct Guess_The_Flag_Previews: PreviewProvider {
    static var previews: some View {
        Guess_The_Flag()
    }
}
