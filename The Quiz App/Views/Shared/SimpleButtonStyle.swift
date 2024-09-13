//
//  SimpleButtonStyle.swift
//  The Quiz App
//
//  Created by Nils on 9/13/24.
//

import SwiftUI

struct SimpleButtonStyle: ButtonStyle {
    
    let tint: Color
    var decoration = false
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(5)
            .background {
                if decoration {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.black)
                }
            }
            .scaleEffect(configuration.isPressed ? 1.1 : 1.0)
            .foregroundStyle(tint)
    }
}
