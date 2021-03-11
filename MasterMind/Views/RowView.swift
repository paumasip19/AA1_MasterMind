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
    
    public func action() {
        print("Hola")
    }
    
    var body: some View {
        HStack {
            VStack{
                HStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: self.width/2, height: self.height/2)
                        .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)

                    Circle()
                        .fill(Color.white)
                        .frame(width: self.width/2, height: self.height/2)
                        .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                }
                HStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: self.width/2, height: self.height/2)
                        .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                    Circle()
                        .fill(Color.white)
                        .frame(width: self.width/2, height: self.height/2)
                        .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)

                }
            }
            Button("", action: { action() })
                .frame(width: self.width, height: self.height)
                .background(firstColor)
                .foregroundColor(.black)
                .cornerRadius(30)
                .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                .padding(5)
            Button("", action: { action() })
                .frame(width: self.width, height: self.height)
                .background(secondColor)
                .foregroundColor(.black)
                .cornerRadius(30)
                .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                .padding(5)
            Button("", action: { action() })
                .frame(width: self.width, height: self.height)
                .background(thirdColor)
                .foregroundColor(.black)
                .cornerRadius(30)
                .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                .padding(5)
            Button("", action: { action() })
                .frame(width: self.width, height: self.height)
                .background(fourthColor)
                .foregroundColor(.black)
                .cornerRadius(30)
                .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                .padding(5)
        }
        .padding(5)
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
