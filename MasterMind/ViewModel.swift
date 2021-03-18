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
                    var red: [Int] = [0, 0, 0]
                    var green: [Int] = [0, 0, 0]
                    var blue: [Int] = [0, 0, 0]
                    var black: [Int] = [0, 0, 0]
                    
                    var exact: Int = 0
                    var actualInd: Int = 0
                    
                    //Exact place and color
                    for(index, _) in realCombination.enumerated() {
                        if(realCombination[index] == actualComb[index])
                        {
                            exact += 1
                            combinations[actualTry].indicators[actualInd] = .red
                            actualInd += 1
                            
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
                    }
                    
                    //Exact color, not place
                    
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
                    
                    for (index, _) in actualComb.enumerated() {
                        switch actualComb[index] {
                            case .red:
                                red[2] += 1

                            case .green:
                                green[2] += 1

                            case .blue:
                                blue[2] += 1
                                
                            case .black:
                                black[2] += 1
                                
                            default:
                                print("Error in combination")
                        }
                    }
                    
                    actualInd = checkColor(c: red, actInd: actualInd)
                    actualInd = checkColor(c: green, actInd: actualInd)
                    actualInd = checkColor(c: blue, actInd: actualInd)
                    actualInd = checkColor(c: black, actInd: actualInd)
 
                    actualTry += 1
                }
                
            }
        }
    }
    
    func checkColor(c: [Int], actInd: Int) -> Int
    {
        var color: [Int] = c
        var actIndTemp: Int = actInd
        
        var whitePegs: Int = 0
        
        if(color[0] != 0)
        {
            color[1] -= color[0]
            color[2] -= color[0]
        }
        
        if(color[2] != 0 && color[1] != 0)
        {
            if(color[1] == color[2])
            {
                whitePegs += color[1]
            }
            else if(color[1] < color[2])
            {
                whitePegs += color[1]
            }
            else if(color[1] > color[2])
            {
                whitePegs += color[2]
            }
        }
        
        for (index, _) in realCombination.enumerated()
        {
            if(index == actIndTemp && whitePegs != 0)
            {
                combinations[actualTry].indicators[index] = .white
                whitePegs -= 1
                actIndTemp += 1
            }
        }
        
        return actIndTemp
    }
    
}
