//
//  ContentView.swift
//  Calculadora
//
//  Created by Marcelo Rosa on 01/03/25.
//

import SwiftUI

struct CalculadoraView: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        CustomBackGroundView(content: {
            CustomVStackView(content: {
                PushedToSide(text: $viewModel.result)
                ForEach(viewModel.buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            CustomButton(
                                text: item.rawValue,
                                buttonWidth: self.viewModel.buttonWidth(item: item),
                                buttonHeight: viewModel.buttonHeight,
                                action: {self.viewModel.click(button: item)},
                                buttonColor: item.buttonColor)
                        }
                    }
                    .padding(.bottom, 3)
                }
            })
        })
    }
}
