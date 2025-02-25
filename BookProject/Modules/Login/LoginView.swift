//
//  LoginView.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 21/01/25.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var presenter: LoginPresenter
    var router: LoginRouter
    @State private var email: String = ""
    @State private var password: String = ""
    @Environment(\.dismiss) private var dismiss

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
                    TextFieldWithDescription(description: "Email", placeholder: "Seu email", isEmail: true, text: $email)
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
                    CustomActionButton(title: "Login", isLoading: presenter.isLoading) {
                        presenter.login(email: email, password: password)
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
        .alert("", isPresented: $presenter.error, actions: {
            Button("OK", role: .cancel) { }
        }, message: {
            Text(presenter.message ?? "Ocorreu um erro.")
        })
        .alert("Sucesso", isPresented: $presenter.success, actions: {
            Button("OK", role: .cancel) {
                dismiss()
            }
        })
        .navigationDestination(isPresented: $presenter.navigateToHome) {
            router.navigateToHome()
        }
    }
}

#Preview {
    let interactor = LoginInteractor()
    let router = LoginRouter()
    let presenter = LoginPresenter(interactor: interactor, router: router)

//    interactor.presenter = presenter

    LoginView(presenter: presenter, router: router)
}
