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
    
    private let width: CGFloat = 50.0
    private let height: CGFloat = 50.0
    
    var body: some View {
        HStack {
            Circle()
                .fill(firstColor)
                .frame(width: self.width, height: self.height)
                .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                .padding(5)
            Circle()
                .fill(secondColor)
                .frame(width: self.width, height: self.height)
                .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                .padding(5)
            Circle()
                .fill(firstColor)
                .frame(width: self.width, height: self.height)
                .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                .padding(5)
            Circle()
                .fill(firstColor)
                .frame(width: self.width, height: self.height)
                .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                .padding(5)
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(firstColor: .red,
                secondColor: .green,
                thirdColor: .blue,
                fourthColor: .yellow)
    }
}
