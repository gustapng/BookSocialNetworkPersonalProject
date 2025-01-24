//
//  CustomButton.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 23/01/25.
//

import SwiftUI

struct TextButton: View {
    var title: String
    var action: () -> Void
    var foregroundColor: Color = Color("Orange")

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(foregroundColor)
        }
    }
}
