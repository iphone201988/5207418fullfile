//
//  ButtonModifiers.swift
//  Boss5207418
//
//  Created by Rachelle Ford on 6/16/23.
//

import SwiftUI

struct ButtonModifiers: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(minWidth: 0, maxWidth: 160)
            .frame(height: 20)
            .padding()
            .foregroundColor(.white)
            .font(.system(size: 14, weight: .bold))
            .background(Color.red)
            .cornerRadius(5.0)
    }
}
