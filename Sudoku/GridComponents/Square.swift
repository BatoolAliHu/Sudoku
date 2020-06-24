//
//  Square.swift
//  Sudoku
//
//  Created by Raymond Kim on 6/2/20.
//  Copyright © 2020 Self. All rights reserved.
//

import SwiftUI

struct Square: View {

    struct RowCol {
        let row: Int
        let col: Int
    }
    
    let index: Int
    let selectedRowColIndex: RowCol?
    let startingGrid: [CoordinateValue]

    private let columns = [0, 1, 2]
    private var borderWidth: CGFloat {
        screenHeight > 667 ? 3 : 2
    }

    var body: some View {
        VStack(alignment: .leading) {
            Row(viewModel: RowViewModel(index: 0,
                                        columns: columns,
                                        squareIndex: index,
                                        selectedColumnIndex: selectedRowColIndex?.row == 0 ? selectedRowColIndex?.col : nil,
                                        startingGrid: startingGrid))
            Row(viewModel: RowViewModel(index: 1,
                                        columns: columns,
                                        squareIndex: index,
                                        selectedColumnIndex: selectedRowColIndex?.row == 1 ? selectedRowColIndex?.col : nil,
                                        startingGrid: startingGrid))
            Row(viewModel: RowViewModel(index: 2,
                                        columns: columns,
                                        squareIndex: index,
                                        selectedColumnIndex: selectedRowColIndex?.row == 2 ? selectedRowColIndex?.col : nil,
                                        startingGrid: startingGrid))
        }
        .border(Color.black, width: borderWidth)
    }
}

struct Square_Previews: PreviewProvider {
    static var previews: some View {
        Square(index: 0, selectedRowColIndex: nil, startingGrid: GridFactory.easyGrid)
    }
}
