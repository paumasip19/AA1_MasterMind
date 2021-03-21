//
//  RowView.swift
//  MasterMind
//
//  Created by Alumne on 9/3/21.
//

import SwiftUI

struct RowView: View {
    var firstColor: Color
    var secondColor: Color
    var thirdColor: Color
    var fourthColor: Color
    
    var indicators: [Color]
    
    private let width: CGFloat = 25.0
    private let height: CGFloat = 25.0
    
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
        let row = Row(number: 1, color: [.red, .green, .blue, .white], indicators: [.black, .black, .black, .black])
        
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
            Row(number: 12, color: [.white, .white, .white, .white], indicators: [.black, .black, .black, .black])
         ]
        
        RowView(firstColor: row.color[0],
                secondColor: row.color[1],
                thirdColor: row.color[2],
                fourthColor: row.color[3],
                indicators: row.indicators,
                myRowID: 0,
                viewModel: ViewModel(combinations: rowList));
    }
}
