//
//  EditableTextView.swift
//  SplitSafu
//
//  Created by Tukan van der Borgh on 17/11/2023.
//

import SwiftUI

struct EditableTextView: View {
    @State private var name = ""
    
    var body: some View {
        Form {
            TextField("Enter your name", text: $name) // $ before property name means two-way binding i.e. write back changes
            Text("Your name is \(name)") // We only need one-way binding to display a value, hence no $
        }
    }
}

#Preview {
    EditableTextView()
}
