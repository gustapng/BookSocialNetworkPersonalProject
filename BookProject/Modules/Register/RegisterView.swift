//
//  RegisterView.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 27/01/25.
//

import SwiftUI

struct RegisterView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var rePassword: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var isRePasswordVisible: Bool = false
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            Spacer()

            VStack(spacing: AppSpacing.large) {
                Text("Cadastre-se")
                    .font(AppFonts.title)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text("Cadastre-se para acessar todos os recursos e aproveitar uma experiência completa em nosso app.")
                    .font(AppFonts.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(AppColors.gray)
            }

            Spacer()

            VStack(spacing: AppSpacing.large) {
                TextFieldWithDescription(description: "Nome Completo", placeholder: "Seu nome", text: $name)
                TextFieldWithDescription(description: "Email", placeholder: "Seu email", text: $email)
                CustomTextFieldPassword(description: "Senha", placeholder: "Digite sua senha", text: $password)
                CustomTextFieldPassword(description: "Confirmar senha", placeholder: "Confirme sua senha sua senha", text: $rePassword)
            }

            Spacer()

            CustomButton(title: "Registrar") {
                print("register")
            }

            Spacer()

            HStack {
                Text("Já possui conta?")
                    .font(AppFonts.body)
                    .foregroundStyle(AppColors.gray)

                TextLinkButton(title: "Fazer login", textColor: AppColors.blue) {
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
    RegisterView()
}
