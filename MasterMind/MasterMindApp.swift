//
//  MasterMindApp.swift
//  MasterMind
//
//  Created by Alumne on 9/3/21.
//

import SwiftUI

@main
struct MasterMindApp: App {
    var body: some Scene {
        WindowGroup {
            let rowList: [Row] = [
                Row(number: 0, color: [.white, .white, .white, .white], indicators: [.black, .black, .black, .black]),
                Row(number: 1, color: [.white, .white, .white, .white], indicators: [.black, .black, .black, .black]),
                Row(number: 2, color: [.white, .white, .white, .white], indicators: [.black, .black, .black, .black]),
                Row(number: 3, color: [.white, .white, .white, .white], indicators: [.black, .black, .black, .black]),
                Row(number: 4, color: [.white, .white, .white, .white], indicators: [.black, .black, .black, .black]),
                Row(number: 5, color: [.white, .white, .white, .white], indicators: [.black, .black, .black, .black]),
                Row(number: 6, color: [.white, .white, .white, .white], indicators: [.black, .black, .black, .black]),
                Row(number: 7, color: [.white, .white, .white, .white], indicators: [.black, .black, .black, .black]),
                Row(number: 8, color: [.white, .white, .white, .white], indicators: [.black, .black, .black, .black]),
                Row(number: 9, color: [.white, .white, .white, .white], indicators: [.black, .black, .black, .black]),
                Row(number: 10, color: [.white, .white, .white, .white], indicators: [.black, .black, .black, .black]),
                Row(number: 11, color: [.white, .white, .white, .white], indicators: [.black, .black, .black, .black])
             ]
            ContentView(viewModel: ViewModel(combinations: rowList))
        }
    }
}
