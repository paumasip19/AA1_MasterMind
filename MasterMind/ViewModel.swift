//
//  ViewModel.swift
//  MasterMind
//
//  Created by Alumne on 9/3/21.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var combinations: [Row]
    
    init(combinations: [Row]){
        self.combinations = combinations
    }
    
    func ChangeColor(i: Int, j: Int, col: Color) {
        combinations[i].color[j] = col
    }
}
