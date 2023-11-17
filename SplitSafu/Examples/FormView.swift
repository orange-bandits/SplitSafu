//
//  FormView.swift
//  SplitSafu
//
//  Created by Tukan van der Borgh on 17/11/2023.
//

import SwiftUI

struct FormView: View {
    var body: some View {
        NavigationView {
            Form {
                Text("This is an element in the Form.")
                Group { // We use this to overcome max 10 children limit in SwiftUI.
                    Text("This is an element in a group.")
                }
                Section { // Same as Group but shows elements in a seperate Section.
                    Text("This is an element in a section.")
                }
            }
            .navigationTitle("Some title") // Modifier for a navigation title, how it is displayed depends on the following modifier.
            // .navigationBarTitleDisplayMode determines how the title is displayed
            // .large for title as a text in content, .inline for title as a usual header, .automatic for both depending on scroll state.
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

#Preview {
    FormView()
}
