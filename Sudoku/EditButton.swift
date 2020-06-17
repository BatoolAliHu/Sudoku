//
//  EditButton.swift
//  Sudoku
//
//  Created by Raymond Kim on 6/16/20.
//  Copyright © 2020 Self. All rights reserved.
//

import SwiftUI

struct EditButton: View {

    @EnvironmentObject
    private var editState: EditState

    private let editButtonHorizontalPadding: CGFloat = 18
    private var editButtonVerticalPadding: CGFloat {
        let screenHeight = UIScreen.main.bounds.height
        if screenHeight > 736 { // taller than 8 Plus
            return 10
        } else { // 8 Plus, 8, SE (2nd gen)
            return 8
        }
    }

    var body: some View {
        Button(action: {
            self.editState.isEditing.toggle()
        }) {
            Image(systemName: self.editState.isEditing ? "pencil.circle.fill" : "pencil.circle")
                .font(.system(size: 36, weight: .bold))
                .foregroundColor(Color("dynamicBlack"))
        }
            .padding(.horizontal, editButtonHorizontalPadding)
            .padding(.vertical, editButtonVerticalPadding)
    }
}

struct EditButton_Previews: PreviewProvider {
    static var previews: some View {
        EditButton()
    }
}
