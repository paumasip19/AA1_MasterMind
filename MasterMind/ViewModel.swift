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
                    var exact: Int = 0
                    
                    //Exact place and color
                    for(index, _) in realCombination.enumerated() {
                        if(realCombination[index] == actualComb[index])
                        {
                            exact += 1
                        }
                    }
                    
                    
                    //Exact color, not place
        
                    var red: [Int] = [0, 0]
                    var green: [Int] = [0, 0]
                    var blue: [Int] = [0, 0]
                    var black: [Int] = [0, 0]
                    
                    for (index, _) in actualComb.enumerated() {
                        switch actualComb[index] {
                            case .red:
                                red[0] += 1

                            case .green:
                                green[0] += 1

                            case .blue:
                                blue[0] += 1
                                
                            case .black:
                                black[0] += 1
                                
                            default:
                                print("Error in combination")
                        }
                    }
                    
                    for (index, _) in realCombination.enumerated() {
                        switch realCombination[index] {
                            case .red:
                                red[1] += 1

                            case .green:
                                green[1] += 1

                            case .blue:
                                blue[1] += 1
                                
                            case .black:
                                black[1] += 1
                                
                            default:
                                print("Error in combination")
                        }
                    }
                    
                    var notExact: Int = 0
                    
                    if(red[0] == red[1]) { notExact += red[0] }
                    if(green[0] == green[1]) { notExact += green[0] }
                    if(blue[0] == blue[1]) { notExact += blue[0] }
                    if(black[0] == black[1]) { notExact += black[0] }
                    
                    notExact -= exact
                    
                    var tempExact: Int = exact
                    
                    for(index, _) in combinations[actualTry].indicators.enumerated() {
                        if(tempExact != 0)
                        {
                            combinations[actualTry].indicators[index] = .red
                            tempExact -= 1
                        }
                        else
                        {
                            if(notExact != 0)
                            {
                                combinations[actualTry].indicators[index] = .white
                                notExact -= 1
                            }
                        }
                    }
                                      
                    actualTry += 1
                }
                
            }
        }
    }
}
