//
//  CustomButton.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 23/01/25.
//

import SwiftUI

struct TextLinkButton: View {
    var title: String
    var textColor: Color
    var action: () -> Void
    var fontSize: CGFloat = 15

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: fontSize, weight: .medium))
                .foregroundColor(textColor)
        }
    }
}
