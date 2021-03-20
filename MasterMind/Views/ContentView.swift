//
//  ContentView.swift
//  MasterMind
//
//  Created by Alumne on 9/3/21.
//

import SwiftUI

struct Row: Hashable {
    let number: Int
    var color: [Color]
    var indicators: [Color]
}

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    
    @State static public var showPopUpWin = false
    @State static public var showPopUpLoss = false
    
    var body: some View {
        
        ZStack
        {
            VStack {
                Text("MasterMind")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.orange)
                VStack {
                    ForEach(viewModel.combinations, id: \.self) { row in
                        RowView(firstColor: row.color[0],
                                secondColor: row.color[1],
                                thirdColor: row.color[2],
                                fourthColor: row.color[3],
                                indicators: row.indicators,
                                myRowID: row.number,
                                viewModel: viewModel)
                    }
                }
                HStack {
                    Button("Reseteja", action: viewModel.restartGame )
                        .padding()
                    Button("Comprova", action: viewModel.checkTry )
                        .padding()
                }
            }
            
            if ContentView.showPopUpWin {
                ZStack {
                    Color.white
                    VStack {
                        Text("Has guanyat!!!")
                        Spacer()
                        Button(action: {
                            viewModel.restartGame()
                            ContentView.showPopUpWin = false
                        }, label: {
                            Text("Reseteja el joc")
                        })
                    }.padding()
                }
                .frame(width: 200, height: 100)
                .cornerRadius(20).shadow(radius: 20)
            }
            
            if ContentView.showPopUpLoss {
                ZStack {
                    Color.white
                    VStack {
                        Text("Has perdut!!!")
                        Spacer()
                        Button(action: {
                            viewModel.restartGame()
                            ContentView.showPopUpLoss = false
                        }, label: {
                            Text("Reseteja el joc")
                        })
                    }.padding()
                }
                .frame(width: 200, height: 100)
                .cornerRadius(20).shadow(radius: 20)
            }
            
            //self.showPopUpWin = viewModel.getWin()
            //self.showPopUpLoss = viewModel.getLoss()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let rowList: [Row] = [
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
            Row(number: 11, color: [.white, .white, .white, .white], indicators: [.black, .black, .black, .black]),
            Row(number: 8, color: [.white, .white, .white, .white], indicators: [.black, .black, .black, .black])
         ]
        ContentView(viewModel: ViewModel(combinations: rowList))
    }
}
