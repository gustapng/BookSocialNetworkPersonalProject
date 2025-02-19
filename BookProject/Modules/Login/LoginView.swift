//
//  LoginView.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 21/01/25.
//

import SwiftUI

struct LoginView: View {
    var router = LoginRouter()
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                VStack(spacing: AppSpacing.large) {
                    Text("Bem-vindo de volta!")
                        .font(AppFonts.title)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Text("Olá, você deve fazer login primeiro para poder usar o aplicativo e desfrutar de todos os recursos.")
                        .font(AppFonts.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(AppColors.gray)
                }

                Spacer()

                VStack(spacing: AppSpacing.large) {
                    TextFieldWithDescription(description: "Email", placeholder: "Seu email", text: $email)
                    CustomTextFieldPassword(description: "Senha", placeholder: "Digite sua senha", text: $password)

                    NavigationLink(destination: router.navigateToForgotPasswordView()) {
                        Text("Esqueceu sua senha?")
                            .foregroundColor(AppColors.orange)
                            .font(AppFonts.body)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }

                Spacer()

                VStack(spacing: AppSpacing.large) {
                    CustomButton(title: "Login") {
                        print("login")
                    }

                    HStack {
                        Rectangle()
                            .frame(height: 1)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(AppColors.gray)

                        Text("ou")
                            .foregroundColor(AppColors.gray)

                        Rectangle()
                            .frame(height: 1)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color("Gray"))
                    }

                    CustomOutlinedButton(title: "Continue com Google", imageName: "google") {
                        print("login with google")
                    }
                }
                .padding(.vertical, AppSpacing.extraLargeBottomButton)

                HStack {
                    Text("Não possuí conta?")
                        .font(AppFonts.body)
                        .foregroundStyle(AppColors.gray)

                    NavigationLink(destination: router.navigateToRegisterView()) {
                        Text("Cadastre-se")
                            .foregroundColor(AppColors.blue)
                            .font(AppFonts.body)
                    }
                }
            }
            .padding(.horizontal, AppSpacing.large)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LoginView()
}
