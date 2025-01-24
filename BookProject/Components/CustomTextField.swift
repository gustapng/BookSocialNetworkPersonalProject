//
//  CustomTextField.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 23/01/25.
//

import SwiftUI

struct CustomTextField: View {
    var description: String
    var placeholder: String
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(description)
                .font(.system(size: 17,weight: .medium))
                .foregroundColor(Color("DarkGray"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 26)

            TextField(placeholder, text: $text)
                .disableAutocorrection(true)
                .padding()
                .frame(height: 50)
                .padding(.horizontal, 26)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("Gray"), lineWidth: 1)
                    .padding(.horizontal, 26)
                )
        }
    }
}
