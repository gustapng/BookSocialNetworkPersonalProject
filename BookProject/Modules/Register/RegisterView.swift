//
//  RegisterView.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 27/01/25.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var presenter: RegisterPresenter
    var router: RegisterRouter
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var isconfirmPasswordVisible: Bool = false
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            VStack(spacing: AppSpacing.large) {
                Text("Cadastre-se")
                    .font(AppFonts.title)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text("Cadastre-se para acessar todos os recursos e aproveitar uma experiência completa em nosso app.")
                    .font(AppFonts.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(AppColors.gray)
            }
            .padding(.vertical, AppSpacing.extraLarge)

            Spacer()

            VStack(spacing: AppSpacing.large) {
                TextFieldWithDescription(description: "Nome Completo", placeholder: "Seu nome", text: $name)
                TextFieldWithDescription(description: "Email", placeholder: "Seu email", isEmail: true, text: $email)
                CustomTextFieldPassword(description: "Senha", placeholder: "Digite sua senha", text: $password)
                CustomTextFieldPassword(description: "Confirmar senha", placeholder: "Confirme sua senha sua senha", text: $confirmPassword)
            }

            Spacer()

            CustomActionButton(title: "Registrar", isLoading: presenter.isLoading) {
                presenter.register(name: name, email: email, password: password, confirmPassword: confirmPassword)
            }
            .padding(.vertical, AppSpacing.extraLargeBottomButton)

            HStack {
                Text("Já possui conta?")
                    .font(AppFonts.body)
                    .foregroundStyle(AppColors.gray)

                TextLinkButton(title: "Fazer login", textColor: AppColors.blue) {
                    dismiss()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .padding(.horizontal, AppSpacing.large)
        .alert("", isPresented: $presenter.error, actions: {
            Button("OK", role: .cancel) { }
        }, message: {
            Text(presenter.message ?? "Ocorreu um erro.")
        })
        .alert("Sucesso", isPresented: $presenter.success, actions: {
            Button("OK", role: .cancel) {
                dismiss()
            }
        }, message: {
            Text(presenter.message ?? "Cadastro realizado com sucesso!")
        })
    }
}

#Preview {
    let interactor = RegisterInteractor()
    let router = RegisterRouter()
    let presenter = RegisterPresenter(interactor: interactor, router: router)

    interactor.presenter = presenter

    return RegisterView(presenter: presenter, router: router)
}
