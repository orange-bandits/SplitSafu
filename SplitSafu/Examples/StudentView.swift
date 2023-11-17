//
//  StudentView.swift
//  SplitSafu
//
//  Created by Tukan van der Borgh on 17/11/2023.
//

import SwiftUI

enum Student: String, CaseIterable, Identifiable {
    case Zack, Henry, Mark
    // This gets used by ForEach, similar to key in React
    var id: Self { self } // Strings themselves are unique, and not a field in a struct hence use self.
}

struct StudentView: View {
    @State private var selectedStudent: Student = .Mark
    
    var body: some View {
        NavigationView {
            Form {
                // https://developer.apple.com/documentation/swiftui/picker
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(Student.allCases) { student in
                        Text(student.rawValue.capitalized)
                    }
                }
            }
        }
    }
}

#Preview {
    StudentView()
}
