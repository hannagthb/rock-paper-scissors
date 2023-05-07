//
//  ContentView.swift
//  Game Rock Paper
//
//  Created by Hanna Cherniakova on 27/04/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            RadialGradient(colors: [.white, .yellow], center: .center, startRadius: 200, endRadius: 500)
                .ignoresSafeArea()
            
            Button("Start game") {
                viewModel.isGameStart = true
            }
            .modifier(ApperanceModifier())
            .opacity(viewModel.isGameStart == true ? Double(viewModel.opacity) : 1)
            
            if viewModel.isGameStart {
            VStack {
                Spacer()
                Text("Choose your move:")
                    .padding()
                    .bold()
                HStack {
                    Button("👊") {
                        viewModel.checkMove(userChoice: "👊")
                    }
                    Button("✌️") {
                        viewModel.checkMove(userChoice: "✌️")
                    }
                    Button("🫲") {
                        viewModel.checkMove(userChoice: "🫲")
                    }
                }
                .modifier(ButtonModifier())
                
                Spacer()
                
                Text("Your score is \(viewModel.score)")
                    .modifier(ApperanceModifier())
                }
                .alert(viewModel.message, isPresented: $viewModel.isAlertOn) {
                    Button("Keep going") {
                        viewModel.reset()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
