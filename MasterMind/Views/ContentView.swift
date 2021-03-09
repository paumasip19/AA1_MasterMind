//
//  ContentView.swift
//  MasterMind
//
//  Created by Alumne on 9/3/21.
//

import SwiftUI

struct row {
    let number: Int
    let color: [Color]
}

struct ContentView: View {
    var rowList: [row] = [
        row(number: 1, color: [.blue, .blue, .blue, .blue]),
        row(number: 2, color: [.blue, .blue, .blue, .blue]),
        row(number: 3, color: [.blue, .blue, .blue, .blue]),
        row(number: 4, color: [.blue, .blue, .blue, .blue]),
        row(number: 5, color: [.blue, .blue, .blue, .blue])
     ]
    
    var body: some View {
        VStack {
            Text("MasterMind")
                .font(.title)
                .foregroundColor(.white)
                .padding()
                .background(Color.orange)
            VStack {
                ForEach(rowList, id:\.number) { row in
                    
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
        ContentView()
    }
}
