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
    var selectedCell: SelectedCell

    private var verticalSpacing: CGFloat {
        let screenHeight = UIScreen.main.bounds.height
        if screenHeight > 736 { // taller than 8 Plus
            return 40
        } else if screenHeight > 667 { // 8 Plus
            return 26
        } else { // 8, SE (2nd gen)
            return 12
        }
    }

    private var clearButtonHorizontalPadding: CGFloat {
        let screenHeight = UIScreen.main.bounds.height
        if screenHeight > 736 { // taller than 8 Plus
            return 24
        } else { // 8 Plus, 8, SE (2nd gen)
            return 16
        }
    }

    private var clearButtonVerticalPadding: CGFloat {
        let screenHeight = UIScreen.main.bounds.height
        if screenHeight > 736 { // taller than 8 Plus
            return 14
        } else { // 8 Plus, 8, SE (2nd gen)
            return 10
        }
    }

    var body: some View {
        VStack(spacing: verticalSpacing) {
            Text("Sudoku")
                .font(.title)
            Grid()
            HStack(spacing: 0) {
                Spacer()
                KeysRow()
                Spacer()
            }
            Button(action: {}) {
                Text("Clear")
                    .foregroundColor(.black)
            }
                .padding(.horizontal, clearButtonHorizontalPadding)
                .padding(.vertical, clearButtonVerticalPadding)
                .background(Color.gray.opacity(0.4))
                .cornerRadius(8)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
