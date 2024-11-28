//
//  MainView.swift
//  Calculator
//
//  Created by Алексей Чумаков on 27.11.2024.
//

import SwiftUI

enum Buttons: String {
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case plus = "+"
    case minus = "–"
    case multiple = "×"
    case divide = "÷"
    case equal = "="
    case decimal = ","
    case percent = "%"
    case negative = "+/-"
    case clear = "AC"

    var buttonColor: Color {
        switch self {
        case .clear, .negative, .percent:
            return Color.grayCalc
        case .divide, .multiple, .minus, .plus, .equal:
            return Color.orangeCalc
        default:
            return Color.darkGrayCalc
        }
    }

    var buttonFontColor: Color {
        switch self {
        case .clear, .negative, .percent:
            return Color.black
        default:
            return Color.white
        }
    }

    var buttonFontSize: CGFloat {
        switch self {
        case .divide, .multiple, .minus, .plus, .equal:
            return 45
        default:
            return 35
        }
    }

    var buttonFontWeight: Font.Weight {
        switch self {
        case .divide, .multiple, .minus, .plus, .equal:
            return Font.Weight.semibold
        default:
            return Font.Weight.regular
        }
    }
}
