//
//  CustomButton.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 23/01/25.
//

import SwiftUI

struct CustomOutlinedButton: View {
    var title: String
    var action: () -> Void
    var backgroundColor: Color = Color("Black")
    var foregroundStyle: Color = Color("Gray")
    var borderColor: Color = Color("Gray")
    var cornerRadius: CGFloat = 10

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 17, weight: .medium))
                .foregroundStyle(foregroundStyle)
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(borderColor, lineWidth: 2)
                )
        }
    }
}
