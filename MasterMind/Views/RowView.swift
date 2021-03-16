//
//  RowView.swift
//  MasterMind
//
//  Created by Alumne on 9/3/21.
//

import SwiftUI

struct ColorButton: View {
    var color: Color
    
    private let width: CGFloat = 50.0
    private let height: CGFloat = 50.0
    
    
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

struct RowView: View {
    var firstColor: Color
    var secondColor: Color
    var thirdColor: Color
    var fourthColor: Color
    
    var indicators: [Color] = [.black, .black, .black, .black]
    
    private let width: CGFloat = 50.0
    private let height: CGFloat = 50.0
    
    let myRowID: Int
    
    let viewModel: ViewModel
    
    var body: some View {
        HStack {
            VStack{
                HStack {
                    Circle()
                        .fill(indicators[0])
                        .frame(width: self.width/2, height: self.height/2)
                        .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                    
                    Circle()
                        .fill(indicators[1])
                        .frame(width: self.width/2, height: self.height/2)
                        .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                }
                HStack {
                    Circle()
                        .fill(indicators[2])
                        .frame(width: self.width/2, height: self.height/2)
                        .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                    Circle()
                        .fill(indicators[3])
                        .frame(width: self.width/2, height: self.height/2)
                        .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)

                }
            }
            ColorButton(color: self.firstColor, buttonID: 0, rowID: self.myRowID, viewModel: viewModel)
            ColorButton(color: self.secondColor, buttonID: 1, rowID: self.myRowID, viewModel: viewModel)
            ColorButton(color: self.thirdColor, buttonID: 2, rowID: self.myRowID, viewModel: viewModel)
            ColorButton(color: self.fourthColor, buttonID: 3, rowID: self.myRowID, viewModel: viewModel)
        }
        .padding(5)
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        let row = Row(number: 1, color: [.red, .green, .blue, .white])
        
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
        
        RowView(firstColor: row.color[0],
                secondColor: row.color[1],
                thirdColor: row.color[2],
                fourthColor: row.color[3],
                myRowID: 0,
                viewModel: ViewModel(combinations: rowList));
    }
}
