//
//  MultiplyAgain.swift
//  TestingApp
//
//  Created by jimenez on 3/7/24.
//

import SwiftUI

struct MultiplyAgain: View {
    @State private var isGameActive = false
    @State private var multiplyBy = 2
    @State private var numOfQuestion = 5
    
    
    var body: some View {
        NavigationStack {
            if isGameActive {
                
            } else {
                SettingsViews(multiplyBy: $multiplyBy, numOfQuestion: $numOfQuestion, startGame: startGame)
            }
        }
    }
    
    func startGame() {
        isGameActive = true
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
                
                Stepper("questions \(numOfQuestion)", value: $numOfQuestion, in: 5...20, step: 5)
                
                Button("Start") {
                    startGame()
                }
            }
        }
    }
    
}

struct MultiplyAgain_Previews: PreviewProvider {
    static var previews: some View {
        MultiplyAgain()
    }
}
