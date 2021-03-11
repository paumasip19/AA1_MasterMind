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
                Row(number: 1, color: [.white, .white, .white, .white]),
                Row(number: 2, color: [.white, .white, .white, .white]),
                Row(number: 3, color: [.white, .white, .white, .white]),
                Row(number: 4, color: [.white, .white, .white, .white]),
                Row(number: 5, color: [.white, .white, .white, .white]),
                Row(number: 6, color: [.white, .white, .white, .white]),
                Row(number: 7, color: [.white, .white, .white, .white]),
                Row(number: 8, color: [.white, .white, .white, .white])
             ]
            ContentView(viewModel: ViewModel(combinations: rowList))
        }
    }
}
