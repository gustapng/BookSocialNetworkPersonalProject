//
//  CustomTextField.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 23/01/25.
//

import SwiftUI

struct CustomTextFieldPassword: View {
    var description: String
    var placeholder: String
    @State private var isPasswordVisible: Bool = false
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(description)
                .font(.system(size: 17,weight: .medium))
                .foregroundColor(Color("DarkGray"))
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack {
                if isPasswordVisible {
                    TextField("Digite sua senha", text: $text)
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.never)
                        .padding()
                } else {
                    SecureField("Digite sua senha", text: $text)
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.never)
                        .padding()
                }

                Button {
                    isPasswordVisible.toggle()
                } label: {
                    Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                        .foregroundColor(Color("Gray"))
                }
                .padding(.trailing, 16)
            }
            .frame(height: 50)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                .stroke(Color("Gray"), lineWidth: 1)
            )
        }
    }
}
