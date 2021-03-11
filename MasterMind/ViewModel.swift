//
//  ViewModel.swift
//  MasterMind
//
//  Created by Alumne on 9/3/21.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var combinations: [Row]
    
    init(combinations: [Row]){
        self.combinations = combinations
    }
    
}
