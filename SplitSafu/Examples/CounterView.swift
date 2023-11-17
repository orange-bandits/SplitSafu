//
//  CounterView.swift
//  SplitSafu
//
//  Created by Tukan van der Borgh on 17/11/2023.
//

import SwiftUI

struct CounterView: View {
    // Property wrapper to make this field editable in SwiftUI, since we can't have "mutating var body".
    // Essentially, allows this value to be stored separately by SwiftUI so that it CAN be modified.
    // Why not classes instead of structs then? Performance.
    @State private var tapCount = 0 // This wrapper is for small, simple properties hence private.
    
    var body: some View {
        VStack { // Vertical stack
            Text("\(tapCount)")
            Button("Tap tap!") {
                self.tapCount += 1
            }
        }
    }
}

#Preview {
    CounterView()
}
