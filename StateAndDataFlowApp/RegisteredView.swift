//
//  RegisteredView.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 21.10.2020.
//

import SwiftUI

struct RegisteredView: View {
    @State private var name = ""
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            HStack() {
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                Text("\(name.count)")
                    .offset(x: -60, y: 0)
                    .foregroundColor(nameIsValid ? .green : .red)
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }.disabled(!nameIsValid)
        }
    }
}

extension RegisteredView {
    
    private var nameIsValid: Bool {
            name.count >= 3
        }
    
    private func registerUser() {
        if !(name.isEmpty) {
            userManager.name = name
            DataManager().saveName(name)
            
            userManager.isRegister = true
            DataManager().saveLogged(true)
        }
    }
}

struct RegisteredView_Previews: PreviewProvider {
    static var previews: some View {
        RegisteredView()
    }
}
