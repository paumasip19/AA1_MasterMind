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
    
    var realCombination: [Color] = [.white, .white, .white, .white]
    
    let possibleColors: [Color] = [.red, .green, .blue, .black]
    
    var actualTry: Int = 0
    
    let maxTries: Int = 8
    
    init(combinations: [Row]){
        self.combinations = combinations
        
        for (index, _) in realCombination.enumerated() {
            realCombination[index] = possibleColors[Int.random(in: 0..<4)]
        }
        
    }
    
    func ChangeColor(i: Int, j: Int) {
        
        if(actualTry == i) {
            let col: Color = combinations[i].color[j]
            
            switch col {
                case possibleColors[0]:
                    combinations[i].color[j] = possibleColors[1]

                case possibleColors[1]:
                    combinations[i].color[j] = possibleColors[2]

                case possibleColors[2]:
                    combinations[i].color[j] = possibleColors[3]
                    
                case possibleColors[3]:
                    combinations[i].color[j] = possibleColors[0]

                default:
                    combinations[i].color[j] = possibleColors[0]
                                
            }
        }
        
    }
    
    func checkTry()
    {
        if(actualTry <= maxTries - 1)
        {
            let actualComb: [Color] = combinations[actualTry].color
            
            if(actualComb == realCombination) {
                
                print("You Win!!!")
                actualTry = -1
            }
            else
            {
                if(actualTry == maxTries - 1)
                {
                    print("You Lost!!!")
                }
                else
                {
                    //Posar botons del costat
                    combinations[actualTry].indicators[0] = .red
                    actualTry += 1
                    
                }
                
            }
        }
    }
}
