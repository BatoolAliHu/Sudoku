//
//  Grid.swift
//  Sudoku
//
//  Created by Raymond Kim on 6/2/20.
//  Copyright © 2020 Self. All rights reserved.
//

import SwiftUI

struct Grid: View {
    @EnvironmentObject
    var selectedCell: SelectedCell
    
    let startingGrid: [CoordinateValue]

    var body: some View {
        HStack(spacing: 0) {
            Spacer()
            VStack {
                HStack(spacing: 0) {
                    Square(index: 0,
                           selectedRowColIndex: transformSelectedCoordinate(squareIndex: 0),
                           startingGrid: startingGrid)
                    Square(index: 1,
                           selectedRowColIndex: transformSelectedCoordinate(squareIndex: 1),
                           startingGrid: startingGrid)
                    Square(index: 2,
                           selectedRowColIndex: transformSelectedCoordinate(squareIndex: 2),
                           startingGrid: startingGrid)
                }
                HStack(spacing: 0) {
                    Square(index: 3,
                           selectedRowColIndex: transformSelectedCoordinate(squareIndex: 3),
                           startingGrid: startingGrid)
                    Square(index: 4,
                           selectedRowColIndex: transformSelectedCoordinate(squareIndex: 4),
                           startingGrid: startingGrid)
                    Square(index: 5,
                           selectedRowColIndex: transformSelectedCoordinate(squareIndex: 5),
                           startingGrid: startingGrid)
                }
                HStack(spacing: 0) {
                    Square(index: 6,
                           selectedRowColIndex: transformSelectedCoordinate(squareIndex: 6),
                           startingGrid: startingGrid)
                    Square(index: 7,
                           selectedRowColIndex: transformSelectedCoordinate(squareIndex: 7),
                           startingGrid: startingGrid)
                    Square(index: 8,
                           selectedRowColIndex: transformSelectedCoordinate(squareIndex: 8),
                           startingGrid: startingGrid)
                }
            }
            Spacer()
        }
    }
    
    private func transformSelectedCoordinate(squareIndex: Int) -> Square.RowCol? {
        guard let coordinate = selectedCell.coordinate, coordinate.s == squareIndex else {
            return nil
        }
        return Square.RowCol(row: coordinate.r, col: coordinate.c)
    }
}

struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        Grid(startingGrid: GridFactory.easyGrid)
    }
}
