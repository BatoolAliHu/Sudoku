//
//  ContentView.swift
//  Sudoku
//
//  Created by Raymond Kim on 6/2/20.
//  Copyright © 2020 Self. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject
    private var selectedCell: SelectedCell
    @EnvironmentObject
    private var userAction: UserAction
    @EnvironmentObject
    private var editState: EditState
    @EnvironmentObject
    private var startingGrid: StartingGridValues
    @EnvironmentObject
    private var workingGrid: GridValues
    @EnvironmentObject
    private var editGrid: EditGridValues

    @State
    private var workingGridIsComplete = false

    private var verticalSpacing: CGFloat {
        let screenHeight = UIScreen.main.bounds.height
        if screenHeight > 736 { // taller than 8 Plus
            return 48
        } else if screenHeight > 667 { // 8 Plus
            return 26
        } else { // 8, SE (2nd gen)
            return 20
        }
    }

    private var clearButtonHorizontalPadding: CGFloat {
        let screenHeight = UIScreen.main.bounds.height
        if screenHeight > 736 { // taller than 8 Plus
            return 22
        } else { // 8 Plus, 8, SE (2nd gen)
            return 14
        }
    }

    private var clearButtonVerticalPadding: CGFloat {
        let screenHeight = UIScreen.main.bounds.height
        if screenHeight > 736 { // taller than 8 Plus
            return 10
        } else { // 8 Plus, 8, SE (2nd gen)
            return 8
        }
    }

    private let editButtonHorizontalPadding: CGFloat = 18
    private let clearButtonFont = Font.system(.title, design:.rounded).smallCaps()

    var body: some View {
        VStack(spacing: verticalSpacing) {
            Text("Sudoku")
                .font(.title)
            Grid()
            KeysRow(gridIsComplete: $workingGridIsComplete)
            HStack(spacing: 0) {
                Button(action: {
                    self.userAction.action = .clear

                    guard let selectedCoordinate = self.selectedCell.coordinate,
                        !self.startingGrid.containsAValue(at: selectedCoordinate) else {
                        // can't clear values that were part of starting board and unselected
                        return
                    }

                    // clear guesses regardless of editing mode
                    self.editGrid.removeValues(at: selectedCoordinate)

                    if !self.editState.isEditing {
                        self.workingGrid.removeValue(at: selectedCoordinate)
                    }
                }) {
                    Text("Clear")
                        .foregroundColor(.black)
                        .font(clearButtonFont)
                }
                    .padding(.horizontal, clearButtonHorizontalPadding)
                    .padding(.vertical, clearButtonVerticalPadding)
                    .background(Color("dynamicGray"))
                    .cornerRadius(8)
                EditButton()
            }
            Spacer()
        }
        .alert(isPresented: $workingGridIsComplete) {
            Alert(title: Text("Congratulations!"), message: Text("You've completed the sudoku!"), dismissButton: .default(Text("Dismiss")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
