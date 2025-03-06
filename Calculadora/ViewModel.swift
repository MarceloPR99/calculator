//
//  ViewModel.swift
//  Calculadora
//
//  Created by Marcelo Rosa on 06/03/25.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var result = "0"
    @Published var runningNumber: Double = 0
    @Published var currentOperation: Operation = .nada
    
    var buttonHeight: CGFloat {
        (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
    
    let buttons: [[CalcButton]] = [
        [.reset, .negativo, .porcentagem, .divisao],
        [.sete, .oito, .nove, .multiplica],
        [.quatro, .cinco, .seis, .subtracao],
        [.um, .dois, .tres, .soma],
        [.zero, .virgula, .igual]
    ]
    
    func click(button: CalcButton) {
        switch button {
        case .soma, .subtracao, .multiplica, .divisao, .igual:
            if button == .soma {
                self.currentOperation = .soma
                self.runningNumber = convertToDouble(self.result)
            }
            else if button == .subtracao {
                self.currentOperation = .subtracao
                self.runningNumber = convertToDouble(self.result)
            }
            else if button == .multiplica {
                self.currentOperation = .multiplica
                self.runningNumber = convertToDouble(self.result)
            }
            else if button == .divisao {
                self.currentOperation = .divisao
                self.runningNumber = convertToDouble(self.result)
            }
            else if button == .igual {
                let runningResult = self.runningNumber
                let currentResult = convertToDouble(self.result)
                switch self.currentOperation {
                case .soma:
                    self.result = formatResult(runningResult + currentResult)
                case .subtracao:
                    self.result = formatResult(runningResult - currentResult)
                case .multiplica:
                    self.result = formatResult(runningResult * currentResult)
                case .divisao:
                    if currentResult != 0 {
                        self.result = formatResult(runningResult / currentResult)
                    } else {
                        self.result = "Indefinido"
                    }
                case .nada:
                    break
                }
            }
            
//            || button != .divisao || button != .multiplica || button != .soma || button != .subtracao || button != .negativo || button != .porcentagem {
            if button != .igual {
                self.result = "0"
            }
        case .reset:
            self.result = "0"
        case .virgula:
            if !self.result.contains(",") {
                self.result = "\(self.result),"
            }
        case .negativo:
            let currentValue = convertToDouble(self.result)
            self.result = formatResult(currentValue * -1)
        case .porcentagem:
            let currentValue = convertToDouble(self.result)
            self.result = formatResult(currentValue / 100)
        default:
            let number = button.rawValue
            if self.result == "0" {
                result = number
            }
            else {
                self.result = "\(self.result)\(number)"
            }
        }
    }
    
    func convertToDouble(_ string: String) -> Double {
        var value = string
        value = value.replacingOccurrences(of: ",", with: ".")
        return Double(value) ?? 0
    }
    
    func formatResult(_ value: Double) -> String {
        if value == Double(Int(value)) {
            return "\(Int(value))"
        } else {
            return "\(value)"
        }
    }
    
    func buttonWidth(item: CalcButton) -> CGFloat {
        if item == .zero {
            return ((UIScreen.main.bounds.width - (4 * 12)) / 4) * 2
        }
        return ((UIScreen.main.bounds.width - (5 * 12)) / 4)
    }
    
}
