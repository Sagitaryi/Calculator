//
//  MainView.swift
//  Calculator
//
//  Created by Алексей Чумаков on 27.11.2024.
//

import SwiftUI

struct MainView: View {
    // MARK: Properties
    @State private var value = "0"
    @State private var number: Double = 0.0
    @State private var currentOperation: Operation = .none

    let buttonsArray: [[Buttons]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiple],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equal]
    ]

    var body: some View {

        ZStack {
            // MARK: Background
            Color.black
                .ignoresSafeArea()

            VStack(spacing: Constants.spacing) {

                Spacer()
                // MARK: Display
                HStack {
                    Spacer()
                    Text(value)
                        .foregroundStyle(.white)
                        .font(.system(size: Constants.displayCharacterSize))
                        .fontWeight(.light)
                        .padding(.horizontal, buttonHeight() / 3)
                }

                // MARK: Buttons
                ForEach(buttonsArray, id: \.self) { row in
                    HStack(spacing: Constants.spacing) {
                        ForEach(row, id: \.self) { item in
                            Button {
                                didTap(item: item)
                            } label: {
                                    Text(item.rawValue)
                                    .padding(item == .zero ? buttonHeight() / 2.5 : 0)
                                        .frame(
                                            width: self.buttonWidth(item: item),
                                            height: self.buttonHeight(),
                                            alignment: item == .zero ? .leading : .center
                                        )
                                        .foregroundStyle(item.buttonFontColor)
                                        .background(item.buttonColor)
                                        .font(.system(size: item.buttonFontSize))
                                        .fontWeight(item.buttonFontWeight)
                                        .clipShape(RoundedRectangle(cornerRadius: buttonHeight()/2))
                            }
                        }
                    }
                }
            }
            .padding(.bottom, Constants.spacing * 3)
        }
    }

// MARK: Tap Button Method
    func didTap(item: Buttons) {
        switch item {
        case .plus, .minus, .multiple, .divide:
            currentOperation = item.buttonToOperation()
            number = Double(value) ?? 0
            value = "0"
        case .equal:
            if let currentValue = Double(value) {
                value = formatResult(performOperation(currentValue))
            }
        case .decimal:
            if !value.contains(",") {
                value += ","
            }
        case .percent:
            if let currentValue = Double(value) {
                value = formatResult(currentValue / 100)
            }
        case .negative:
            if let currentValue = Double(value) {
                value = formatResult(-currentValue / 100)
            }
        case .clear:
            value = "0"
        default:
            if value == "0" {
                value = item.rawValue
            } else {
                value += item.rawValue
                }
        }
    }

    // MARK: Helper Calculate Method
    func performOperation(_ currentValue: Double) -> Double {
        switch currentOperation {
        case .addition:
            return number + currentValue
        case .subtract:
            return number - currentValue
        case .multiply:
            return number * currentValue
        case .divide:
            return number / currentValue
        default:
            return currentValue
        }
    }

    // MARK: Remove last zero Method
    func formatResult(_ result: Double) -> String {
        return String(format: "%g", result)
    }

    // MARK: Size of Buttons Methods
    func buttonWidth(item: Buttons) -> CGFloat {
        let width: CGFloat
        let spacing: CGFloat = Constants.spacing
        let totalSpacing: CGFloat = 5 * spacing
        let totalColumns: CGFloat = 4
        let screenWidth = UIScreen.main.bounds.width

        if item == .zero {
            width = (screenWidth - totalSpacing) / totalColumns * 2 + spacing
        } else {
            width = (screenWidth - totalSpacing) / totalColumns
        }
        return width
    }

    func buttonHeight() -> CGFloat {
        let spacing: CGFloat = Constants.spacing
        let totalSpacing: CGFloat = 5 * spacing
        let totalColumns: CGFloat = 4
        let screenWidth = UIScreen.main.bounds.width

        return (screenWidth - totalSpacing) / totalColumns
    }
}

#Preview {
    MainView()
}
