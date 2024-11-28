//
//  MainView.swift
//  Calculator
//
//  Created by Алексей Чумаков on 27.11.2024.
//

import SwiftUI

struct MainView: View {

    // MARK: Property
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
                    Text("0")
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
                                // action
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
