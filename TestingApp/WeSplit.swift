//
//  WeSplit.swift
//  TestingApp
//
//  Created by jimenez on 3/4/24.
//

import SwiftUI

struct WeSplit: View {
    // price before tip
    @State private var price = 0.0
    // percent amount
    let tipAmount = [0, 10, 15, 20]
    @State private var tipSelected = 0
    // number of people
    @State private var numberOfPeople = 0
    // total amount
    var totalAmount: Double {
        let peopleAmount = Double(numberOfPeople) + 2
        let tipAmount = Double(tipSelected)
        
//        return 0.0
        return (price + (price / 100 * tipAmount)) / peopleAmount
//        return (checkAmount + (checkAmount / 100 * tipSelection)) / peopleCount
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Amount") {
                    TextField("price", value: $price, format: .currency(code: "USD"))
                        .keyboardType(.decimalPad)
                }
                
                Section("Select the amount of people") {
                    Picker("People", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section("Tip Percentage") {
                    Picker("Tip", selection: $tipSelected) {
                        ForEach(tipAmount, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("total amount") {
                    Text(totalAmount, format: .currency(code: "USD"))
                }
            }
        }
    }
}

struct WeSplit_Previews: PreviewProvider {
    static var previews: some View {
        WeSplit()
    }
}
