//
//  ForgotPasswordView.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 28/01/25.
//

import SwiftUI

struct ForgotPasswordView: View {
    @ObservedObject var presenter: ForgotPasswordPresenter
    var router: ForgotPasswordRouter
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
                TextFieldWithDescription(description: "Email", placeholder: "Seu email", isEmail: true, text: $email)

                CustomActionButton(title: "Registrar", isLoading: presenter.isLoading) {
                    presenter.forgotPassword(email: email)
                }
            }
            .padding(.vertical, AppSpacing.extraLargeBottomButton)

            HStack {
                Text("Voltar para o")
                    .font(AppFonts.body)
                    .foregroundStyle(AppColors.gray)

                TextLinkButton(title: "Login", textColor: AppColors.orange) {
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
            Text(presenter.message ?? "Enviamos um e-mail para a recuperação da sua conta. Verifique sua caixa de entrada!")
        })
    }
}

#Preview {
    let interactor = ForgotPasswordInteractor()
    let router = ForgotPasswordRouter()
    let presenter = ForgotPasswordPresenter(interactor: interactor, router: router)

    interactor.presenter = presenter

    return ForgotPasswordView(presenter: presenter, router: router)
}
