//
//  ContentView-ViewModel.swift
//  Game Rock Paper
//
//  Created by Hanna Cherniakova on 28/04/2023.
//

import Foundation

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published var score = 0
        let choose = ["👊", "✌️", "🫲"]
        @Published var isGameStart = false
        @Published var isAlertOn = false
        @Published var opacity = 0.0
        @Published var message = ""
        @Published var phoneChoice = ""
        
        func checkMove(userChoice: String) {
            phoneChoice = choose.randomElement()!
            
            switch(phoneChoice, userChoice) {
            case("👊", "✌️"):
                message = "You lose. Your phone chose \(phoneChoice)."
                score -= 1
            case("👊", "🫲"):
                message = "You won. Your phone chose \(phoneChoice)."
                score += 1
            case("✌️", "👊"):
                message = "You won. Your phone chose \(phoneChoice)."
                score += 1
            case("✌️", "🫲"):
                message = "You lose. Your phone chose \(phoneChoice)."
                score -= 1
            case("🫲", "👊"):
                message = "You lose. Your phone chose \(phoneChoice)."
                score -= 1
            case("🫲", "✌️"):
                message = "You won. Your phone chose \(phoneChoice)."
                score += 1
            default:
                message = "Nobody won. You and your phone chose \(phoneChoice)"
            }
            
            isAlertOn = true
        }
        
        func reset() {
            phoneChoice = choose.randomElement()!
        }
    }
}
