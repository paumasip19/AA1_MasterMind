//
//  ColorButtonView.swift
//  MasterMind
//
//  Created by Mireia on 18/3/21.
//

import Foundation
import SwiftUI

struct ColorButton: View {
    var color: Color
    
    private let width: CGFloat = 30.0
    private let height: CGFloat = 30.0
    
    
    var count: Int = 0
    
    let buttonID: Int
    let rowID: Int

    let viewModel: ViewModel
    
    var body: some View {
        Button("    ", action: {
                viewModel.ChangeColor(i: rowID, j: buttonID)
            
        })
            .frame(width: self.width, height: self.height)
            .background(color)
            .foregroundColor(.black)
            .cornerRadius(30)
            .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
            .padding(5)
    }
}
