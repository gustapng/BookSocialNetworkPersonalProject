//
//  CustomButton.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 23/01/25.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var action: () -> Void
    var backgroundColor: Color = Color("Black")
    var foregroundColor: Color = Color("White")
    var borderColor: Color = Color("Black")
    var cornerRadius: CGFloat = 10

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 17, weight: .medium))
                .foregroundColor(foregroundColor)
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity)
                .background(backgroundColor)
                .cornerRadius(cornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(borderColor, lineWidth: 2)
                )
        }
    }
}
