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
            let rowList: [row] = [
                row(number: 1, color: [.yellow, .yellow, .blue, .red]),
                row(number: 2, color: [.blue, .blue, .red, .blue]),
                row(number: 3, color: [.blue, .blue, .blue, .blue]),
                row(number: 4, color: [.blue, .blue, .blue, .blue]),
                row(number: 5, color: [.blue, .blue, .blue, .blue])
             ]
            ContentView(rowList: rowList)
        }
    }
}
