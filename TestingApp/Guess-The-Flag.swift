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
    
    var body: some View {
        NavigationStack {
            
            Spacer()
            Text("Select this one: " + flags[chosenNum])
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
            print("You got it")
        } else {
            print("Wrong")
        }
        
    }
}

struct Guess_The_Flag_Previews: PreviewProvider {
    static var previews: some View {
        Guess_The_Flag()
    }
}
