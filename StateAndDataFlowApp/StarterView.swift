//
//  StarterView.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 22.10.2020.
//

import SwiftUI

struct StarterView: View {
    @AppStorage("isLoggedIn") private var isRegister = false
    @AppStorage("name") private var name = ""
    
    var body: some View {
        Group {
            if isRegister {
                ContentView()
            } else {
                RegisteredView()
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
    }
}
