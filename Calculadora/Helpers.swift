//
//  Helpers.swift
//  Calculadora
//
//  Created by Marcelo Rosa on 06/03/25.
//

import SwiftUI


struct PushedToSide: View {
    @Binding var text: String
    @Environment(\.colorScheme) var colorScheme
    var color: Color { colorScheme == .dark ? .black : .white }

    var body: some View {
        HStack {
            Spacer()
            Text(text)
                .minimumScaleFactor(0.3)
                .bold()
                .font(.system(size: 80))
                .foregroundColor(color)
                .lineLimit(1)
        }
        .padding()
    }
}

struct CustomBackGroundView<Content: View>: View {
    @ViewBuilder var content: () -> Content
    @Environment(\.colorScheme) var colorScheme
    var color: Color { colorScheme == .dark ? .white : .black }
    
    var body: some View {
        ZStack {
            color.edgesIgnoringSafeArea(.all)
            content()
        }
    }
}

struct CustomVStackView<Content: View>: View {
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        VStack {
            Spacer()
            content()
        }
    }
}

struct CustomButton: View {
    var text: String
    var buttonWidth: CGFloat
    var buttonHeight: CGFloat
    var action: () -> Void
    var buttonColor: Color
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.system(size: 32))
                .frame(
                    width: buttonWidth,
                    height: buttonHeight
                )
                .background(buttonColor)
                .foregroundColor(.white)
                .cornerRadius(buttonWidth / 2)
        }
    }
}
