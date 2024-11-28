//
//  CalculatorApp.swift
//  Calculator
//
//  Created by Алексей Чумаков on 27.11.2024.
//

import SwiftUI

@main
struct CalculatorApp: App {

    @StateObject var viewModel = ViewModel()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(viewModel)
        }
    }
}
