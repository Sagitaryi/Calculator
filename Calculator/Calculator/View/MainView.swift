//
//  MainView.swift
//  Calculator
//
//  Created by Алексей Чумаков on 27.11.2024.
//

import SwiftUI

struct MainView: View {

    @EnvironmentObject var viewModel: ViewModel

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
                    Text(viewModel.value)
                        .foregroundStyle(.white)
                        .font(.system(size: Constants.displayCharacterSize))
                        .fontWeight(.light)
                        .padding(.horizontal, viewModel.buttonHeight() / 3)
                }

                // MARK: Buttons
                ForEach(viewModel.buttonsArray, id: \.self) { row in
                    HStack(spacing: Constants.spacing) {
                        ForEach(row, id: \.self) { item in
                            Button {
                                viewModel.didTap(item: item)
                            } label: {
                                    Text(item.rawValue)
                                    .padding(item == .zero ? viewModel.buttonHeight() / 2.5 : 0)
                                        .frame(
                                            width: viewModel.buttonWidth(item: item),
                                            height: viewModel.buttonHeight(),
                                            alignment: item == .zero ? .leading : .center
                                        )
                                        .foregroundStyle(item.buttonFontColor)
                                        .background(item.buttonColor)
                                        .font(.system(size: item.buttonFontSize))
                                        .fontWeight(item.buttonFontWeight)
                                        .clipShape(RoundedRectangle(cornerRadius: viewModel.buttonHeight()/2))
                            }
                        }
                    }
                }
            }
            .padding(.bottom, Constants.spacing * 3)
        }
    }
}

#Preview {
    MainView()
        .environmentObject(ViewModel())
}
