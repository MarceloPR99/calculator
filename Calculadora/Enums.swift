//
//  Enums.swift
//  Calculadora
//
//  Created by Marcelo Rosa on 06/03/25.
//

import SwiftUI

enum CalcButton: String {
    case um = "1"
    case dois = "2"
    case tres = "3"
    case quatro = "4"
    case cinco = "5"
    case seis = "6"
    case sete = "7"
    case oito = "8"
    case nove = "9"
    case zero = "0"
    case soma = "+"
    case subtracao = "-"
    case multiplica = "X"
    case divisao = "÷"
    case igual = "="
    case reset = "AC"
    case virgula = ","
    case porcentagem = "%"
    case negativo = "+/-"
    
    var buttonColor: Color {
        switch self {
        case .soma, .subtracao, .multiplica, .divisao, .igual:
            return .orange
        case .reset, .negativo, .porcentagem:
            return Color(.lightGray)
        default:
            return Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
        }
    }
}

enum Operation {
    case soma, subtracao, multiplica, divisao, nada
}
