//
//  ContentView.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 21.10.2020.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var timer = TimeCounter()
    
    var body: some View {
        VStack {
            Text("Hi, \(UserDefaults.standard.string(forKey: "name") ?? "")!")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 200)
            Spacer()
            ButtonView(color: .red,
                       text: "\(timer.buttonTitle)") { timer.startTimer() }

            Spacer()
            ButtonView(color: .blue, text: "Log out") {
                UserDefaults.standard.setValue(false, forKey: "isLoggedIn")
            }
            .padding()
        }
    }
}
struct ButtonView: View {
    
    let color: Color
    let text: String
    let action: () -> Void
    
    var body: some View {
        Button(action:  action) {
            Text(text)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(color)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.black, lineWidth: 4)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

