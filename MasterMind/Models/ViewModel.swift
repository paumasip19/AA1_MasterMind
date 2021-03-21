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
    
    @Published var justEntered = true
    @Published var showPopUpWin = false
    @Published var showPopUpLoss = false
    
    var realCombination: [Color] = [.white, .white, .white, .white]
    
    let possibleColors: [Color] = [.red, .green, .blue, .black]
    
    var actualTry: Int = 0
    let maxTries: Int = 12
    
    var win: Bool = false
    var loss: Bool = false
    
    init(combinations: [Row]){
        self.combinations = combinations
        
        self.win = false;
        self.loss = false
        actualTry = 0
        
        for (index, _) in realCombination.enumerated() {
            realCombination[index] = possibleColors[Int.random(in: 0..<4)]
        }
        
        self.combinations[actualTry].color = [.red, .red, .red, .red]
                
    }
    
    func ChangeColor(i: Int, j: Int) {
        
        if(actualTry == i && self.win == false && self.loss == false && justEntered == false) {
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
        if(actualTry <= maxTries - 1 && self.win == false && self.loss == false && justEntered == false)
        {
            let actualComb: [Color] = combinations[actualTry].color
            
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
            
            win = checkWin(actualComb: actualComb)
            loss = checkLoss()
            
            if(actualTry < maxTries && win == false && loss == false)
            {
                combinations[actualTry].color = [.red, .red, .red, .red]
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
    
    func checkWin(actualComb: [Color]) -> Bool
    {
        if(actualComb == realCombination) {
            
            print("You Win!!!")
            showPopUpWin = true
            return true
        }
        return false
    }
    
    func checkLoss() -> Bool
    {
        if(actualTry == maxTries) {
            
            print("You Lost!!!")
            showPopUpLoss = true
            return true
        }
        return false
    }
    
    func restartGame() {
        self.combinations = rowList
        
        self.win = false
        self.loss = false
        actualTry = 0
        
        for (index, _) in realCombination.enumerated() {
            realCombination[index] = possibleColors[Int.random(in: 0..<4)]
        }
        
        self.combinations[actualTry].color = [.red, .red, .red, .red]
    }
    
    func getWin() -> Bool { return self.win }
    func getLoss() -> Bool { return self.loss }
}
