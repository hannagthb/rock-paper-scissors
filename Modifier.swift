//
//  Modifier.swift
//  Game Rock Paper
//
//  Created by Hanna Cherniakova on 27/04/2023.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("", size: 100))
            
    }
}

struct ApperanceModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.yellow)
            .clipShape(Capsule())
            .foregroundColor(.white)
            .font(.title)
            .bold()
            .shadow(radius: 1)
            .padding()
    }
}
