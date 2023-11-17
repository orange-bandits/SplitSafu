//
//  ContentView.swift
//  SplitSafu
//
//  Created by Tukan van der Borgh on 17/11/2023.
//

import SwiftUI

struct ContentView: View { // Anything you draw on screen must be a View.
    // View requires you to have a computed property body.
    var body: some View { // some View = "something" that conforms to View.
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

// Configuration to see this view (component) in preview mode. Kind of like Storybook but much better.
#Preview {
    ContentView()
}
