//
//  RegisteredView.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 21.10.2020.
//

import SwiftUI

struct RegisteredView: View {
    @State private var name = ""
    @State private var counterColor = Color.red
    @State private var disableOK = true
    
    var body: some View {
        VStack {
            HStack() {
                TextField("Enter your name", text: textValue)
                    .multilineTextAlignment(.center)
                Text("\(name.count)")
                    .offset(x: -60, y: 0)
                    .foregroundColor(counterColor)
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }.disabled(disableOK)
        }
    }
}

extension RegisteredView {
    var textValue: Binding<String> {
        Binding<String>(get: {
            name
        }, set: { textValue in
            name = textValue
            if name.count >= 3 {
                counterColor = .green
                disableOK = false
            } else {
                counterColor = .red
                disableOK = true
            }
        })
    }
    
    private func registerUser() {
        if !(name.isEmpty) {
            UserDefaults.standard.setValue(name, forKey: "name")
            UserDefaults.standard.setValue(true, forKey: "isLoggedIn")
        }
    }
}

struct RegisteredView_Previews: PreviewProvider {
    static var previews: some View {
        RegisteredView()
    }
}
