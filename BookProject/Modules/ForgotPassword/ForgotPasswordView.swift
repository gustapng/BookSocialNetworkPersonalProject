//
//  ForgotPasswordView.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 28/01/25.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email: String = ""
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            VStack(spacing: AppSpacing.large) {
                Text("Esqueceu sua senha?")
                    .font(AppFonts.title)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text("Não se preocupe! Isso ocorre. Por favor, insira o endereço de e-mail vinculado à sua conta.")
                    .font(AppFonts.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(AppColors.gray)
            }
            .padding(.vertical, AppSpacing.extraLarge)

            Spacer()
            
            Image("Illustration-4")
                .resizable()
                .scaledToFit()

            VStack(spacing: AppSpacing.large) {
                TextFieldWithDescription(description: "Email", placeholder: "Seu email", text: $email)

                CustomButton(title: "Enviar código") {
                    print("send code")
                }
            }
            .padding(.vertical, AppSpacing.extraLargeBottomButton)

            HStack {
                Text("Voltar para o")
                    .font(AppFonts.body)
                    .foregroundStyle(AppColors.gray)

                TextLinkButton(title: "Login", textColor: AppColors.orange) {
                    print("navigate to login")
                    dismiss()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .padding(.horizontal, AppSpacing.large)
    }
}

#Preview {
    ForgotPasswordView()
}
