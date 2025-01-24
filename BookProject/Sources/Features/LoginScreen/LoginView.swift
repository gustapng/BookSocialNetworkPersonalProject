//
//  LoginView.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 21/01/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false

    var body: some View {
        VStack(spacing: 22) {
            Text("Bem-vindo de volta!")
                .font(.system(size: 28,weight: .bold))
                .frame(maxWidth: 340, alignment: .leading)
                .padding(.horizontal, 26)

            Text("Olá, você deve fazer login primeiro para poder usar o aplicativo e desfrutar de todos os recursos.")
                .font(.system(size: 14,weight: .medium))
                .frame(maxWidth: 340, alignment: .leading)
                .foregroundStyle(Color("Gray"))
                .padding(.horizontal, 26)
                .padding(.top)

            CustomTextField(description: "Email", placeholder: "Seu email", text: $email)
            CustomTextFieldPassword(description: "Senha", placeholder: "Digite sua senha", text: $password)
            
            TextButton(title: "Esqueceu sua senha?") {
                print("click forget password")
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.horizontal, 26)
            
            CustomButton(title: "Login") {
                print("click Login")
            }
            .padding(.horizontal, 26)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LoginView()
}
