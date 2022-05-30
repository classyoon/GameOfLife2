//
//  ContentView.swift
//  GameOfLife2
//
//  Created by Conner Yoon on 5/29/22.
//

import SwiftUI

struct Cow {
    
}

struct Tile : Identifiable {
    var color : Color {
        Color.gray
    }
    var id = UUID()
}
class BoardVM : ObservableObject {
    @Published var tiles : [[Tile]]
    static let RowMax = 10
    static let ColMax = 4
    
    init(){
        tiles = Array(repeating: Array(repeating: Tile(), count: BoardVM.ColMax), count: BoardVM.RowMax)
    }
}
struct BoardView : View {
    @ObservedObject var boardVM = BoardVM()
    
    var body: some View {
        VStack {
            ForEach(0..<BoardVM.RowMax, id: \.self) { row in
                HStack {
                    ForEach(0..<BoardVM.ColMax, id: \.self) { col in
                        boardVM.tiles[row][col].color
                    }
                }
                
            }
        }
    }
}
struct ContentView: View {
    var body: some View {
        BoardView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
