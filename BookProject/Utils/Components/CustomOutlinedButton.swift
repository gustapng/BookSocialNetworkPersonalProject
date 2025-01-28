//
//  CustomButton.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 23/01/25.
//

import SwiftUI

struct CustomOutlinedButton: View {
    var title: String
    var imageName: String? = nil
    var action: () -> Void
    var fontSize: CGFloat = 17
    var padding: CGFloat = 16
    var backgroundColor: Color = Color("Black")
    var foregroundStyle: Color = Color("Gray")
    var borderColor: Color = Color("Gray")
    var cornerRadius: CGFloat = 10

    var body: some View {
        Button(action: action) {
            HStack {
                if let imageName = imageName {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
                Text(title)
                    .font(.system(size: fontSize, weight: .medium))
            }
            .foregroundStyle(foregroundStyle)
            .padding(.vertical, padding)
            .frame(maxWidth: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor, lineWidth: 1)
            )
        }
    }
}
