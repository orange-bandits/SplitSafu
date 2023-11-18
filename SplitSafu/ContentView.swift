//
//  ContentView.swift
//  SplitSafu
//
//  Created by Tukan van der Borgh on 17/11/2023.
//

import SwiftUI

struct ContentView: View { // Anything you draw on screen must be a View.
    @Environment(\.locale) private var locale
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    @FocusState private var amountIsFocused: Bool // To track focus state on an element
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var currencyCode: String {
        return locale.currency?.identifier ?? "EUR"  // Q: How do we make the default here based on the build / app store it goes to?
    }
    
    // Computed value
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage) // Done for type matching purposes
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }

    // View requires you to have a computed property body.
    var body: some View { // some View = "something" that conforms to View.
        NavigationStack {
            Form {
                Section {
                    LabeledContent {
                        // Typing too fast with this approach can cause some problems. Will check later.
                        TextField("Amount", value: $checkAmount, format: .currency(code: currencyCode))
                            .keyboardType(.decimalPad)
                            // Two-way binding of focus state
                            .focused($amountIsFocused)
                            .multilineTextAlignment(.trailing)
                    } label: {
                        Text("Amount")
                    }
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                        .pickerStyle(.navigationLink) // Show picker options in a new view
                } header: {
                    Text("Your bill")
                }
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) { // Use the value itself as its id. Limitation is that all of them must be unique.
                            Text($0, format: .percent)
                        }
                    }
                        .pickerStyle(.segmented)
                } header: {
                    Text("How much would you like to tip? 🥺")
                }
                Section {
                    Text(totalPerPerson, format: .currency(code: currencyCode))
                } header: {
                    Text("Total per person")
                }
            }
            .navigationTitle("Split #SAFU")
            .toolbar { // Specify toolbar items for a view
                ToolbarItemGroup(placement: .keyboard) { // Group of items that should be placed at keyboard
                    Spacer()
                    Button("Done") { // A button with the text Done that does some action
                        amountIsFocused = false // Get rid of focus - makes sense, since we have two-way binding!
                    }
                }
            }
        }
    }
}

// Configuration to see this view (component) in preview mode. Kind of like Storybook but much better.
#Preview {
    ContentView()
}
