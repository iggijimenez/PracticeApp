//
//  WeSplit.swift
//  TestingApp
//
//  Created by jimenez on 3/4/24.
//

import SwiftUI

struct WeSplit: View {
    @State private var price = 0.0
    @State private var tipSelected = 0
    @State private var numberOfPeople = 0
    
    let tipAmount = [0, 10, 15, 20]
    
    var totalAmount: Double {
        let peopleAmount = Double(numberOfPeople) + 2
        let tipAmount = Double(tipSelected)
        
        return (price + (price / 100 * tipAmount)) / peopleAmount
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
                
                Section("total amount with tip") {
                    Text(totalAmount, format: .currency(code: "USD"))
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

struct WeSplit_Previews: PreviewProvider {
    static var previews: some View {
        WeSplit()
    }
}
