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
}

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    
    var count: Int = 0
    
    var body: some View {
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
                            myRowID: row.number,
                            viewModel: viewModel)
                }
            }
            Button("Comprova", action: viewModel.checkTry )
                .padding()
        }
    }
}

extension ContentView {
    func doNothing() {}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
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
        ContentView(viewModel: ViewModel(combinations: rowList))
    }
}
