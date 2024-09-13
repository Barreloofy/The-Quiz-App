//
//  AddButton.swift
//  The Quiz App
//
//  Created by Nils on 9/11/24.
//

import SwiftUI

struct AddButtonStyle: ButtonStyle {
    
    var base = AppColor.accent
    var accent = Color.black
    var blur: CGFloat = 50
    var effect = true
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(base.blur(radius: blur))
            .foregroundStyle(accent)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .scaleEffect(effect ? (configuration.isPressed ? 1.1 : 1.0) : 1 )
    }
}

struct TitleAndIconLabelStyle: LabelStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

struct AddButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Label(title, systemImage: "plus.app")
        }
        .buttonStyle(AddButtonStyle())
        .labelStyle(TitleAndIconLabelStyle())
    }
}

#if DEBUG
struct ContentView: View {
    var body: some View {
        Button(action: {
            print("Button pressed!")
        }) {
            Text("Press Me")
        }
        .buttonStyle(AddButtonStyle())
        .padding()
        AddButton(title: "Press Me", action: {})
    }
}

#Preview {
    ContentView()
}
#endif
