//
//  CustomButton.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 23/01/25.
//

import SwiftUI

struct CustomActionButton: View {
    var title: String
    var isLoading: Bool = false
    var action: () -> Void
    var backgroundColor: Color = Color("Black")
    var foregroundColor: Color = Color.white
    var cornerRadius: CGFloat = 10

    var body: some View {
        Button(action: {
            if !isLoading {
                action()
            }
        }) {
            ZStack {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color("Orange")))
                } else {
                    Text(title)
                        .font(.system(size: 17, weight: .medium))
                }
            }
            .foregroundColor(foregroundColor)
            .padding(.vertical, 16)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(backgroundColor, lineWidth: 1)
            )
        }
        .disabled(isLoading)
        .opacity(isLoading ? 0.7 : 1.0)
    }
}
