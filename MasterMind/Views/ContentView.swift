//
//  ContentView.swift
//  MasterMind
//
//  Created by Alumne on 9/3/21.
//

import SwiftUI

struct row: Hashable {
    let number: Int
    let color: [Color]
}

struct ContentView: View {
    var rowList: [row]
    
    var body: some View {
        VStack {
            Text("MasterMind")
                .font(.title)
                .foregroundColor(.white)
                .padding()
                .background(Color.orange)
            VStack {
                ForEach(rowList, id: \.self) { row in
                    RowView(firstColor: row.color[0],
                            secondColor: row.color[1],
                            thirdColor: row.color[2],
                            fourthColor: row.color[3])
                }
            }
            HStack {
                Text("Tried 2 times")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.orange)
                Button("Start", action: doNothing)
                    .padding()
            }
        }
    }
}

extension ContentView {
    func doNothing() {}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let rowList: [row] = [
            row(number: 1, color: [.yellow, .yellow, .blue, .red]),
            row(number: 2, color: [.blue, .blue, .red, .blue]),
            row(number: 3, color: [.blue, .blue, .blue, .blue]),
            row(number: 4, color: [.blue, .blue, .blue, .blue]),
            row(number: 5, color: [.blue, .blue, .blue, .blue]),
            row(number: 6, color: [.blue, .blue, .blue, .blue]),
            row(number: 7, color: [.blue, .blue, .blue, .blue]),
            row(number: 8, color: [.blue, .blue, .blue, .blue])
         ]
        ContentView(rowList: rowList)
    }
}
